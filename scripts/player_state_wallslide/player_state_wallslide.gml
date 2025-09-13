function player_state_wallslide()
{

	//If its not in wallslide state, then exit.
	if(state != ST_WALLSLIDE) exit;
	
	//Change animation
	animation_play(animator, ANIM_WALLSLIDE);
	
	//gravity_allow = false;
	direction_allow = false;
	//y_speed = 0;
	
		if ground = true
	{
		state = ST_JUMP;
	}
	
	effect_create_above(spr_dust_effect, x, y, 1, c_white);
	
	var input_towards_facing = facing ? Input.Right : Input.Left;
			
	      if !input_towards_facing
		    {
				direction_allow = true;
				state = ST_NORMAL;
			}
			
}
