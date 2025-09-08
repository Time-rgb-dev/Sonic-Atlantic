// Get the camera's top-left corner
var cam = view_get_camera(0);
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);

var center_x = display_get_gui_width() / 4;
var logo_w = sprite_get_width(logo_sprite);
var logo_h = sprite_get_height(logo_sprite);


// --- Draw logo
draw_sprite_ext(logo_sprite, 0, center_x, logo_y, logo_scale_x, logo_scale_y, 0, c_white, 1);

// --- Draw text
if (show_text)
{
    draw_set_halign(fa_center);
	draw_set_font(global.text_random);
    draw_set_color((text_flash_timer > 0 && (text_flash_timer div 5) mod 2 == 0) ? c_white : c_yellow);
		var DrawText = string_upper(quotes[quote_index]);
		for(var i = 0; i < string_length(DrawText); i++)
		{
			var size;
			size = string_width(string_copy(DrawText, 0, i));
			draw_text(floor(((global.window_width/2)-string_width(DrawText)/2)+size), floor((global.window_height/2)+75+(8*dsin((current_time/3)+24*i))), string_char_at(DrawText , i+1));
		}
}

