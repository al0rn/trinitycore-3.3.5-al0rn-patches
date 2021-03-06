-- Greater Felfire Diemetradon
DELETE FROM `smart_scripts` WHERE `entryorguid` = 21462 AND `source_type` = 0 AND `id` IN (2,3,4);

-- Bloodpaw Marauder & Bloodpaw Warrior
UPDATE `creature_template` SET `AIName` = '' WHERE `entry` = 27340;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 27340 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` = 27342 AND `source_type` = 0 AND `id` = 1;

-- Brother Daniels
UPDATE `smart_scripts` SET `action_type` = 90, `action_param1` = 8 WHERE `entryorguid` IN (1944700,1944701) AND `source_type` = 9 AND `action_type` = 75 AND `action_param1` = 68442;
UPDATE `smart_scripts` SET `action_type` = 91, `action_param1` = 8 WHERE `entryorguid` IN (1944700,1944701) AND `source_type` = 9 AND `action_type` = 28 AND `action_param1` = 68442;

-- Festival Scorchling & Summer Scorchling
-- I don't think it's really implemented, does literally nothing and targets nothing
UPDATE `creature_template_addon` SET `auras` = '45887' WHERE `entry` IN (26401,26520);
UPDATE `creature_text` SET `Emote` = 0, `Duration` = 0 WHERE `CreatureID` IN (26401,26520);

UPDATE `creature_template` SET `unit_flags` = 0, `AIName` = 'SmartAI' WHERE `entry` = 26502;

DELETE FROM `smart_scripts` WHERE `entryorguid` = 26502 AND `source_type` = 0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (2652000,2640100,2650200) AND `source_type` = 9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`event_param5`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_param4`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(2652000,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,"Festival Scorchling - On Script - Say Line 0"),
(2652000,9,1,0,0,0,100,0,2000,2000,0,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,"Festival Scorchling - On Script - Say Line 1"),
(2652000,9,2,0,0,0,100,0,2000,2000,0,0,0,11,47114,0,0,0,0,0,1,0,0,0,0,0,0,0,0,"Festival Scorchling - On Script - Cast 'Scorchling Grow'"),
(2652000,9,3,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,7,0,0,0,0,0,0,0,0,"Festival Scorchling - On Script - Say Line 2"),
(2652000,9,4,0,0,0,100,0,3000,3000,0,0,0,11,47114,0,0,0,0,0,1,0,0,0,0,0,0,0,0,"Festival Scorchling - On Script - Cast 'Scorchling Grow'"),
(2652000,9,5,0,0,0,100,0,0,0,0,0,0,1,3,0,0,0,0,0,7,0,0,0,0,0,0,0,0,"Festival Scorchling - On Script - Say Line 3"),
(2652000,9,6,0,0,0,100,0,3000,3000,0,0,0,11,47114,0,0,0,0,0,1,0,0,0,0,0,0,0,0,"Festival Scorchling - On Script - Cast 'Scorchling Grow'"),
(2652000,9,7,0,0,0,100,0,0,0,0,0,0,1,4,0,0,0,0,0,7,0,0,0,0,0,0,0,0,"Festival Scorchling - On Script - Say Line 4"),
(2652000,9,8,0,0,0,100,0,1000,1000,0,0,0,1,5,0,0,0,0,0,7,0,0,0,0,0,0,0,0,"Festival Scorchling - On Script - Say Line 5"),
(2652000,9,9,0,0,0,100,0,1000,1000,0,0,0,11,47114,0,0,0,0,0,1,0,0,0,0,0,0,0,0,"Festival Scorchling - On Script - Cast 'Scorchling Grow'"),
(2652000,9,10,0,0,0,100,0,0,0,0,0,0,11,47114,0,0,0,0,0,1,0,0,0,0,0,0,0,0,"Festival Scorchling - On Script - Cast 'Scorchling Grow'"),
(2652000,9,11,0,0,0,100,0,0,0,0,0,0,1,6,0,0,0,0,0,7,0,0,0,0,0,0,0,0,"Festival Scorchling - On Script - Say Line 6"),
(2652000,9,12,0,0,0,100,0,3000,3000,0,0,0,11,47114,0,0,0,0,0,1,0,0,0,0,0,0,0,0,"Festival Scorchling - On Script - Cast 'Scorchling Grow'"),
(2652000,9,13,0,0,0,100,0,0,0,0,0,0,11,47114,0,0,0,0,0,1,0,0,0,0,0,0,0,0,"Festival Scorchling - On Script - Cast 'Scorchling Grow'"),
(2652000,9,14,0,0,0,100,0,0,0,0,0,0,11,47120,0,0,0,0,0,1,0,0,0,0,0,0,0,0,"Festival Scorchling - On Script - Cast 'Summon Wisp of Ragnaros'"),
(2652000,9,15,0,0,0,100,0,0,0,0,0,0,1,7,0,0,0,0,0,7,0,0,0,0,0,0,0,0,"Festival Scorchling - On Script - Say Line 7"),
(2652000,9,16,0,0,0,100,0,3000,3000,0,0,0,28,47114,0,0,0,0,0,1,0,0,0,0,0,0,0,0,"Festival Scorchling - On Script - Remove Aura 'Scorchling Grow'"),
(2652000,9,17,0,0,0,100,0,0,0,0,0,0,1,8,0,0,0,0,0,7,0,0,0,0,0,0,0,0,"Festival Scorchling - On Script - Say Line 8"),
(2652000,9,18,0,0,0,100,0,4000,4000,0,0,0,1,9,0,0,0,0,0,7,0,0,0,0,0,0,0,0,"Festival Scorchling - On Script - Say Line 9"),
(2652000,9,19,0,0,0,100,0,1000,1000,0,0,0,1,10,0,0,0,0,0,7,0,0,0,0,0,0,0,0,"Festival Scorchling - On Script - Say Line 10"),

(2640100,9,0,0,0,0,100,0,0,0,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,0,"Summer Scorchling - On Script - Say Line 0"),
(2640100,9,1,0,0,0,100,0,2000,2000,0,0,0,1,1,0,0,0,0,0,7,0,0,0,0,0,0,0,0,"Summer Scorchling - On Script - Say Line 1"),
(2640100,9,2,0,0,0,100,0,2000,2000,0,0,0,11,47114,0,0,0,0,0,1,0,0,0,0,0,0,0,0,"Summer Scorchling - On Script - Cast 'Scorchling Grow'"),
(2640100,9,3,0,0,0,100,0,0,0,0,0,0,1,2,0,0,0,0,0,7,0,0,0,0,0,0,0,0,"Summer Scorchling - On Script - Say Line 2"),
(2640100,9,4,0,0,0,100,0,3000,3000,0,0,0,11,47114,0,0,0,0,0,1,0,0,0,0,0,0,0,0,"Summer Scorchling - On Script - Cast 'Scorchling Grow'"),
(2640100,9,5,0,0,0,100,0,0,0,0,0,0,1,3,0,0,0,0,0,7,0,0,0,0,0,0,0,0,"Summer Scorchling - On Script - Say Line 3"),
(2640100,9,6,0,0,0,100,0,3000,3000,0,0,0,11,47114,0,0,0,0,0,1,0,0,0,0,0,0,0,0,"Summer Scorchling - On Script - Cast 'Scorchling Grow'"),
(2640100,9,7,0,0,0,100,0,0,0,0,0,0,1,4,0,0,0,0,0,7,0,0,0,0,0,0,0,0,"Summer Scorchling - On Script - Say Line 4"),
(2640100,9,8,0,0,0,100,0,1000,1000,0,0,0,1,5,0,0,0,0,0,7,0,0,0,0,0,0,0,0,"Summer Scorchling - On Script - Say Line 5"),
(2640100,9,9,0,0,0,100,0,1000,1000,0,0,0,11,47114,0,0,0,0,0,1,0,0,0,0,0,0,0,0,"Summer Scorchling - On Script - Cast 'Scorchling Grow'"),
(2640100,9,10,0,0,0,100,0,0,0,0,0,0,11,47114,0,0,0,0,0,1,0,0,0,0,0,0,0,0,"Summer Scorchling - On Script - Cast 'Scorchling Grow'"),
(2640100,9,11,0,0,0,100,0,0,0,0,0,0,1,6,0,0,0,0,0,7,0,0,0,0,0,0,0,0,"Summer Scorchling - On Script - Say Line 6"),
(2640100,9,12,0,0,0,100,0,3000,3000,0,0,0,11,47114,0,0,0,0,0,1,0,0,0,0,0,0,0,0,"Summer Scorchling - On Script - Cast 'Scorchling Grow'"),
(2640100,9,13,0,0,0,100,0,0,0,0,0,0,11,47114,0,0,0,0,0,1,0,0,0,0,0,0,0,0,"Summer Scorchling - On Script - Cast 'Scorchling Grow'"),
(2640100,9,14,0,0,0,100,0,0,0,0,0,0,11,47120,0,0,0,0,0,1,0,0,0,0,0,0,0,0,"Summer Scorchling - On Script - Cast 'Summon Wisp of Ragnaros'"),
(2640100,9,15,0,0,0,100,0,0,0,0,0,0,1,7,0,0,0,0,0,7,0,0,0,0,0,0,0,0,"Summer Scorchling - On Script - Say Line 7"),
(2640100,9,16,0,0,0,100,0,3000,3000,0,0,0,28,47114,0,0,0,0,0,1,0,0,0,0,0,0,0,0,"Summer Scorchling - On Script - Remove Aura 'Scorchling Grow'"),
(2640100,9,17,0,0,0,100,0,0,0,0,0,0,1,8,0,0,0,0,0,7,0,0,0,0,0,0,0,0,"Summer Scorchling - On Script - Say Line 8"),
(2640100,9,18,0,0,0,100,0,4000,4000,0,0,0,1,9,0,0,0,0,0,7,0,0,0,0,0,0,0,0,"Summer Scorchling - On Script - Say Line 9"),
(2640100,9,19,0,0,0,100,0,1000,1000,0,0,0,1,10,0,0,0,0,0,7,0,0,0,0,0,0,0,0,"Summer Scorchling - On Script - Say Line 10"),

(26502,0,0,0,11,0,100,0,0,0,0,0,0,80,2650200,0,0,0,0,0,1,0,0,0,0,0,0,0,0,"Wisp of Ragnaros - On Spawn - Run script"),

(2650200,9,0,0,0,0,100,0,1000,1000,0,0,0,5,15,0,0,0,0,0,1,0,0,0,0,0,0,0,0,"Wisp of Ragnaros - On Script - Play Emote 15"),
(2650200,9,1,0,0,0,100,0,1000,1000,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,"Wisp of Ragnaros - On Script - Despawn");
