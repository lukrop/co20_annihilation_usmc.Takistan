/*
	File: fn_tawvdInit.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master init for TAW View Distance (Addon version). If the script verson is present it will exit.
*/
//if(!isMultiplayer) exitWith {};
tawvd_foot = 1300;
tawvd_car = 2000;
tawvd_air = 3000;
tawvd_addon_disable = true;
//The hacky method... Apparently if you stall (sleep or waitUntil) with CfgFunctions you stall the mission initialization process... Good job BIS, why wouldn't you spawn it via preInit or postInit?
objNull spawn
{
	waitUntil {!isNull player && player == player};
	waitUntil{!isNil "BIS_fnc_init"};
	waitUntil {!(isNull (findDisplay 46))};

	tawvd_action = player addAction["<t color='#FFFF00'>Viewdistance</t>",TAWVD_fnc_openTAWVD,[],-99,false,false,"",''];

	objNull spawn TAWVD_fnc_trackViewDistance;
};