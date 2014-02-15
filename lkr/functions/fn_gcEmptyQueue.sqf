/*
	File: fn_gcEmptyQueue.sqf
	Author: lukrop

	License: see LICENSE.txt
	Description:
		Deletes all objects in the garbage collector queue.

	Parameter(s):
	-

	Returns:
	-
*/

{
	// hide body and delete object
	hideBody _x;
	sleep 5;
	deleteVehicle _x;
} forEach lkr_gc_queue;

// empty the queue
lkr_gc_queue = nil;
lkr_gc_queue = [];
