/*
	File: fn_mhGetMissionLocation.sqf
	Author: lukrop

	License: see LICENSE.txt
	Description:
		Sets a variable to true as soon as the
		given object is destroyed/dead.

	Parameter(s):
		0: SCALAR
			mission type: city = 0, land = 1
		1: STRING
			variable name to set to true
			as soon as the object is destroyed
	Returns:
	-
*/
private ["_posArray"];

_missionStyle = _this select 0;

switch (_missionStyle) do {
	// city mission
	case 0: {
		// select a random entry (positions)
		_index = round (random ((count lkr_city_markers) - 1));
		_posArray = lkr_city_markers select _index;
		// remove location from possible future missions
		lkr_city_markers set [_index, -1];
		lkr_city_markers = lkr_city_markers - [-1];
	};
	// land mission
	case 1: {
		_index = round (random ((count lkr_land_markers) - 1));
		_posArray = lkr_land_markers select _index;
		lkr_land_markers set [_index, -1];
		lkr_land_markers = lkr_land_markers - [-1];
	};
};

_posArray
