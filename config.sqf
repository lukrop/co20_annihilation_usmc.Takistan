/*
	File: config.sqf
	Author: lukrop

	License: see LICENSE.txt
	Description:
		Class names and configuration

	Parameter(s):
	-

	Returns:
	-
*/
// wait until all parameters are set
waitUntil {!isNil "params_set"};

// Mobile respawn vehicle class
lkr_mhq_vehicle_C = "B_MRAP_01_F";
// uav class
lkr_uav_C = "B_UAV_02_F";
// chopper class
lkr_chopper_C = "B_Heli_Transport_01_F";
// pilot class
lkr_pilot_C = "B_helipilot_F";

// define enemy side and create center
lkr_enemy_side = east;
lkr_enemy_center = createCenter east;

// define enemy units classes
switch(param_enemy_faction) do {
	// CAF Aggressors middle eastern
	case 0: {
		// enemy infantry group leaders
		lkr_enemy_inf_leaders_C = ["CAF_AG_ME_AK74", "CAF_AG_ME_GL"];
		// repeat akm dudes to increase their saturation
		lkr_enemy_inf_units_C = ["CAF_AG_ME_AK74", "CAF_AG_ME_AK47", "CAF_AG_ME_RPG", "CAF_AG_ME_RPK",
			"CAF_AG_ME_SVD", "CAF_AG_ME_PK", "CAF_AG_ME_AK47", "CAF_AG_ME_RPG", "CAF_AG_ME_AK47",
			"CAF_AG_ME_AK47", "CAF_AG_ME_AK47", "CAF_AG_ME_AK74", "CAF_AG_ME_GL"];
		// enemy vehicles
		lkr_enemy_vecs_C = ["CAF_AG_ME_Offroad_armed_01"];

		lkr_hvt_C = "CAF_AG_EUR_AK74";
		lkr_hvt_guard_C = "CAF_AG_ME_AK74";

	};
	// CAF Aggressors eastern europe
	case 1: {
		// enemy infantry group leaders
		lkr_enemy_inf_leaders_C = ["CAF_AG_EUR_AK74", "CAF_AG_EUR_GL"];
		// repeat akm dudes to increase their saturation
		lkr_enemy_inf_units_C = ["CAF_AG_EUR_AK74", "CAF_AG_EUR_AK47", "CAF_AG_EUR_RPG", "CAF_AG_EUR_RPK",
			"CAF_AG_EUR_SVD", "CAF_AG_EUR_PK", "CAF_AG_EUR_AK47", "CAF_AG_EUR_RPG", "CAF_AG_EUR_AK47",
			"CAF_AG_EUR_AK47", "CAF_AG_EUR_AK47", "CAF_AG_EUR_AK74", "CAF_AG_EUR_GL"];
		// enemy vehicles
		lkr_enemy_vecs_C = ["CAF_AG_EUR_Offroad_armed_01"];

		lkr_hvt_C = "CAF_AG_AFR_AK74";
		lkr_hvt_guard_C = "CAF_AG_EUR_AK74";
	};
	// CAF Aggressors african
	case 2: {
		// enemy infantry group leaders
		lkr_enemy_inf_leaders_C = ["CAF_AG_AFR_AK74", "CAF_AG_AFR_GL"];
		// repeat akm dudes to increase their saturation
		lkr_enemy_inf_units_C = ["CAF_AG_AFR_AK74", "CAF_AG_AFR_AK47", "CAF_AG_AFR_RPG", "CAF_AG_AFR_RPK",
			"CAF_AG_AFR_SVD", "CAF_AG_AFR_PK", "CAF_AG_AFR_AK47", "CAF_AG_AFR_RPG", "CAF_AG_AFR_AK47",
			"CAF_AG_AFR_AK47", "CAF_AG_AFR_AK47", "CAF_AG_AFR_AK74", "CAF_AG_AFR_GL"];
		// enemy vehicles
		lkr_enemy_vecs_C = ["CAF_AG_AFR_Offroad_armed_01"];

		lkr_hvt_C = "CAF_AG_EUR_AK74";
		lkr_hvt_guard_C = "CAF_AG_AFR_AK74";
	};
};

// set skill according to paramters
switch (param_enemy_skill) do {
	// low
	case 0: {
		lkr_enemy_skill_range = [0.2,0.4];
	  };
	// medium
	case 1: {
		lkr_enemy_skill_range = [0.4,0.6];
	  };
	// high
	case 2: {
		lkr_enemy_skill_range = [0.6,0.8];
	  };
	// very high
	case 3: {
		lkr_enemy_skill_range = [0.8,1];
	  };
};

lkr_city_markers = [
	["city0", ["city0_spawn0", "city0_spawn1", "city0_spawn2", "city0_spawn3"]],
	["city1", ["city1_spawn0", "city1_spawn1", "city1_spawn2", "city1_spawn3"]],
	["city2", ["city2_spawn0", "city2_spawn1", "city2_spawn2", "city2_spawn3"]],
	["city3", ["city3_spawn0", "city3_spawn1", "city3_spawn2", "city3_spawn3"]],
	["city4", ["city4_spawn0", "city4_spawn1", "city4_spawn2", "city4_spawn3"]],
	["city5", ["city5_spawn0", "city5_spawn1", "city5_spawn2", "city5_spawn3"]],
	["city6", ["city6_spawn0", "city6_spawn1", "city6_spawn2", "city6_spawn3"]],
	["city7", ["city7_spawn0", "city7_spawn1", "city7_spawn2", "city7_spawn3"]],
	["city8", ["city8_spawn0", "city8_spawn1", "city8_spawn2", "city8_spawn3"]],
	["city9", ["city9_spawn0", "city9_spawn1", "city9_spawn2", "city9_spawn3"]]
];

lkr_land_markers = [
	["land0", ["land0_scout", "land0_scout_1", "land0_scout_2", "land0_scout_3"]],
	["land1", ["land1_scout", "land1_scout_1", "land1_scout_2", "land1_scout_3"]],
	["land2", ["land2_scout", "land2_scout_1", "land2_scout_2", "land2_scout_3"]],
	["land3", ["land3_scout", "land3_scout_1", "land3_scout_2", "land3_scout_3"]],
	["land4", ["land4_scout", "land4_scout_1", "land4_scout_2", "land4_scout_3"]],
	["land5", ["land5_scout", "land5_scout_1", "land5_scout_2", "land5_scout_3"]],
	["land6", ["land6_scout", "land6_scout_1", "land6_scout_2", "land6_scout_3"]],
	["land7", ["land7_scout", "land7_scout_1", "land7_scout_2", "land7_scout_3"]],
	["land8", ["land8_scout", "land8_scout_1", "land8_scout_2", "land8_scout_3"]],
	["land9", ["land9_scout", "land9_scout_1", "land9_scout_2", "land9_scout_3"]],
	["land10", ["land10_scout", "land10_scout_1", "land10_scout_2", "land10_scout_3"]],
	["land11", ["land11_scout", "land11_scout_1", "land11_scout_2", "land11_scout_3"]],
	["land12", ["land12_scout", "land12_scout_1", "land12_scout_2", "land12_scout_3"]],
	["land13", ["land13_scout", "land13_scout_1", "land13_scout_2", "land13_scout_3"]],
	["land14", ["land14_scout", "land14_scout_1", "land14_scout_2", "land14_scout_3"]],
	["land15", ["land15_scout", "land15_scout_1", "land15_scout_2", "land15_scout_3"]]
];

//ani_maxRecruitUnits = 12;
ani_recruit_ARClass = "B_mas_mar_soldier_AR_F_d";
ani_recruit_MGClass = "B_mas_mar_soldier_MG_F_d";
ani_recruit_ATClass = "B_mas_mar_soldier_AT_F_d";
ani_recruit_LATClass = "B_mas_mar_soldier_LAT_F_d";
ani_recruit_MedicClass = "B_mas_mar_medic_F_d";
ani_recruit_PilotClass = "B_helipilot_F";
ani_recruit_EngineerClass = "B_mas_mar_soldier_repair_F_d";
