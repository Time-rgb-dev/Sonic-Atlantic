function player_state_jump(){
	//List of states that allow for jumping
	var can_jump_states = [ST_NORMAL, ST_ROLL, ST_SKID, ST_WALLSLIDE];
	
	//Run the loop on array
	for (var i = 0; i < array_length(can_jump_states); ++i) 
	{
		//If states match the ones on the list, allow for jumping
	    if(state == can_jump_states[i])
		{
			can_jump = true;
		}
	}
	
	//Trigger jump
	if(press_action && !touching_ceiling && !force_roll && can_jump)
	{
		if state != ST_WALLSLIDE
		{
			if ground
			{
		//Change animation
		animation_play(animator, ANIM_ROLL);
		
		//Jump off the terrain
		y_speed -= jump_strength * dcos(ground_angle);	
		x_speed -= jump_strength * dsin(ground_angle);
			
		//Trigger the jump flag
		jump_flag = true;
			
		//Detach player off the ground and change state
		ground = false;
		state = ST_JUMP;
			
		//Change jump animation duration
		jump_anim_speed = floor(max(0, 4-abs(ground_speed)));
			
		//Reset angle and floor mode
		ground_angle = 0;
		player_reposition_mode(CMODE_FLOOR);
			
		//Play the sound
		play_sound(sfx_jump);
		}
		    }
			
		else
		{
				//Change animation
		animation_play(animator, ANIM_FALL);
		
		//Jump off the terrain
		y_speed = -7;
		x_speed = -6 * facing;
		//
		
		facing = -facing;
			
		//Trigger the jump flag
		jump_flag = true;
			
		//Detach player off the ground and change state
		ground = false;
		state = ST_JUMP;
			
		//Change jump animation duration
		jump_anim_speed = floor(max(0, 4-abs(ground_speed)));
			
		//Reset angle and floor mode
		ground_angle = 0;
		player_reposition_mode(CMODE_FLOOR);
			
		//Play the sound
		play_sound(sfx_land);
		}
	}
	
	
	//Do the air roll
	if(press_action && !ground && global.use_airroll)
	{
		if(state == ST_NORMAL || state == ST_SPRING)
		{
			state = ST_JUMP;
			jump_flag = false;
			ceiling_lock = 2;
			jump_anim_speed = floor(max(0, 4-abs(ground_speed)));
		}
	}
	
	if(Input.RPress && !ground && state == ST_JUMP and global.rings >= 5)
	{
		{
			state = ST_FALL;
			jump_flag = false;
			ceiling_lock = 2;
			x_speed = (7.5 * facing)
			y_speed = 0.0;
			obj_camera.h_lag = 5.0;
			play_sound(sfx_release);
			global.rings -= 5;
		}
	}
	//Stop if its not jump state
	if(state != ST_JUMP) 
	{
		exit;
	}
	
	//Change flags
	attacking = true;
	
	//Limit the jump when key is released
	if(!hold_action && y_speed < -jump_release && jump_flag)
	{
		jump_flag = false;
		y_speed = -jump_release;
	}

	//Change animation
	animation_play(animator, ANIM_ROLL);
	
	//Change animation speed
	if(character != CHAR_TAILS)
	{
		animation_set_duration(animator, jump_anim_speed);
	}
	
	//Reset when grounded
	if(ground) state = ST_NORMAL;
	
	//Get input presses
	var mov = hold_right - hold_left;
	
		//Pushing animation
	if(mov = facing && !ground)
	{
		if(point_check((wall_w + 1) * facing, wall_h)|| check_object(-(wall_w + 1) * facing, hitbox_h, (wall_w + 1) * facing, hitbox_h))
		{
			anim = ANIM_WALLSLIDE;
			state = ST_WALLSLIDE;
		}
	}
	
	
}