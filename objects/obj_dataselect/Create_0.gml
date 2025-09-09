/// @description Initialization 

// Zone setup
global.ZoneOrder = [
  rm_alpine_ascent1,
  rm_alpine_ascent2
];

// text setups
	quotes = ["DATA SELECT!"];
	quote_index = irandom(array_length(quotes)-1);
	
slot_count     = 6; // 0 = No Save, 1–5 = real saves
slot_index     = 1;
menu_offset_x  = 0;
slot_spacing   = 120;

transitioning = false;

move_speed_default = 20;
move_speed         = move_speed_default;
move_speed_min     = 2;
move_speed_step    = 2;
move_delay         = 0;

// — Load SaveData —
global.SaveData = array_create(slot_count, 0);
for (var i = 1; i < slot_count; i++) {
    global.SaveData[i] = savedata_load(i-1);
}
