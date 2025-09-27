function player_state_fall()
{
if state != ST_FALL
{exit;}

    create_effect(x, y  + random_range(-5, 5), spr_spark_effect, random_range(0.6, 1.0), -1, 0, random_range(-0.1, 0.4), 0, 0.045);
	
	//Change animation
	animation_play(animator, ANIM_FALL);
	
	if ground
	{ state = ST_NORMAL; }
}