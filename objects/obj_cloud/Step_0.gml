	//Facing upwards
	if(sign(image_yscale) = 1)
	{
		//Hit from the bottom
		if(player_collide_object(C_BOTTOM) && obj_player.y_speed >= 0 && obj_player.mode == 0)
		{

			obj_player.ground_angle += 180;
			obj_player.visual_angle += 180;
			obj_player.ground_angle %= 360;
			with(obj_player)
			{
				disable_mode = true
				player_reposition_mode()
			}
	
            
			triggered = true;
			//state = 1;
			play_sound(sfx_bubble_jump);
			
			//Player stuff
			var player = instance_nearest(x, y, obj_player)
			with(player)
			{
				animation_play(animator, ANIM_SPRING);
				state = ST_NORMAL;
				y_speed = -7.5;
				x_speed =  0.0;
				ground = false;
			}
			
			/*if state == 1
			{
				y = approach(y, targetY, 0.1)
				if y == targetY
				{ state = 2 }
			}
			else if state == 2
			{
				y = approach(y, originY, 0.1)
				if y = originY
				{ state = 0 }
		   }
	     }*/
		 	 
		}
	   }
	   
	    y = base_y + sin(global.object_timer * 0.05) * 4;