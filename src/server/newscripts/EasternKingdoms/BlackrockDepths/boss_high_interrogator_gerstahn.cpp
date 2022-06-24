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
#include "ScriptedCreature.h"

enum Spells
{
    SPELL_SHADOWWORDPAIN                                   = 10894,
    SPELL_MANABURN                                         = 10876,
    SPELL_PSYCHICSCREAM                                    = 8122,
    SPELL_SHADOWSHIELD                                     = 22417
};

class boss_high_interrogator_gerstahn : public CreatureScript
{
public:
    boss_high_interrogator_gerstahn() : CreatureScript("boss_high_interrogator_gerstahn") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new boss_high_interrogator_gerstahnAI (creature);
    }

    struct boss_high_interrogator_gerstahnAI : public ScriptedAI
    {
        boss_high_interrogator_gerstahnAI(Creature* creature) : ScriptedAI(creature) {}

        uint32 ShadowWordPain_Timer;
        uint32 ManaBurn_Timer;
        uint32 PsychicScream_Timer;
        uint32 ShadowShield_Timer;

        void Reset()
        {
            ShadowWordPain_Timer = 4000;
            ManaBurn_Timer = 14000;
            PsychicScream_Timer = 32000;
            ShadowShield_Timer = 8000;
        }

        void EnterCombat(Unit* /*who*/) {}

        void UpdateAI(uint32 diff)
        {
            //Return since we have no target
            if (!UpdateVictim())
                return;

            //ShadowWordPain_Timer
            if (ShadowWordPain_Timer <= diff)
            {
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                    DoCast(target, SPELL_SHADOWWORDPAIN);
                ShadowWordPain_Timer = 7000;
            } else ShadowWordPain_Timer -= diff;

            //ManaBurn_Timer
            if (ManaBurn_Timer <= diff)
            {
                if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 100, true))
                    DoCast(target, SPELL_MANABURN);
                ManaBurn_Timer = 10000;
            } else ManaBurn_Timer -= diff;

            //PsychicScream_Timer
            if (PsychicScream_Timer <= diff)
            {
                DoCast(me->getVictim(), SPELL_PSYCHICSCREAM);
                PsychicScream_Timer = 30000;
            } else PsychicScream_Timer -= diff;

            //ShadowShield_Timer
            if (ShadowShield_Timer <= diff)
            {
                DoCast(me, SPELL_SHADOWSHIELD);
                ShadowShield_Timer = 25000;
            } else ShadowShield_Timer -= diff;

            DoMeleeAttackIfReady();
        }
    };
};

void AddSC_boss_high_interrogator_gerstahn()
{
    new boss_high_interrogator_gerstahn();
}