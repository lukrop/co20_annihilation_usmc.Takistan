/*
	File: init.sqf
	Author: lukrop

	License: see LICENSE.txt
	Description:
		Executed when mission is started (before briefing screen)

	Parameter(s):
	-

	Returns:
	-
*/

// disable saving
enableSaving [false, false];

// if using Task Force Radio, don't add a long range radio automatically
tf_no_auto_long_range_radio = true;
// if using Task Force Radio, set all short range radios to the same frequency for each side
//tf_same_sw_frequencies_for_side = true;

// compile shk_pos
call compile preprocessFileLineNumbers "SHK_pos\shk_pos_init.sqf";

// wait until the parameters have been initialized
waitUntil {!isNil "param_btc_mobile_respawn_vas"};

// include configuration (class names and so on)
#include "config.sqf"

// setup random roadside IEDs
if(param_ied == 1) then {
  call compile preprocessFileLineNumbers "EPD\Ied_Init.sqf";
};

// init =BTC= revive
if(param_revive == 1) then {
	// init revive
	call compile preprocessFileLineNumbers "=BTC=_revive\=BTC=_revive_init.sqf";

	// set revive lifes
	if(param_btc_revive_lifes == 0) then {
		// disable the life counter
		BTC_active_lifes = 0;
	} else {
		// set the amount of lifes
		BTC_lifes = param_btc_revive_lifes;
	};

	// setup the mobile respawn vehicle
	BTC_active_mobile = param_btc_mobile_respawn;
	if(param_btc_mobile_respawn == 1) then {
		// spawn the mobile respawn vehicle
		if(isServer) then {
			"spawning mhq" call BIS_fnc_log;
			lkr_mhq = lkr_mhq_vehicle_C createVehicle (getMarkerPos "lkr_mhq_spawn");
			// init the mhq
			lkr_mhq call lkr_fnc_initMHQ;
			// enable vehicle respawn, 120 minutes abandoned delay, 1 minute destroyed delay
			[lkr_mhq, 120, 1, {call lkr_fnc_initMHQ}] call lkr_fnc_ICE_vehRespawn;
		};
	};
	// setup the flag to allow teleport to mhq
	BTC_objects_actions_west = [lkr_flag];
	// set the mhq vec as mobile respawn
	BTC_vehs_mobile_west = [lkr_mhq];
};

// init FAR revive
if(param_revive == 2) then {
	call compileFinal preprocessFileLineNumbers "FAR_revive\FAR_revive_init.sqf";
};

if(param_tpwcas == 1) then {
	// bullet threshold more shots than this will cause unit to drop/crawl.
	tpwcas_st = 5;
	// reveal value when suppressed. 0 = reveal disabled. <1 = suppressed unit
	// knows nothing about shooter. 4 = unit knows the shooter's side, position, shoe size etc.
	tpwcas_reveal = 2.5;
	tpwcas_debug = 0;
	// minimum skill value, none of a unit's skills will drop below this under suppression.
	tpwcas_minskill = 0.15;
	tpwcas_playershake = 0;
	tpwcas_playervis = 0;
	tpwcas_mode = 2;
	if(isServer and isDedicated) then {
		tpwcas_mode = 3
	};
	// enable or disable tpwlos
	if(param_tpwlos == 1) then {
		tpwcas_los_enable = 1;
	} else {
		tpwcas_los_enable = 0;
	};
	// start tpwcas and tpwlos
	[tpwcas_mode] execVM "tpwcas\tpwcas_script_init.sqf";
};
