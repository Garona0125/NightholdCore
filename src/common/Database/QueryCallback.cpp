/*
 *###############################################################################
 *#                                                                             #
 *# Copyright (C) 2022 Project Nighthold <https://github.com/ProjectNighthold>  #
 *#                                                                             #
 *# This file is free software; as a special exception the author gives         #
 *# unlimited permission to copy and/or distribute it, with or without          #
 *# modifications, as long as this notice is preserved.                         #
 *#                                                                             #
 *# This program is distributed in the hope that it will be useful, but         #
 *# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the      #
 *# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.    #
 *#                                                                             #
 *# Read the THANKS file on the source root directory for more info.            #
 *#                                                                             #
 *###############################################################################
 */

#include "QueryCallback.h"
#include "Errors.h"

template<typename T, typename... Args>
void Construct(T& t, Args&&... args)
{
    new (&t) T(std::forward<Args>(args)...);
}

template<typename T>
void Destroy(T& t)
{
    t.~T();
}

template<typename T>
void ConstructActiveMember(T* obj)
{
    if (!obj->_isPrepared)
        Construct(obj->_string);
    else
        Construct(obj->_prepared);
}

template<typename T>
void DestroyActiveMember(T* obj)
{
    if (!obj->_isPrepared)
        Destroy(obj->_string);
    else
        Destroy(obj->_prepared);
}

template<typename T>
void MoveFrom(T* to, T&& from)
{
    ASSERT(to->_isPrepared == from._isPrepared);

    if (!to->_isPrepared)
        to->_string = std::move(from._string);
    else
        to->_prepared = std::move(from._prepared);
}

struct QueryCallback::QueryCallbackData
{
public:
    friend class QueryCallback;

    QueryCallbackData(std::function<void(QueryCallback&, QueryResult)>&& callback) : _string(std::move(callback)), _isPrepared(false) { }
    QueryCallbackData(std::function<void(QueryCallback&, PreparedQueryResult)>&& callback) : _prepared(std::move(callback)), _isPrepared(true) { }
    QueryCallbackData(QueryCallbackData&& right) noexcept
    {
        _isPrepared = right._isPrepared;
        ConstructActiveMember(this);
        MoveFrom(this, std::move(right));
    }
    QueryCallbackData& operator=(QueryCallbackData&& right) noexcept
    {
        if (this != &right)
        {
            if (_isPrepared != right._isPrepared)
            {
                DestroyActiveMember(this);
                _isPrepared = right._isPrepared;
                ConstructActiveMember(this);
            }
            MoveFrom(this, std::move(right));
        }
        return *this;
    }
    ~QueryCallbackData() { DestroyActiveMember(this); }

private:
    QueryCallbackData(QueryCallbackData const&) = delete;
    QueryCallbackData& operator=(QueryCallbackData const&) = delete;

    template<typename T> friend void ConstructActiveMember(T* obj);
    template<typename T> friend void DestroyActiveMember(T* obj);
    template<typename T> friend void MoveFrom(T* to, T&& from);

    union
    {
        std::function<void(QueryCallback&, QueryResult)> _string;
        std::function<void(QueryCallback&, PreparedQueryResult)> _prepared;
    };
    bool _isPrepared;
};

// Not using initialization lists to work around segmentation faults when compiling with clang without precompiled headers
QueryCallback::QueryCallback(std::future<QueryResult>&& result)
{
    _isPrepared = false;
    Construct(_string, std::move(result));
}

QueryCallback::QueryCallback(std::future<PreparedQueryResult>&& result)
{
    _isPrepared = true;
    Construct(_prepared, std::move(result));
}

QueryCallback::QueryCallback(QueryCallback&& right) noexcept
{
    _isPrepared = right._isPrepared;
    ConstructActiveMember(this);
    MoveFrom(this, std::move(right));
    _callbacks = std::move(right._callbacks);
}

QueryCallback& QueryCallback::operator=(QueryCallback&& right) noexcept
{
    if (this != &right)
    {
        if (_isPrepared != right._isPrepared)
        {
            DestroyActiveMember(this);
            _isPrepared = right._isPrepared;
            ConstructActiveMember(this);
        }
        MoveFrom(this, std::move(right));
        _callbacks = std::move(right._callbacks);
    }
    return *this;
}

QueryCallback::~QueryCallback()
{
    DestroyActiveMember(this);
}

QueryCallback&& QueryCallback::WithCallback(std::function<void(QueryResult)>&& callback)
{
    return WithChainingCallback([callback](QueryCallback& /*this*/, QueryResult result) { callback(std::move(result)); });
}

QueryCallback&& QueryCallback::WithPreparedCallback(std::function<void(PreparedQueryResult)>&& callback)
{
    return WithChainingPreparedCallback([callback](QueryCallback& /*this*/, PreparedQueryResult result) { callback(std::move(result)); });
}

QueryCallback&& QueryCallback::WithChainingCallback(std::function<void(QueryCallback&, QueryResult)>&& callback)
{
    ASSERT(!_callbacks.empty() || !_isPrepared, "Attempted to set callback function for string query on a prepared async query");
    _callbacks.emplace(std::move(callback));
    return std::move(*this);
}

QueryCallback&& QueryCallback::WithChainingPreparedCallback(std::function<void(QueryCallback&, PreparedQueryResult)>&& callback)
{
    ASSERT(!_callbacks.empty() || _isPrepared, "Attempted to set callback function for prepared query on a string async query");
    _callbacks.emplace(std::move(callback));
    return std::move(*this);
}

void QueryCallback::SetNextQuery(QueryCallback&& next)
{
    MoveFrom(this, std::move(next));
}

QueryCallback::Status QueryCallback::InvokeIfReady()
{
    QueryCallbackData& callback = _callbacks.front();
    auto checkStateAndReturnCompletion = [this]()
    {
        _callbacks.pop();
        bool hasNext = !_isPrepared ? _string.valid() : _prepared.valid();
        if (_callbacks.empty())
        {
            ASSERT(!hasNext);
            return Completed;
        }

        // abort chain
        if (!hasNext)
            return Completed;

        ASSERT(_isPrepared == _callbacks.front()._isPrepared);
        return NextStep;
    };

    if (!_isPrepared)
    {
        if (_string.valid() && _string.wait_for(std::chrono::seconds(0)) == std::future_status::ready)
        {
            QueryResultFuture f(std::move(_string));
            std::function<void(QueryCallback&, QueryResult)> cb(std::move(callback._string));
            cb(*this, f.get());
            return checkStateAndReturnCompletion();
        }
    }
    else
    {
        if (_prepared.valid() && _prepared.wait_for(std::chrono::seconds(0)) == std::future_status::ready)
        {
            PreparedQueryResultFuture f(std::move(_prepared));
            std::function<void(QueryCallback&, PreparedQueryResult)> cb(std::move(callback._prepared));
            cb(*this, f.get());
            return checkStateAndReturnCompletion();
        }
    }

    return NotReady;
}
