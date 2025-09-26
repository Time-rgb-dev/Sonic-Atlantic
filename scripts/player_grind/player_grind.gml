// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_grind()
{
if !grinding
{
	if (audio_is_playing(sfx_rail_grind))
	{audio_stop_sound(sfx_rail_grind)};
	
	exit;
}

// Grind Effects


	movement_allow = false;
	can_roll = false;
	
	if !grind_crouch
	{anim = ANIM_GRIND;}
	else {
		anim = ANIM_GRIND_CROUCH;
		}
	// create dust / sparks
	create_effect(x + hitbox_w*(0-facing), y + hitbox_h, spr_spark_effect, random_range(0.4, 1.0), 1, 0, random_range(-1.0, 0.0),, 0)
	
// Accelerate to minimum speed
  if facing = 1
  {
	  if ground_speed < 2
	  {
		  ground_speed = ground_speed + 0.25;
	  }
  }
  else
      {
		  if ground_speed > -2
		  {
			  ground_speed = ground_speed - 0.25;
		  }
	  }

    // Lock speed
	clamp(abs(ground_speed), 3, 17);
    attacking   = false;
	
	
if Input.Down

// Rail Crouch
{ 
grind_crouch = true;
}
else grind_crouch = false;

    
	
	

// Spawn Rail Sparks

//if abs(ground_speed) >= 3 and !instance_exists(RailGrindSparks)
//{
//instance_create(PosX + RadiusX, PosY + RadiusY, RailGrindSparks);
//}
	
// Exit Grind State

if (!on_object) {grinding = false}; 
if !ground
{
	grinding = false;
}


//// Crouch Spam speeds you up

//if RailCrouch = true and !Input.Down
//{ 
//	RailCrouch = false;
//	ground_speed += 1 * facing;
//   audio_sfx_play(sfxDoubleSpinAttack,false);

//}


//if Input.Up 
//{
//	on_object = noone;
//}

// end region


}


