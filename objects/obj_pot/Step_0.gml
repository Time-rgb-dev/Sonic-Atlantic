/// @description Script
	//Always enable flag
	collision_flag = false;
	//Get colliding player
	var player = instance_nearest(x, y, obj_player);

	
	//When pot isnt destroyed
	if(!destroyed)
	{
		if(player_collide_object(C_BOTTOM))
		{
			destroyed = true;
			play_sound(sfx_destroy);
			
			//Player stuff
			
			with(player)
			{
				y_speed *= -1;
			}
	        // create_debris(x, y, spr_dust_effect, 0, 0, 0);
			create_ringloss(random_range(2, 6));
			obj_camera.camera_shake = 1;
			instance_destroy(self);
		}
	}
