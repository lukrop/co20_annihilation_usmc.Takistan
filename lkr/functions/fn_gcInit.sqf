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

// maximum size of the queue
lkr_gc_max_size = 20;
// intervall at which the queue is checked
lkr_gc_intervall = 60;
// start with a empty queue
lkr_gc_queue = [];

// start the monitoring of the queue
call lkr_fnc_gcMonitor;
