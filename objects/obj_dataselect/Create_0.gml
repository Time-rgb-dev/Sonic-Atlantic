/// @description Initialization for Data Select Screen

// Play theme


// Zone setup (for starting zone)
global.ZoneOrder = [
  rm_alpine_wilds1,
  rm_alpine_wilds2
];


	quotes = ["DATA SELECT!"];
	
	quote_index = irandom(array_length(quotes)-1);
	
// Menu & scrolling
slot_count     = 6; // 0 = No Save, 1–5 = real saves
slot_index     = 1;
menu_offset_x  = 0;
slot_spacing   = 120;

transitioning = false;

// Repeat-rate variables
move_speed_default = 20;
move_speed         = move_speed_default;
move_speed_min     = 2;
move_speed_step    = 2;
move_delay         = 0;

// — Load SaveData —
global.SaveData = array_create(slot_count, 0);
// Index 0 is the “No Save” slot, leave it at 0
for (var i = 1; i < slot_count; i++) {
    // savedata_load expects a 0-based slot, so pass (i-1)
    global.SaveData[i] = savedata_load(i-1);
}
