/// @description Input & selection logic

	// input
	var dir = 0;
	if (obj_input.LeftPress) dir = -1;
	if (obj_input.RightPress) dir = +1;

	if (dir != 0) {
	    if (move_delay > 0) {
	        move_delay--;
	    } else {
	        slot_index = clamp(slot_index + dir, 0, slot_count - 1);
	        move_delay = move_speed;
	        move_speed = max(move_speed_min, move_speed - move_speed_step);
	       //  audio_play_sound(sfxMenuMove, 1, false); // ← Play move sound
	    }
	} else {
	    move_speed = move_speed_default;
	    move_delay = 0;
	}

	// Select with A
	if (obj_input.APress && !transitioning) {
	    play_sound(sfxMenuSelect);

	    // No Save
	    if (slot_index == 0) {	
	        global.ActiveSave = -1;
	        global.Lives        = 3;
	        global.Continues    = 0;
	        global.ChromaStones = 0;
	        global.Score        = 0;
	        global.ZoneID       = 0;
	        global.SaveState    = 0;
				transitioning = true;
				alarm[2] = 50;
	    }
	    // Save slot
	    global.ActiveSave = slot_index - 1;
	    var save = global.SaveData[slot_index];

	    if (save == 0) {
	        // New Game
	        global.Lives        = 3;
	        global.Continues    = 0;
	        global.ChromaStones = 0;
	        global.Score        = 0;
	        global.ZoneID       = 0;
	        global.SaveState    = 0;			
	        global.SaveIsNew    = true;
			
     // Reset HUD easing
	        play_sound(sfxMenuBack);
	        // fade_perform(ModeInto, BlendBlack, 1);
	         transitioning = true;
	         alarm[0] = 50; 
			 
			 
	    } else {
	        // Load
	        var data = savedata_load(global.ActiveSave);
	        global.SaveData[slot_index] = data;

	        if (is_array(data)) {
	            global.SaveData[slot_index] = data;
	            global.Character      = data[0];
	            global.ZoneID         = data[1];
	            global.ChromaStones   = data[2];
	            global.Lives          = data[3];
	            global.Continues      = data[4];
	            global.SaveState      = data[5];		
	        } else {
	            // No Save
	            global.Lives        = 3;
	            global.Continues    = 0;
	            global.ChromaStones = 0;
	            global.Score        = 0;
	            global.ZoneID       = 0;
	            global.SaveState    = 0;			
	            savedata_save(slot_index - 1);
	            global.SaveData[slot_index] = [
	                global.Character,
	                global.ZoneID,
	                global.ChromaStones,
	                global.Lives,
	                global.Continues,
	                global.SaveState
	            ];
	        }
			
	        play_sound(sfxMenuSelect);
	         //fade_perform(ModeInto, BlendBlack, 1);
	         transitioning = true;
	         alarm[2] = 50;
	    }
	}
		
	if obj_input.Down and obj_input.CPress
	{
	file_delete("saveslot" + string(slot_index) + ".bin");
	play_sound(sfxMenuDelete);
	for (var i = 1; i < slot_count; i++) {
    global.SaveData[i] = savedata_load(i-1);}
	}

	// Cancel with B
	if (obj_input.BPress && !transitioning) {
	    play_sound(sfxMenuBack);
	    transitioning = true;
	    alarm[1] = 50; 
	}

	// ——— Smooth scroll ———
	var target_off = slot_index * slot_spacing;
	menu_offset_x  = lerp(menu_offset_x, target_off, 0.1);
