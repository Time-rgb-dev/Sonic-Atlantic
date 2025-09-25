/// @description Script
	//Always enable flag
	//Get colliding player
	collision_flag = true;
	var player = instance_nearest(x, y, obj_player);

	
	
		//Disable flag when attacking
	if(player)
	{
		if(sign(image_yscale) == 1)
		{
			if(player.attacking && player.y_speed >= 0 && player.state != ST_SPINDASH || player.y + player.hitbox_h > bbox_top && player.state == ST_SPINDASH)
			{
				collision_flag = false;
			}
		}
		else
		{
			if(player.attacking && player_collide_object(C_BOTTOM))
			{
				collision_flag = false;
			}
		}
	}
	
	
	//When pot isnt destroyed
	if(!destroyed)
	{
		if(player_collide_object(C_BOTTOM) && player.attacking && (abs(player.x_speed) > 1.0 or player.y_speed > 1.0))
		{
			collision_flag = false;
			destroyed = true;
			play_sound(sfx_pot_break);
			
			//Player stuff
			
			with(player)
			{
				y_speed *= -1;
				ground = false;
			}
	        create_effect(x,y, spr_pot_shard_effect, 0.25);

			create_debris(x, y, spr_pot_shard, 1,  0.6, -1,   0, 0.1654)
			create_debris(x, y, spr_pot_shard, 1,  0.6, -1.5, 0, 0.1654)
			create_debris(x, y, spr_pot_shard, 1, -0.6, -1,   0, 0.1654)
			create_debris(x, y, spr_pot_shard, 1, -0.6, -1.5, 0, 0.1654)
            
			create_ringdrop(random_range(3, 12));
			
			obj_camera.camera_shake = 1;
			instance_destroy(self);
		}
	}
