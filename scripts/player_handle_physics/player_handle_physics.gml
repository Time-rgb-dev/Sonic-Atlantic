function player_handle_physics(){
	//Setup physics table for each character
	var physics_table =
	{
		accel : [0.046875, 0.043875, 0.043875],
		fric : [0.036875, 0.036875, 0.056875],
		grav : [0.21875, 0.21875, 0.21875],
		top_speed : [8.0, 7.0, 7.0],
		jump_strength : [6.5, 7.0, 6.0],
		jump_release : [4.0, 4.0, 4.0],
		slope_up : [0.078125, 0.078125, 0.078125],
		slope_down : [0.3125, 0.3125, 0.3125]
	};
	
	//Assign the physics value
	x_accel = physics_table.accel[character];
	friction_speed = physics_table.fric[character];
	top_speed = physics_table.top_speed[character];
	jump_strength = physics_table.jump_strength[character];
	jump_release = physics_table.jump_release[character];
	roll_influence_up = physics_table.slope_up[character];
	roll_influence_down = physics_table.slope_down[character];
	
	//For gravity it's different case
	if(state != ST_TAILSFLY)
	{
		//Apply the gravity
		y_accel = physics_table.grav[character];
		
		//Underwater gravity
		if(underwater)
		{
			y_accel = 0.0625;	
		}
	}
	
	//Multiplier for speed shoes
	if(speed_shoes_flag) 
	{
        top_speed *= 2.0;
        x_accel *= 2.0;
    }
	
	//Underwater multiplier
    if(underwater) 
	{
        top_speed *= 0.75;
        x_accel *= 0.75;
        friction_speed *= 0.75;
		jump_release *= 0.50;
		
		//This one isn't a multiplier
		jump_strength -= 2.0;
    }
	
	// Wall slide multiplier
	//if (state = ST_WALLSLIDE)
	//{
	//	y_accel *= 0.50;
	//}
	
}