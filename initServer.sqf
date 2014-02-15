/*
	File: initServer.sqf
	Author: lukrop

	License: see LICENSE.txt
	Description:
		Executed only on server when mission is started.

	Parameter(s):
	-

	Returns:
	-
*/

// set the date
setDate [2014,4,2,param_daytime,0];

// caching/decaching after 1500m
f_param_caching = 1500;
f_var_debugMode = 0;
// start unit caching after 15 seconds
[15] execVM "f\cache\fn_cInit.sqf";
