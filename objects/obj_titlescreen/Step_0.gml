// --- Logo easing drop
var drop_speed = 0.1;
logo_y += (logo_target_y - logo_y) * drop_speed;



// --- Text flash effect
if (text_flash_timer > 0) {
    text_flash_timer--;
    show_text = (text_flash_timer div 5) mod 2 == 0; // flashes every 5 frames
} else {
    show_text = true;
}

// --- Start logic
if (obj_input.APress)
{
    text_flash_timer = 30;
//audio_sfx_play(sfxMenuSelect, false);
	alarm_set(0, 45);
						}

