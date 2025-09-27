function player_state_twirl(){
	//If its not in spring state exit
	if(state != ST_TWIRL) exit;
	
	//Change animation
	//animation_play(animator, ANIM_SPRING);
	
	//Change state when falling
	if(ground)
	{
		state = ST_NORMAL;
	}
}