/// @description Draw the save slots using PosX and PosY



draw_set_font(global.text_random);

var center_x = camera_get_view_x(view_camera[0]) + WINDOW_WIDTH / 2;
var center_y = camera_get_view_y(view_camera[0]) + WINDOW_HEIGHT / 2;
var flash = (floor(current_time / 250) mod 2) + 1;

//draw_sprite_ext(spr_dataselect_bg, 0, center_x, center_y, global.Width / sprite_get_width(spr_dataselect_bg), global.Height / sprite_get_height(spr_dataselect_bg), 0, c_white, 1);
draw_set_color(c_white);

//draw_sprite(spr_save_select_text, 0, center_x, 20)

// Wavy text
		var DevText = string_upper(quotes[quote_index]);
		for(var i = 0; i < string_length(DevText); i++)
		{
			var size;
			size = string_width(string_copy(DevText, 0, i));
			draw_text(floor(((global.window_width/2)-string_width(DevText)/2)+size), floor((global.window_height/2)-108+(2*dsin((current_time/3)+24*i))), string_char_at(DevText , i+1));
		}
		
for (var i = 0; i < slot_count; i++) {
    var PosX = center_x - menu_offset_x + i * slot_spacing - 1;
    var PosY = center_y;

		// 1) Slot sprite
		if (i == 0) {
		    draw_sprite(spr_save_nosaveslot, (slot_index == 0) ? flash : 0, PosX, PosY);
		} else {
		    draw_sprite(spr_save_slot, (slot_index == i) ? flash : 0, PosX, PosY);
		}

       if (i != 0)
	   {
		// --- Draw slot number above each slot ---
		draw_set_color(c_white);
		draw_text(PosX, PosY - 85, string(i));
	   }

    // 2) Save data info (zone icon + lives + ChromaStones)
    if (i > 0) {
        var s = global.SaveData[i];
        if (is_array(s)) {
            var zid = s[1] + 1; // Zone ID
            if (zid >= 0 && zid < sprite_get_number(spr_save_zone_icon)) {
                draw_sprite(spr_save_zone_icon, zid, PosX - 2, PosY - 47);
            }

            var cid = s[0];  // Character ID
            var lvs = s[3];  // Lives
            var Char = s[2]; // ChromaStones

            // Lives icon and count
            draw_sprite(gui_hud_lives, cid, PosX + 3, PosY + 5);
            draw_set_color(c_white);
            draw_text(PosX + 13, PosY +	 5, string(lvs));

            // ChromaStones icon
            if (Char >= 0 && Char < sprite_get_number(spr_save_colorstars_icons)) {
                draw_sprite(spr_save_colorstars_icons, Char, PosX, PosY + 28);
            }
        } else {
            // Empty slot = draw "New Game" icon
            draw_sprite(spr_save_zone_icon, 0, PosX, PosY - 47);
        }
    }
}

// ——— Cursor at center ———
//draw_sprite(spr_save_cursor, 0, center_x, center_y);
//draw_text(center_x, center_y, slot_index);


// ——— Reset drawing state to defaults ——