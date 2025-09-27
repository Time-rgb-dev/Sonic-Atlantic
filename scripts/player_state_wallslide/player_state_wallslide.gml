function player_state_wallslide()
{

	//If its not in wallslide state, then exit.
	if(state != ST_WALLSLIDE) exit;
	
	//Change animation
	animation_play(animator, ANIM_WALLSLIDE);
	
	//gravity_allow = false;
	direction_allow = false;
	
		if ground = true
	{
		state = ST_JUMP;
	}
	
	if !audio_is_playing(sfx_slide_fast)
	{play_sound(sfx_slide_fast);}
	create_effect(x + hitbox_w*(facing) + random_range(-5, 5), y + hitbox_h, spr_dustpuff_effect, random_range(0.4, 1.1), 1, random_range(-0.1, 0.1), random_range(-0.1, 0.4), 0, 0.045);
	
	var input_towards_facing = facing ? Input.Right : Input.Left;
			
	      if !input_towards_facing
		    {
				direction_allow = true;
				state = ST_NORMAL;
			}
			
}
