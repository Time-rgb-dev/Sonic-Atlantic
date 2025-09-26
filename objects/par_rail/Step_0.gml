/// @description Grind
// You can write your code in this editor

var player = obj_player

// Solid

if !Input.Up
{collision_flag = true};

if player_collide_object(C_BOTTOM) and !player.grinding
{
	if player.state = ST_DROPDASH
	{
		if (abs(player.ground_speed) < 6){player.ground_speed = 6 * player.facing}
		play_sound(sfx_release);
		
		//Camera lag
		obj_camera.h_lag = 8;
	}
player.grinding = true;
player.state = ST_NORMAL;
play_sound(sfx_rail_connect);
play_sound(sfx_rail_grind, true);
}
