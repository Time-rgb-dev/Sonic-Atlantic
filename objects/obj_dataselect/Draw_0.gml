
draw_set_font(global.text_random);

var middle_x = camera_get_view_x(view_camera[0]) + WINDOW_WIDTH / 2;
var middle_y = camera_get_view_y(view_camera[0]) + WINDOW_HEIGHT / 2;
var flash = (floor(current_time / 250) mod 2) + 1;

draw_set_color(c_white);
// Wavy text
		var DevText = string_upper(quotes[quote_index]);
		for(var i = 0; i < string_length(DevText); i++)
		{
			var size;
			size = string_width(string_copy(DevText, 0, i));
			draw_text(floor(((global.window_width/2)-string_width(DevText)/2)+size), floor((global.window_height/2)-108+(2*dsin((current_time/3)+24*i))), string_char_at(DevText , i+1));
		}
		
for (var i = 0; i < slot_count; i++) {
    var PosX = middle_x - menu_offset_x + i * slot_spacing;
    var PosY = middle_y;

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
		draw_text(PosX, PosY - 90, string(i));
	   }

    // 2) Save data info 
    if (i > 0) {
        var s = global.SaveData[i];
        if (is_array(s)) {
            var zid = s[1] + 1; // Zone ID
            if (zid >= 0 && zid < sprite_get_number(spr_save_zone_icon)) {
                draw_sprite(spr_save_zone_icon, zid, PosX, PosY - 47);
            }

            var cid = s[0];  // Character ID
            var lvs = s[3];  // Lives
            var Char = s[2]; // ChromaStones

            // Lives icon and count
            draw_sprite(spr_hud_life_icons, cid, PosX - 17, PosY);
            draw_set_color(c_white);
            draw_text(PosX + 13, PosY +	8, string(lvs));

            // ChromaStones icon
            if (Char >= 0 && Char < sprite_get_number(spr_save_colorstars_icons)) {
                draw_sprite(spr_save_colorstars_icons, Char, PosX, PosY + 24);
            }
        } else {
            // Empty slot = draw "New Game" icon
            draw_sprite(spr_save_zone_icon, 0, PosX, PosY - 47);
        }
    }
}
