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
	
	dust_effect(0);
	
	var input_towards_facing = facing ? Input.Right : Input.Left;
			
	      if !input_towards_facing
		    {
				direction_allow = true;
				state = ST_NORMAL;
			}
			
}
