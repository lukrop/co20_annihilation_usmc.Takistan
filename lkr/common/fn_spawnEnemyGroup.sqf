/*
	File: fn_spawnEnemyGroup.sqf
	Author: lukrop

	License: see LICENSE.txt
	Description:
		Spawns a enemy group.

	Parameter(s):
		0: STRING, OBJECT, ARRAY:
			The spawn position of the enemy group. Can be a
			marker name in which case a random position is choosen
			within the marker. Can be a object or a position.
		1: SCALAR, ARRAY:
			Amount of units. Can be a array with min and max.
		2: STRING:
			The groups task
		3: BOOL:
			Whether to do garbage collection or not.
			If true dead bodies of this group will be removed
			by the garbage collector. Default is true.

	Returns:
	-
*/

// check for the correct amount of paramters
//if(count _this < 3) then exitWith{};

private ["_pos", "_size", "_task", "_gc", "_unitsList"];

// check if the paramter is defined if not use [0,0,0]
// paramter can be a string, object or a array of count 3
_param0 = [_this, 0, [0,0,0], [objNull,[],""], [3]] call BIS_fnc_param;
// get the second parameter
_param1 = [_this, 1, 4, [0,[],""], [2]] call BIS_fnc_param;
// get the third paramter and set it to "patrol" if none is provided
_task = [_this, 2, "patrol", [""]] call BIS_fnc_param;
// check if we should do garbage collection
_gc = [_this, 3, true, [true]] call BIS_fnc_param;

// get a usable position from the diffrent variable types
if(typename _param0 == "OBJECT") then {_pos = getPos _param0};
if(typename _param0 == "ARRAY") then {_pos = _param0};
// if it's a string we assume it's a marker name
// let's choose a random position within the marker
if(typename _param0 == "STRING") then {_pos = _param0 call SHK_pos};

// write warning to rpt if we are spawning to [0,0,0] usually something is fishy in this case
if((_pos select 0) == 0 && (_pos select 1) == 0 && (_pos select 2) == 0) then {
	"Warning! Spawning group at origin position [0,0,0]." call BIS_fnc_log
};

// if its an array the first number is the min amount of units
// and the second the maximum units
if(typename _param1 == "ARRAY") then {
	_min = _param1 select 0;
	_max = _param1 select 1;
	_size = _min max (round random _max);
};
if(typename _param1 == "SCALAR") then {_size = _param1};


// create unit list for the group;
_unitsList = [];
_unitsList = _unitsList + [(lkr_enemy_inf_leaders_C call BIS_fnc_selectRandom)];

for "_i" from 1 to (_size - 1) do {
	_unitsList = _unitsList + [(lkr_enemy_inf_units_C call BIS_fnc_selectRandom)]
};

// spawn the group
_enemyGroup = [_pos, lkr_enemy_side, _unitsList,[],[],lkr_enemy_skill_range,[],[],0] call BIS_fnc_spawnGroup;

// if we do garbage collection enable it for the whole group
if(_gc) then {_enemyGroup call lkr_fnc_enableGarbageCollection};

