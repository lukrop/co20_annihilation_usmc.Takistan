/*
	File: fn_enableGarbageCollection.sqf
	Author: lukrop

	License: see LICENSE.txt
	Description:
		Enables garbage collection for a group or unit.

	Parameter(s):
		0: OBJECT, GROUP
			Group, unit, object or vehicle to enable garbage collection for.

	Returns:
	-
*/
private ["_group", "_addToQueue"];

_param0 = [_this, 0, objNull, [objNull,grpNull]] call BIS_fnc_param;

_addToQueue = {
	_obj = _this;
	// add a killed event handler which adds the unit to the gc queue
	_obj addEventHandler ["killed", {
		// optional timeout before added to gc queue
		// sleep 120;
		(_this select 0) call lkr_fnc_gcAdd;
	}];
};

// add object to gc queue
if(typename _param0 == "OBJECT") then {
	_param0 call _addToQueue;
} else {
	// add every unit of group to queue
	{
		_x call _addToQueue;
	} count units _param0;
};
