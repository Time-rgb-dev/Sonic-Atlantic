/// @description Handle input and selection

// Input delay countdown
if (input_timer > 0) input_timer -= 1;

if (!transitioning) {
    // Handle input
    var dir = 0;
    if (input_timer <= 0) {
        if (obj_input.LeftPress)  dir = -1;
        if (obj_input.RightPress) dir = +1;
    }

    if (dir != 0) {
        input_timer += 10;
        carousel_index += dir;
        play_sound(sfxMenuMove);
    }

    // Smooth scroll toward carousel position
    var target_offset = carousel_index * option_spacing;
    scroll_offset = lerp(scroll_offset, target_offset, 0.1);

    // Determine which character is selected
    char_index = ((carousel_index mod char_count) + char_count) mod char_count;

    // Confirm selection
    if (obj_input.APress) {
		if global.ActiveSave != -1
		{
        if (global.SaveIsNew) {
            global.character = char_index;
             
			play_sound(sfxMenuSelect);
            savedata_save(global.ActiveSave);
            global.SaveData[global.ActiveSave + 1] = [
                global.character,
                global.ZoneID,
                global.ChromaStones,
                global.Lives,
                global.Continues,
                global.SaveState
            ];

            global.SaveIsNew = false;
        }

        // Begin fade-out transition
		confirm_timer = 15;	
        transitioning = true;
		
		draw_set_color(c_white);
        draw_set_alpha(1);
        draw_set_font(-1);

        alarm[0] = 50;
		
    }
		else
		{
				play_sound(sfxMenuSelect);
				confirm_timer = 15;	
				transitioning = true;
				
				draw_set_color(c_white);
				draw_set_alpha(1);
				draw_set_font(-1);
				alarm[0] = 50;
		}
	}
}

	// Confirming animation
if (confirm_timer > 0) {
    confirm_timer -= 1;
    confirm_scale = lerp(confirm_scale, 1.5, 0.25);
    confirm_alpha = lerp(confirm_alpha, 0, 0.25);
} else {
    confirm_scale = 1;
    confirm_alpha = 1;
}

if (!confirm_timer and obj_input.BPress)
   {
	   alarm[1] = 30;
   }