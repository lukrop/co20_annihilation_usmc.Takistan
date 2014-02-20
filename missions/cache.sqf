/*
	File: cache.sqf
	Author: lukrop

	License: see LICENSE.txt
	Description:
		Mission script. Creates task, creates cache, creates the trigger,
		spawns some enemy infantry, waits until cache is destroyed and
		sets task to succeeded.

	Parameter(s):
	-

	Returns:
	-
*/

_posArray = [0] call lkr_fnc_mhGetMissionLocation;

private ["_posArray", "_vecSpawnMarker", "_reinfMarkers", "_spawnMarkers", "_marker", "_aocenter", "_taskID", "_reinfCount", "_reinfSpawn"];

_vecSpawnMarker = _posArray select 1;
_reinfMarkers = _posArray select 2;
_spawnMarkers = _posArray select 3;

// MARKER
_marker = _posArray select 0;
_aocenter = getMarkerPos _marker;

// CREATE TASK
_taskID = "cacheSearch";
[
west, // who gets the task
_taskID, // task id
[localize "STR_ANI_CACHE_DESCRIPTION", localize "STR_ANI_CACHE", localize "STR_ANI_SAD"], // description, title, marker
_aocenter, // destination
"Assigned", // set as current / state
9 // priority
] call BIS_fnc_taskCreate;

// spawn the weapon cache
_cachePos = getMarkerPos (_spawnMarkers call BIS_fnc_selectRandom);
lkr_wepcache = "O_supplyCrate_F" createVehicle _cachePos;
lkr_wepcache setDir (random 360);
clearWeaponCargo lkr_wepcache;
clearMagazineCargo lkr_wepcache;
clearItemCargo lkr_wepcache;

// LOGIC
lkr_wepCacheDestroyed = false;
["lkr_wepcache", "lkr_wepCacheDestroyed"] call lkr_fnc_mhTriggerOnObjectDestroyed;

// spawn 8 to 12 units, tasked with defending the _cachePos up to a radius of 100 meters
[_aocenter, [8,12], ["defend", _cachePos, 100]] call lkr_fnc_spawnEnemyGroup;
sleep 10;
// spawn 4 units, tasked with patrolling the _aocenter up to a radius of 100 meters
[_aocenter, 4, ["patrol", _aocenter, 100]] call lkr_fnc_spawnEnemyGroup;
sleep 10;
// spawn 4 units, tasked with patrolling the _aocenter up to a radius of 100 meters
[_aocenter, 4, ["patrol", _aocenter, 100]] call lkr_fnc_spawnEnemyGroup;

// wait until the cache is destroyed
waitUntil{sleep 1; lkr_wepCacheDestroyed};
// set the task as succeeded
[_taskID, "Succeeded"] call BIS_fnc_taskSetState;
