/*
	File: fn_gcMonitor.sqf
	Author: lukrop

	License: see LICENSE.txt
	Description:
		Monitors the garbage collector queue and initiates
		the removing of objects if the queue is full.

	Parameter(s):
	-

	Returns:
	-
*/

// endless loop
while {true} do {
	// check if the queue is full
	if(count lkr_gc_queue > lkr_gc_max_size) then {
		// empty the queue
		call lkr_fnc_gcEmptyQueue;
	};
	// wait a minute
	sleep lkr_gc_intervall;
};
