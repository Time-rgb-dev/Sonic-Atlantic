function player_state_spring(){
	//If its not in spring state exit
	if(state != ST_SPRING) exit;
	
	//Change animation
	animation_play(animator, ANIM_SPRING);
	
	//Change state when falling
	if(y_speed >= 0) 
	{
		state = ST_NORMAL
	//Change animation
	
	if y_speed >= 2.0
	  {
	   animation_play(animator, ANIM_FALL);
	  }
	else if y_speed <= -2.0 
    {
	   animation_play(animator, ANIM_SPRING);
	}
	
	}

}