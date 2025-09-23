	with(obj_level)
	{
		//Set stage music and loop points
		stage_music = BGM_TWILIGHT_1;
		stage_ambience = AMB_TWILIGHT_1;
		
	//Set level name
		stage_name = "TWILIGHT SANCTUM";
		stage_subtitle = "MEMORIES FROM THE HEAVENS";
		
		//Set stage act
		act = 1;
		
		//Is next level doing act transition
		act_transition = false;
		
		//Animal array
		animal = [A_FLICKY];
		
		//Next level
		next_level = rm_stage_select;
	}