// If there are no corkscrews, stop processing
//if(!instance_exists(Corkscrew))
//exit;

with obj_player
{
// If there IS a corkscrew, but we aren't colliding with it, we're moving too slow, or the ground_angle is wrong, stop processing
var _CorkscrewHandle = collision_rectangle(x, y-5, x+(16*sign(ground_speed)), y+28, self, true, true);
if(_CorkscrewHandle == noone) or (abs(ground_speed) < 6) or ((ground_angle < 340) and (ground_angle > 20))
exit;

// Initialize the Variables we'll need

var _Width    = 384; 
var _Height   = 70;
var _XStart   = _CorkscrewHandle.x;
var _XEnd     = _CorkscrewHandle.x+_Width;
    
// If we're in the corkscrew, calculate position


if(x > _CorkscrewHandle.x && x <_XEnd){
		
var _playerAngleCorkscrew = (((x-_XStart)/384)*360) mod 360;

y = _CorkscrewHandle.y-20-(_Height/2)+((_Height/2)*dcos(_playerAngleCorkscrew));

// Zero out vertical movement for now.
// Make sure the ground Flag stays checked or the player will stop processing the corkscrew



y_speed= 0;
ground = true;

// If we aren't spinning, perform the corkscrew animation


if ((!animation_is_playing(animator, ANIM_ROLL)))
{
     animation_play(animator, ANIM_CORKSCREW);
} 
}

else

{
	
	
// If we're not in the corkscrew, reset the animation and stop processing


if ((x_speed > 0) and (x > _XEnd)) or ((x_speed < 0) and (x < _XEnd)) {
	
if (animation_is_playing(animator, ANIM_ROLL))
{
	
attacking = true;

animation_play(animator, ANIM_ROLL);

} else {
	
animation_play(animator, ANIM_RUN);

}
}
exit;
}

if(!animation_is_playing(animator, ANIM_ROLL))
{
	
// Set subimage based on progress through the 


    image_index = ((image_number-1)*((x-_XStart)/(_Width)));

//// Handle Skidding edge case


//    if(((ground_speed >= 4.5 && Input.Left) || (ground_speed <= -4.5 && Input.Right))){
//        Animation = AnimSkid;

//audio_sfx_play(sfxSkid, false);
//instance_create(x, y + RadiusY, DustPuff);
 }
else{
	
// Handle rolling physics through corkscrew

    if(ground_speed > 0)
	
        ground_speed = max(ground_speed - roll_influence_down, 0);
		
    else if(ground_speed < 0)
	
        ground_speed = min(ground_speed + roll_influence_down, 0);
    
    if(Input.Left && ground_speed > 0)
	
ground_speed -= RollDec;

    if(Input.Right && ground_speed < 0)
	
	ground_speed += friction_speed;
    
}

}