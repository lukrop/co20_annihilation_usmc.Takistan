/*
	File: uav.sqf
	Author: lukrop

	License: see LICENSE.txt
	Description:
		Mission script. Creates task, creates uav, creates the trigger,
		spawns some enemy infantry, waits until uav is destroyed and
		sets task to succeeded.

	Parameter(s):
	-

	Returns:
	-
*/

_markerArray = ["land"] call lkr_fnc_getMissionLocation;

_scoutMarker = _markerArray select 1;

// MARKER
_marker = _markerArray select 0;
[[_marker, 1], "lkr_fnc_changeMarker", true, true] spawn BIS_fnc_MP;

_centerPos = getMarkerPos _marker;

// CREATE TASK
_taskID = "uavSearch";
[
west, // who gets the task
_taskID, // task id
[localize "STR_ANI_UAV_DESCRIPTION", localize "STR_ANI_UAV", localize "STR_ANI_SAD"], // description, title, marker
_centerPos, // destination
"Assigned", // set as current / state
9 // priority
] call BIS_fnc_taskCreate;

// CREATE UAV
_uavPos = [_centerPos, random 360, 30 max (random 300)] call SHK_pos;
lkr_uav = lkr_uav_C createVehicle _uavPos;
lkr_uav setDir (random 360);

// LOGIC
lkr_uav_destroyed = false;
["lkr_uav", "lkr_uav_destroyed"] call lkr_fnc_mhTriggerOnObjectDestroyed;


waitUntil{sleep 2; lkr_uav_destroyed};
// set mission success
[_taskID, "Succeeded"] call BIS_fnc_taskSetState;
// add to garbage collector queue
lkr_uav call lkr_fnc_gcAdd;
