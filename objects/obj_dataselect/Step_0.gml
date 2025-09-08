/// @description Input & selection logic

	// ——— Navigation with hold-repeat ———
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

	// ——— Confirm with A ———
	if (obj_input.APress && !transitioning) {
	    //audio_play_sound(sfxMenuSelect, 1, false); // ← Play confirm sound

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
				alarm[2] = 50; // delay before going to stage

	 
	    }

	    // Save slot
	    global.ActiveSave = slot_index - 1;
	    var save = global.SaveData[slot_index];

	    if (save == 0) {
	        // New Game — go to character select screen
	        global.Lives        = 3;
	        global.Continues    = 0;
	        global.ChromaStones = 0;
	        global.Score        = 0;
	        global.ZoneID       = 0;
	        global.SaveState    = 0;			
	        global.SaveIsNew    = true;
			
     // Reset HUD easing
	 

				
	        // audio_play_sound(sfxMenuSelect, 1, false); // ← Play back sound
	        // fade_perform(ModeInto, BlendBlack, 1);
	         transitioning = true;
	         alarm[0] = 50; // delay before going back
			 
			 
	    } else {
	        // LOAD existing
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
	            // No save — treat as new game
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
			
	        //audio_play_sound(sfxMenuSelect, 1, false); // ← Play select sound
	         //fade_perform(ModeInto, BlendBlack, 1);
			
	         transitioning = true;
	         alarm[2] = 50; // delay before going to stage
	    }
	}

	// ——— Cancel with B (fades out then returns) ———
	if (obj_input.BPress && !transitioning) {
	   // audio_play_sound(sfxMenuBack, 1, false); // ← Play back sound
	   // fade_perform(ModeInto, BlendBlack, 1);
	    transitioning = true;
	    alarm[1] = 50; // delay before going back
	}

	// ——— Smooth scroll ———
	var target_off = slot_index * slot_spacing;
	menu_offset_x  = lerp(menu_offset_x, target_off, 0.1);
