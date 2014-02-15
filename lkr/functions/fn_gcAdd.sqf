/*
	File: fn_gcAdd.sqf
	Author: lukrop

	License: see LICENSE.txt
	Description:
		Adds object to garbage collector queue.

	Parameter(s):
		OBJECT:
			the object to remove

	Returns:
	-
*/

lkr_gc_queue = lkr_gc_queue + [_this];
