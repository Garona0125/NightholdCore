-- creatures
-- Updates
UPDATE `creature` SET `spawntimesecs` = 604800000 WHERE `map` = 996;

-- Deletes
DELETE FROM `creature` WHERE `map` = 996 AND `id` = 61741; 
DELETE FROM `creature` WHERE `map` = 996 AND `id` = 61038; 
DELETE FROM `creature` WHERE `map` = 996 AND `id` = 61042; 
DELETE FROM `creature` WHERE `map` = 996 AND `id` = 61046; 

-- REPLACEs
-- breathoffear triggers
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998100, 654841, 996, 6067, 6515, 8, 65535, 0, 0, -985.338, -2810.08, 38.2548, 5.85902, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998101, 654841, 996, 6067, 6515, 8, 65535, 0, 0, -1045.68, -2813.07, 38.2548, 1.02741, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);

-- dread triggers 
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998110, 654842, 996, 6067, 6515, 8, 65535, 0, 0, -1092.64, -2564.94, 15.88, 5.77517, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998111, 654842, 996, 6067, 6515, 8, 65535, 0, 0, -1096.99, -2581.81, 15.8789, 0.289783, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998112, 654842, 996, 6067, 6515, 8, 65535, 0, 0, -1062.03, -2559.38, 15.8789, 4.06756, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998113, 654842, 996, 6067, 6515, 8, 65535, 0, 0, -1053.97, -2574.33, 15.879, 3.35683, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998114, 654842, 996, 6067, 6515, 8, 65535, 0, 0, -1056.97, -2590.39, 15.8787, 2.62641, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998092, 654842, 996, 6067, 6515, 8, 65535, 0, 0, -1078.43, -2558.54, 15.8791, 4.88193, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998102, 654842, 996, 6067, 6515, 8, 1, 0, 0, -1234.85, -2832.61, 41.2699, 0.422655, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998103, 654842, 996, 6067, 6515, 8, 65535, 0, 0, -1233.56, -2815.71, 41.2702, 5.80837, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998104, 654842, 996, 6067, 6515, 8, 65535, 0, 0, -1221.85, -2805.98, 41.2699, 5.26334, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998105, 654842, 996, 6067, 6515, 8, 65535, 0, 0, -1206.22, -2805.1, 41.2703, 4.31106, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998106, 654842, 996, 6067, 6515, 8, 65535, 0, 0, -1194.49, -2816.72, 41.2705, 3.50443, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998107, 654842, 996, 6067, 6515, 8, 65535, 0, 0, -1195.61, -2833.41, 41.2714, 2.66056, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998108, 654842, 996, 6067, 6515, 8, 65535, 0, 0, -1206.74, -2844.53, 41.2701, 1.93586, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998109, 654842, 996, 6067, 6515, 8, 65535, 0, 0, -1223.78, -2844.81, 41.2701, 1.0837, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998115, 654842, 996, 6067, 6515, 8, 65535, 0, 0, -1072.05, -2599.15, 15.8787, 1.68741, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998116, 654842, 996, 6067, 6515, 8, 65535, 0, 0, -1087.96, -2594.78, 15.88, 1.06695, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998117, 654842, 996, 6067, 6515, 8, 65535, 0, 0, -810.128, -2740.68, 31.7047, 3.36422, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998118, 654842, 996, 6067, 6515, 8, 65535, 0, 0, -854.14, -2749.51, 31.7046, 0.214772, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998119, 654842, 996, 6067, 6515, 8, 65535, 0, 0, -850.349, -2732.33, 31.7055, 5.6458, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998120, 654842, 996, 6067, 6515, 8, 65535, 0, 0, -836.016, -2724.28, 31.7046, 4.8879, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998121, 654842, 996, 6067, 6515, 8, 65535, 0, 0, -819.338, -2727.07, 31.7048, 4.16926, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998122, 654842, 996, 6067, 6515, 8, 65535, 0, 0, -813.384, -2757.49, 31.7054, 2.5868, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998123, 654842, 996, 6067, 6515, 8, 65535, 0, 0, -827.52, -2768.21, 31.7048, 1.67361, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);
REPLACE INTO `creature` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `npcflag2`, `unit_flags`, `dynamicflags`, `isActive`) VALUES (998124, 654842, 996, 6067, 6515, 8, 65535, 0, 0, -843.845, -2762.27, 31.7046, 0.82941, 300, 0, 0, 1, 0, 0, 0, 0, 33554432, 0, 0);

-- spell script name
DELETE FROM `spell_script_names` WHERE `spell_id` = 119414; 
DELETE FROM `spell_script_names` WHERE `spell_id` = 125786;

REPLACE INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (123018, 'terroize_creature_restriction');
REPLACE INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (123011, 'spell_player_terrorize');
REPLACE INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (119958, 'spell_dread_spray_hit');
REPLACE INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (120047, 'dread_spray_buff');
REPLACE INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (119887, 'spell_death_blossom_damage');
REPLACE INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (119888, 'spell_death_blossom');
REPLACE INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (119414, 'spell_breath_of_fear_spell');
REPLACE INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (125786, 'spell_breath_of_fear_spell');
REPLACE INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (119953, 'spell_dread_spray_damage_ori');
REPLACE INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES (119953, 'spell_dread_spray_hit');


-- creature text

-- sha of fear

REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (60999, 0, 0, 'You will know.. Fear!', 14, 0, 100, 0, 0, 28398, 'VO_TES_FEAR_AGGRO_01');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (60999, 1, 0, '', 14, 0, 100, 0, 0, 28399, 'VO_TES_FEAR_DEATH');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (60999, 2, 0, 'You lights will go out... the darkness will envelope you... and you will fear the shadows that moves within it.', 14, 0, 100, 0, 0, 28402, 'VO_TES_FEAR_INTRO');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (60999, 3, 0, 'Crawl.. in terror!', 14, 0, 100, 0, 0, 28403, 'VO_TES_FEAR_SLAY_1');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (60999, 4, 0, 'Flee...!', 14, 0, 100, 0, 0, 28404, 'VO_TES_FEAR_BREATH_OF_fEAR');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (60999, 5, 0, 'Huddle.. in terror!', 14, 0, 100, 0, 0, 28405, 'VO_TES_FEAR_HUDDLE_IN_TERROR');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (60999, 6, 0, 'Dread rises.. It seeks the light.. It hungers!', 14, 0, 100, 0, 0, 28401, 'VO_TES_FEAR_SUBMERGE');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (60999, 7, 0, 'You think it is so easy to vanquish your fears... ', 14, 0, 100, 0, 0, 28400, 'VO_TES_FEAR_FINAL_PHASE');

-- lei shi
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (62983, 0, 0, 'Wh-what are you doing here!? G-go away!', 14, 0, 100, 0, 0, 29328, 'LEI_SHI_AGGRO');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (62983, 1, 0, 'I\'m hiding until you leave!', 14, 0, 100, 0, 0, 29333, 'LEI_SHI_HIDE_01');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (62983, 1, 1, 'I don\'t want to see you anymore!', 14, 0, 100, 0, 0, 29334, 'LEI_SHI_HIDE_02');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (62983, 2, 0, 'Stay away from me!', 14, 0, 100, 0, 0, 29332, 'LEI_SHI_GET_AWAY_01');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (62983, 2, 1, 'Get AWAY!', 14, 0, 100, 0, 0, 29331, 'LEI_SHI_GET_AWAY_02');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (62983, 3, 0, 'S-sorry!', 14, 0, 100, 0, 0, 29329, 'LEI_SHI_SLAY_01');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (62983, 3, 1, 'It\'s your fault it happened!', 14, 0, 100, 0, 0, 29330, 'LEI_SHI_SLAY_02');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (62983, 4, 0, 'I... ah... oh! Did I...? Was I...? It was... so... cloudy.', 14, 0, 100, 0, 0, 29325, 'LEI_SHI_DEFEATED_01');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (62983, 4, 1, 'I have to go now.', 14, 0, 100, 0, 0, 29326, 'LEI_SHI_DEFEATED_02');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (62983, 4, 2, 'I have to make the water not cloudy anymore. Will... will you help?', 14, 0, 100, 0, 0, 29327, 'LEI_SHI_DEFEATED_03');
-- tsulong
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (62442, 1, 0, 'You do not belong here! The waters must be protected. I\'ll cast you out, or slay you!', 14, 0, 100, 0, 0, 29350, 'TSULONG_AGGRO');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (62442, 2, 0, 'Protect.. the waters', 14, 0, 100, 0, 0, 29351, 'TSULONG_DEATH_01');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (62442, 8, 0, 'I thank you strangers.. I have been freed.', 14, 0, 100, 0, 0, 29352, 'TSULONG_DEATH_02');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (62442, 3, 0, 'Day falls to night!', 14, 0, 100, 0, 0, 29353, 'VO_TES_SERPENT_EVENT_DAYTONIGHT_01');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (62442, 3, 1, 'Darkness grows!', 14, 0, 100, 0, 0, 29354, 'VO_TES_SERPENT_EVENT_DAYTONIGHT_02');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (62442, 3, 2, 'Light.. fades!', 14, 0, 100, 0, 0, 29355, 'VO_TES_SERPENT_EVENT_DAYTONIGHT_03');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (62442, 4, 0, 'Night.. becomes day!', 14, 0, 100, 0, 0, 29356, 'VO_TES_SERPENT_EVENT_NIGHTTODAY_01');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (62442, 4, 1, 'The sun.. shines through!', 14, 0, 100, 0, 0, 29357, 'VO_TES_SERPENT_EVENT_NIGHTTODAY_02');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (62442, 4, 2, 'Once more.. the dawn!', 14, 0, 100, 0, 0, 29358, 'VO_TES_SERPENT_EVENT_NIGHTTODAY_03');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (62442, 5, 0, 'Die in darkness!', 14, 0, 100, 0, 0, 29360, 'VO_TES_SERPENT_SLAY_01_DARK');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (62442, 5, 1, 'The night surrounds you!', 14, 0, 100, 0, 0, 29361, 'VO_TES_SERPENT_SLAY_02_DARK');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (62442, 6, 0, 'No!', 14, 0, 100, 0, 0, 29362, 'VO_TES_SERPENT_SLAY_03_LIGHT');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (62442, 6, 1, 'Forgive me!', 14, 0, 100, 0, 0, 29363, 'VO_TES_SERPENT_SLAY_04_LIGHT');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (62442, 7, 0, 'Overwhelming fear!', 14, 0, 100, 0, 0, 29364, 'VO_TES_SERPENT_SPELL_NIGGHTMARE_01');
REPLACE INTO `creature_text` (`entry`, `groupid`, `id`, `text`, `type`, `language`, `probability`, `emote`, `duration`, `sound`, `comment`) VALUES (62442, 7, 1, 'Leave this place or die!', 14, 0, 100, 0, 0, 29365, 'VO_TES_SERPENT_SPELL_NIGGHTMARE_02');

-- creature equip template
REPLACE INTO `creature_equip_template` (`CreatureID`, `ItemID1`, `ItemID2`, `ItemID3`) VALUES (699530, 0, 0, 21459);