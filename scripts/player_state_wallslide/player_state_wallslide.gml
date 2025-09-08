function player_state_wallslide()
{

	//If its not in wallslide state, then exit.
	if(state != ST_WALLSLIDE) exit;
	
	//Change animation
	animation_play(animator, ANIM_PUSH);
	
	direction_allow = false;
	effect_create_above(ef_cloud, x, y, 1, c_white);
	
}
