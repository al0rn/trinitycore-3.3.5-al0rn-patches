--
SET @OGUID := 92592; -- 65
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID+000 AND @OGUID+064 AND `id` IN (181878,181829,181851,181870,181887,181888,181991,181992,181993,181994,181995,181996,181997,181998,181999,182000,182001,182013,182014,182015,182016,182017,182018,182019,182020,182021,182022,182023,182027,182028,182029,182215,182216,182217,182218,182219,182220,182221,185036,185037,185038,185039,185040,185041,185042,185043,185044,185045,185046,185047);
INSERT INTO `gameobject` (`guid`, `id`, `map`, `zoneId`, `areaId`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`, `ScriptName`, `VerifiedBuild`) VALUES
(@OGUID+000,181878,530,0,0,1,1,-1648.48,-10927.1,59.1197,2.11185,0,0,0.870356,0.492424,120,255,1,'',15595),
(@OGUID+001,181878,530,0,0,1,1,-1648.16,-10926,58.9527,2.07694,0,0,0.861629,0.507539,120,255,1,'',15595),
(@OGUID+002,181878,530,0,0,1,1,-1647.21,-10926.8,59.1528,2.79252,0,0,0.984807,0.173652,120,255,1,'',15595),
(@OGUID+003,181878,530,0,0,1,1,-1646.84,-10925.8,59.0401,0.558504,0,0,0.275637,0.961262,120,255,1,'',15595),
(@OGUID+004,181878,530,0,0,1,1,-1646.11,-10927.1,59.3048,2.40855,0,0,0.93358,0.358368,120,255,1,'',15595),
(@OGUID+005,181878,530,0,0,1,1,-1646.05,-10922.5,58.9643,5.07891,0,0,-0.566406,0.824126,120,255,1,'',15595),
(@OGUID+006,181878,530,0,0,1,1,-1645.69,-10924.8,59.005,1.81514,0,0,0.788011,0.615662,120,255,1,'',15595),
(@OGUID+007,181878,530,0,0,1,1,-1645.68,-10926,59.1503,2.23402,0,0,0.898793,0.438373,120,255,1,'',15595),
(@OGUID+008,181878,530,0,0,1,1,-1645.67,-10923.6,58.9843,1.309,0,0,0.608761,0.793354,120,255,1,'',15595),
(@OGUID+009,181878,530,0,0,1,1,-1644.94,-10922.8,58.9166,6.00393,0,0,-0.139173,0.990268,120,255,1,'',15595),
(@OGUID+010,181878,530,0,0,1,1,-1644.82,-10926.6,59.1072,6.10865,0,0,-0.0871553,0.996195,120,255,1,'',15595),
(@OGUID+011,181878,530,0,0,1,1,-1644.72,-10925.4,58.9535,0.279252,0,0,0.139173,0.990268,120,255,1,'',15595),
(@OGUID+012,181878,530,0,0,1,1,-1644.68,-10924.1,58.9146,0.925024,0,0,0.446198,0.894935,120,255,1,'',15595),
(@OGUID+013,181878,530,0,0,1,1,-1643.86,-10923.2,58.841,1.36136,0,0,0.62932,0.777146,120,255,1,'',15595),
(@OGUID+014,181878,530,0,0,1,1,-1643.71,-10924.5,58.8313,5.51524,0,0,-0.374606,0.927184,120,255,1,'',15595),
(@OGUID+015,181878,530,0,0,1,1,-1643.62,-10925.9,58.8961,2.68781,0,0,0.97437,0.224951,120,255,1,'',15595),
(@OGUID+016,181829,530,0,0,1,1,-2425.21,-12169,32.5557,0.17453,0,0,0.0871544,0.996195,120,255,1,'',15595),
(@OGUID+017,181851,530,0,0,1,1,-2665.23,-12139,16.524,6.01266,0,0,-0.134851,0.990866,120,255,1,'',15595),
(@OGUID+018,181870,530,0,0,1,1,-1217.26,-11454.5,0.583626,5.68444,0,0,-0.294923,0.955521,120,255,1,'',15595),
(@OGUID+019,181887,530,0,0,1,1,-2518.31,-12292.8,13.7125,1.5708,0,0,0.707107,0.707107,120,255,1,'',15595),
(@OGUID+020,181888,530,0,0,1,1,-2536.5,-12195.9,27.7357,6.26697,0,0,-0.00810528,0.999967,120,255,1,'',15595),
(@OGUID+021,181991,530,0,0,1,1,-1972.11,-10581,178.216,3.59115,0,0,-0.974844,0.222888,120,255,1,'',15595),
(@OGUID+022,181992,530,0,0,1,1,-1988.71,-10575.8,178.588,2.05525,0,0,0.856073,0.516854,120,255,1,'',15595),
(@OGUID+023,181993,530,0,0,1,1,-1985.42,-10552.6,177.381,1.37457,0,0,0.63444,0.772972,120,255,1,'',15595),
(@OGUID+024,181994,530,0,0,1,1,-1881.77,-10567.6,178.307,0.973143,0,0,0.467598,0.883941,120,255,1,'',15595),
(@OGUID+025,181995,530,0,0,1,1,-1903.02,-10572.4,178.479,1.39203,0,0,0.641163,0.767405,120,255,1,'',15595),
(@OGUID+026,181996,530,0,0,1,1,-1933.12,-10587.4,177.111,0.632805,0,0,0.31115,0.950361,120,255,1,'',15595),
(@OGUID+027,181997,530,0,0,1,1,-1972.24,-10521.9,177.245,4.65579,0,0,-0.726831,0.686816,120,255,1,'',15595),
(@OGUID+028,181998,530,0,0,1,1,-1945.54,-10520.7,177.219,4.0362,0,0,-0.901617,0.432535,120,255,1,'',15595),
(@OGUID+029,181999,530,0,0,1,1,-1917.42,-10515.5,177.242,3.79185,0,0,-0.947609,0.319433,120,255,1,'',15595),
(@OGUID+030,182000,530,0,0,1,1,-1887.81,-10518.4,177.236,3.56496,0,0,-0.977678,0.210108,120,255,1,'',15595),
(@OGUID+031,182001,530,0,0,1,1,-1870.56,-10536.5,177.244,2.82319,0,0,0.987354,0.158529,120,255,1,'',15595),
(@OGUID+032,182013,530,0,0,1,1,-1549.19,-11209.3,67.5263,4.35558,0,0,-0.821365,0.570402,120,255,1,'',15595),
(@OGUID+033,182014,530,0,0,1,1,-1588.42,-11323.2,62.6989,5.97379,0,0,-0.15408,0.988058,120,255,1,'',15595),
(@OGUID+034,182015,530,0,0,1,1,-2307.57,-11258.4,38.0939,3.17428,0,0,-0.999866,0.016341,120,255,1,'',15595),
(@OGUID+035,182016,530,0,0,1,1,-2308.39,-11272.7,38.2228,5.85299,0,0,-0.213445,0.976955,120,255,1,'',15595),
(@OGUID+036,182017,530,0,0,1,1,-2415.85,-11209.3,24.2867,4.35558,0,0,-0.821365,0.570402,120,255,1,'',15595),
(@OGUID+037,182018,530,0,0,1,1,-2455.09,-11323.2,30.736,5.97379,0,0,-0.15408,0.988058,120,255,1,'',15595),
(@OGUID+038,182019,530,0,0,1,1,-2501.26,-11254.3,36.1665,4.76306,0,0,-0.688967,0.724793,120,255,1,'',15595),
(@OGUID+039,182020,530,0,0,1,1,-2526.01,-11279.2,36.1667,4.88003,0,0,-0.645423,0.763825,120,255,1,'',15595),
(@OGUID+040,182021,530,0,0,1,1,-2544.04,-11244.7,36.1665,5.24935,0,0,-0.494204,0.869346,120,255,1,'',15595),
(@OGUID+041,182022,530,0,0,1,1,-2606.2,-11343,27.4696,0.479141,0,0,0.237286,0.97144,120,255,1,'',15354),
(@OGUID+042,182023,530,0,0,1,1,-2603.08,-11359.7,26.7118,0.67615,0,0,0.331672,0.943395,120,255,1,'',15595),
(@OGUID+043,182027,530,0,0,1,1,-2314.98,-11161.1,13.7754,4.12912,0,0,-0.880554,0.473945,120,255,1,'',15595),
(@OGUID+044,182028,530,0,0,1,1,-2342.46,-11175.1,13.9421,3.91839,0,0,-0.925516,0.378708,120,255,1,'',15595),
(@OGUID+045,182029,530,0,0,1,1,-2344,-11184.2,14.0654,1.8277,0,0,0.79186,0.610703,120,255,1,'',15595),
(@OGUID+046,182215,530,0,0,1,1,-1399.92,-11967.5,16.7892,0.904019,0,0,0.436774,0.899571,120,255,1,'',15595),
(@OGUID+047,182216,530,0,0,1,1,-1433.41,-11832.5,19.865,4.04562,0,0,-0.89957,0.436776,120,255,1,'',15595),
(@OGUID+048,182217,530,0,0,1,1,-1532.55,-11833.3,24.0928,2.47481,0,0,0.944939,0.327248,120,255,1,'',15595),
(@OGUID+049,182218,530,0,0,1,1,-1502.28,-11932.9,19.0502,3.41731,0,0,-0.990513,0.13742,120,255,1,'',15595),
(@OGUID+050,182219,530,0,0,1,1,-1533.64,-12033.6,11.4075,2.2392,0,0,0.899925,0.436044,120,255,1,'',15595),
(@OGUID+051,182220,530,0,0,1,1,-1632.4,-11898.5,10.0827,5.61641,0,0,-0.327246,0.944939,120,255,1,'',15595),
(@OGUID+052,182221,530,0,0,1,1,-1666.59,-11800.8,23.3407,0.554955,0,0,0.273931,0.961749,120,255,1,'',15595),
(@OGUID+053,185036,530,0,0,1,1,-1494.83,-11433.5,66.6229,0.355989,0,0,0.177056,0.984201,120,255,1,'',15595),
(@OGUID+054,185037,530,0,0,1,1,-1521.37,-11388.9,67.5907,0.355989,0,0,0.177056,0.984201,120,255,1,'',15595),
(@OGUID+055,185038,530,0,0,1,1,-1565.64,-11223.9,68.0712,6.00213,0,0,-0.140065,0.990142,120,255,1,'',15595),
(@OGUID+056,185039,530,0,0,1,1,-1567.6,-11308.3,65.716,0.355989,0,0,0.177056,0.984201,120,255,1,'',15595),
(@OGUID+057,185040,530,0,0,1,1,-2324.6,-11177.5,13.831,0.355989,0,0,0.177056,0.984201,120,255,1,'',15595),
(@OGUID+058,185041,530,0,0,1,1,-2524.63,-11143.4,16.6981,0.355989,0,0,0.177056,0.984201,120,255,1,'',15595),
(@OGUID+059,185042,530,0,0,1,1,-2357.58,-11343.9,27.8311,0.355989,0,0,0.177056,0.984201,120,255,1,'',15595),
(@OGUID+060,185043,530,0,0,1,1,-2432.31,-11223.9,23.2413,6.00213,0,0,-0.140065,0.990142,120,255,1,'',15595),
(@OGUID+061,185044,530,0,0,1,1,-2434.27,-11308.3,28.4662,0.355989,0,0,0.177056,0.984201,120,255,1,'',15595),
(@OGUID+062,185045,530,0,0,1,1,-2474.97,-11399.5,37.1029,0.355989,0,0,0.177056,0.984201,120,255,1,'',15595),
(@OGUID+063,185046,530,0,0,1,1,-2522.58,-11257.1,36.0554,0.355989,0,0,0.177056,0.984201,120,255,1,'',15595),
(@OGUID+064,185047,530,0,0,1,1,-2546.8,-11313.7,23.0865,6.22495,0,0,-0.0291119,0.999576,120,255,1,'',15595);
