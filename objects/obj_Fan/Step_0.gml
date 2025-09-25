/// @description Fly

collision_flag = false;
create_effect(x - 8 + random_range(0, 16), y - 4, spr_wind_effect, random_range(0.1, 0.9), 1, 0, -4)
//// Distances
//var x_diff = obj_player.x - x;
//var y_diff = obj_player.y - global.object_timer - y; // oscillation is a value which oscillates from 0 to 15 and back on a sine wave once every 88 frames

//// Calculate force
//var fan_force = floor(y_diff);
//if y_diff > 0
//{
//   fan_force = -(fan_force + 1)
//   fan_force = fan_force * 2;
//}
//fan_force = fan_force + 96;
//fan_force = (-fan_force) / 16; // ">> 4" here is equivalent to dividing by 16, floored. You can substitute it for normal division to get a smoother motion.

if player_collide_object(C_MAIN)
{
// Move the player
obj_player.ground = false;
obj_player.y_speed  = -2;
//obj_player.x_speed = 0;
}