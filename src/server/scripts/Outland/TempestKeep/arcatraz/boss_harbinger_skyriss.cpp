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

#include "ScriptMgr.h"
#include "arcatraz.h"
#include "InstanceScript.h"
#include "ObjectAccessor.h"
#include "ScriptedCreature.h"
#include "LFGMgr.h"
#include "Group.h"

enum Says
{
    SAY_INTRO               = 0,
    SAY_AGGRO               = 1,
    SAY_KILL                = 2,
    SAY_MIND                = 3,
    SAY_FEAR                = 4,
    SAY_IMAGE               = 5,
    SAY_DEATH               = 6
};

enum Spells
{
    SPELL_FEAR              = 39415,
    SPELL_MIND_REND         = 36924,
    H_SPELL_MIND_REND       = 39017,
    SPELL_DOMINATION        = 37162,
    H_SPELL_DOMINATION      = 39019,
    H_SPELL_MANA_BURN       = 39020,
    SPELL_66_ILLUSION       = 36931,                      
    SPELL_33_ILLUSION       = 36932,                 

    SPELL_MIND_REND_IMAGE   = 36929,
    H_SPELL_MIND_REND_IMAGE = 39021
};

// 20912
class boss_harbinger_skyriss : public CreatureScript
{
public:
    boss_harbinger_skyriss() : CreatureScript("boss_harbinger_skyriss") { }

    struct boss_harbinger_skyrissAI : public BossAI
    {
        boss_harbinger_skyrissAI(Creature* creature) : BossAI(creature, DATA_HARBINGER_SKYRISS)
        {
            Initialize();
            Intro = false;
            me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1);
            me->SetReactState(REACT_PASSIVE);
        }

        void Initialize()
        {
            IsImage33 = false;
            IsImage66 = false;

            Intro_Phase = 1;
            Intro_Timer = 5000;
            MindRend_Timer = 3000;
            Fear_Timer = 15000;
            Domination_Timer = 30000;
            ManaBurn_Timer = 25000;
        }

        bool Intro;
        bool IsImage33;
        bool IsImage66;

        uint32 Intro_Phase;
        uint32 Intro_Timer;
        uint32 MindRend_Timer;
        uint32 Fear_Timer;
        uint32 Domination_Timer;
        uint32 ManaBurn_Timer;

        void Reset() override
        {
            if (!Intro)
                me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1);

            Initialize();
        }

        void MoveInLineOfSight(Unit* who) override
        {
            if (!Intro)
                return;

            ScriptedAI::MoveInLineOfSight(who);
        }

        void JustDied(Unit* /*killer*/) override
        {
            Talk(SAY_DEATH);
            _JustDied();
            if (instance)
            {
                Map::PlayerList const& players = me->GetMap()->GetPlayers();
                if (!players.isEmpty())
                {
                    Player* pPlayer = players.begin()->getSource();
                    if (pPlayer && pPlayer->GetGroup())
                        if (sLFGMgr->GetQueueId(744))
                            sLFGMgr->FinishDungeon(pPlayer->GetGroup()->GetGUID(), 744);
                }
            }
        }

        void JustSummoned(Creature* summon) override
        {
            if (!summon)
                return;
            if (IsImage66)
                summon->SetHealth(summon->CountPctFromMaxHealth(33));
            else
                summon->SetHealth(summon->CountPctFromMaxHealth(66));
            if (me->getVictim())
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
                    summon->AI()->AttackStart(target);
        }

        void KilledUnit(Unit* victim) override
        {
            //won't yell killing pet/other unit
            if (victim->GetEntry() == NPC_ALPHA_POD_TARGET)
                return;

            Talk(SAY_KILL);
        }

        void DoSplit(uint32 val)
        {
            if (me->IsNonMeleeSpellCast(false))
                me->InterruptNonMeleeSpells(false);

            Talk(SAY_IMAGE);

            if (val == 66)
                DoCast(me, SPELL_66_ILLUSION);
            else
                DoCast(me, SPELL_33_ILLUSION);
        }

        void UpdateAI(uint32 diff) override
        {
            if (!Intro)
            {
                if (Intro_Timer <= diff)
                {
                    switch (Intro_Phase)
                    {
                    case 1:
                        Talk(SAY_INTRO);
                        instance->HandleGameObject(instance->GetGuidData(DATA_WARDENS_SHIELD), true);
                        ++Intro_Phase;
                        Intro_Timer = 25000;
                        break;
                    case 2:
                        Talk(SAY_AGGRO);
                        if (Unit* mellic = ObjectAccessor::GetUnit(*me, instance->GetGuidData(DATA_MELLICHAR)))
                        {
                            //should have a better way to do this. possibly spell exist.
                            mellic->setDeathState(JUST_DIED);
                            mellic->SetHealth(0);
                            instance->HandleGameObject(instance->GetGuidData(DATA_WARDENS_SHIELD), false);
                        }
                        ++Intro_Phase;
                        Intro_Timer = 3000;
                        break;
                    case 3:
                        me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1);
                        Intro = true;
                        me->SetReactState(REACT_AGGRESSIVE);
                        break;
                    }
                }
                else
                    Intro_Timer -= diff;
            }
            if (!UpdateVictim())
                return;

            if (!IsImage66 && !HealthAbovePct(66))
            {
                DoSplit(66);
                IsImage66 = true;
            }
            if (!IsImage33 && !HealthAbovePct(33))
            {
                DoSplit(33);
                IsImage33 = true;
            }

            if (MindRend_Timer <= diff)
            {
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1))
                    DoCast(target, SPELL_MIND_REND);
                else
                    DoCastVictim(SPELL_MIND_REND);

                MindRend_Timer = 8000;
            }
            else
                MindRend_Timer -= diff;

            if (Fear_Timer <= diff)
            {
                if (me->IsNonMeleeSpellCast(false))
                    return;

                Talk(SAY_FEAR);

                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1))
                    DoCast(target, SPELL_FEAR);
                else
                    DoCastVictim(SPELL_FEAR);

                Fear_Timer = 25000;
            }
            else
                Fear_Timer -= diff;

            if (Domination_Timer <= diff)
            {
                if (me->IsNonMeleeSpellCast(false))
                    return;

                Talk(SAY_MIND);

                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1))
                    DoCast(target, SPELL_DOMINATION);
                else
                    DoCastVictim(SPELL_DOMINATION);

                Domination_Timer = 16000 + rand32() % 16000;
            }
            else
                Domination_Timer -= diff;

            if (IsHeroic())
            {
                if (ManaBurn_Timer <= diff)
                {
                    if (me->IsNonMeleeSpellCast(false))
                        return;

                    if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 1))
                        DoCast(target, H_SPELL_MANA_BURN);

                    ManaBurn_Timer = 16000 + rand32() % 16000;
                }
                else
                    ManaBurn_Timer -= diff;
            }
            DoMeleeAttackIfReady();
        }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new boss_harbinger_skyrissAI(creature);
    }
};

// 21466 21467
class boss_harbinger_skyriss_illusion : public CreatureScript
{
public:
    boss_harbinger_skyriss_illusion() : CreatureScript("boss_harbinger_skyriss_illusion") { }

    struct boss_harbinger_skyriss_illusionAI : public ScriptedAI
    {
        boss_harbinger_skyriss_illusionAI(Creature* creature) : ScriptedAI(creature) { }

        void Reset() override
        {
            me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_1);
        }

        void EnterCombat(Unit* /*who*/) override { }
    };

    CreatureAI* GetAI(Creature* creature) const override
    {
        return new boss_harbinger_skyriss_illusionAI(creature);
    }
};

void AddSC_boss_harbinger_skyriss()
{
    new boss_harbinger_skyriss();
    new boss_harbinger_skyriss_illusion();
}