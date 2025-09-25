
	
	var player = instance_nearest(x, y, obj_player)
		
		//Hit from the bottom
		if(player_collide_object(C_BOTTOM) && obj_player.y_speed >= 0 && obj_player.mode == 0)
		{
			if sprite_index = spr_cloud
			{
				sprite_index = spr_cloud_activated
			    alarm_set(0, 10);
			}
			
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
			with(player)
			{
				animation_play(animator, ANIM_WALK);
				y_speed = -7.5;
				x_speed =  0.0;
				ground = false;
		    }
		  }
			    y = base_y + sin(global.object_timer * 0.05) * 4;