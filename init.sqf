/*
	File: init.sqf
	Author: lukrop

	License: see LICENSE.txt
	Description:
		Executed when mission is started (before briefing screen)

	Parameter(s):
	-

	Returns:
	-
*/

// disable saving
enableSaving [false, false];

// if using Task Force Radio, don't add a long range radio automatically
tf_no_auto_long_range_radio = true;
// if using Task Force Radio, set all short range radios to the same frequency for each side
//tf_same_sw_frequencies_for_side = true;
