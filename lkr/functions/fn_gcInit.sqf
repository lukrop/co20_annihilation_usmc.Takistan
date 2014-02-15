/*
	File: fn_gcInit.sqf
	Author: lukrop

	License: see LICENSE.txt
	Description:
		Initializes the garbage collector and starts monitoring
		of the queue.

	Parameter(s):
	-

	Returns:
	-
*/

// only run the gc on the server
if(!isServer) exitWith{};
// Disable/Enable debug messages
lkr_gc_debug = false;
// maximum size of the queue
lkr_gc_max_size = 20;
// intervall at which the queue is checked
lkr_gc_intervall = 60;
// start with a empty queue
lkr_gc_queue = [];


if(lkr_gc_debug) then {"Starting lkr garbage collector." call BIS_fnc_log};
// start the monitoring of the queue
objNull spawn lkr_fnc_gcMonitor;
