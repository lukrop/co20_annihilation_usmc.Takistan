/*
	Author: lukrop
	Date: 10/1/2013
  Description: Mission script. Creates task, creates hvt + guards, creates the trigger,
  spawns some enemy infantry, waits until hvt is dead and sets task to succeeded.

	Parameters:
  -

	Returns:
  -
*/

private ["_posArray", "_missionStyle", "_vecSpawnMarker", "_reinfMarkers", "_spawnMarkers", "_marker", "_aocenter", "_taskID", "_reinfCount"];

_posArray = [0] call lkr_fnc_mhGetMissionLocation;

_vecSpawnMarker = _posArray select 1;
_reinfMarkers = _posArray select 2;
_spawnMarkers = _posArray select 3;

// MARKER
_marker = _posArray select 0;
_aocenter = getMarkerPos _marker;

// CREATE TASK
_taskID = "killhvt";
[
west, // who gets the task
_taskID, // task id
[localize "STR_ANI_KILLHVT_DESCRIPTION", localize "STR_ANI_KILLHVT", localize "STR_ANI_HVT"], // description, title, marker
_aocenter, // destination
"Assigned", // set as current / state
9 // priority
] call BIS_fnc_taskCreate;

// CREATE HVT

_hvtPos = getMarkerPos (_spawnMarkers call BIS_fnc_selectRandom);

ani_hvtClass = "CAF_AG_EUR_AK74";
ani_hvtGuardClass = "CAF_AG_ME_AK74";
_guardClass = ani_hvtGuardClass;
_hvtClass = ani_hvtClass;
_hvtGrp = createGroup east;

_hvtGrp createUnit [_guardClass, _hvtPos, [], 0, "FORM"];
lkr_hvt = _hvtGrp createUnit [_hvtClass, _hvtPos, [], 0, "FORM"];
// do not cache the hvt group
_hvtGrp setVariable ["f_cacheExcl", true, true];

if((round random 5) >= 1) then {
  _hvtGrp createUnit [_guardClass, _hvtPos, [], 0, "FORM"];
};
if((round random 5) >= 3) then {
  _hvtGrp createUnit [_guardClass, _hvtPos, [], 0, "FORM"];
};

[_hvtGrp, _hvtGrp, 50, 6, "MOVE", "SAFE", "GREEN", "LIMITED", "STAG COLUMN"] call CBA_fnc_taskPatrol;

lkr_hvtKilled = false;
["lkr_hvt", "lkr_hvtKilled"] call lkr_fnc_mhTriggerOnObjectDestroyed;

sleep 5;
// spawn enemies
[_aocenter, [8,12], ["defend", _hvtPos, 100]] call lkr_fnc_spawnEnemyGroup;
sleep 10;
[_aocenter, 4, ["patrol", _aocenter, 100]] call lkr_fnc_spawnEnemyGroup;


waitUntil{sleep 2; lkr_hvtKilled};
ani_missionState = "SUCCESS";
[_taskID, "Succeeded"] call BIS_fnc_taskSetState;
