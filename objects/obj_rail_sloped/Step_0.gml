/// @description Grind
// You can write your code in this editor

/*
// Solid

if !Input.Up and !Player.Hurt 
{
	
object_act_solid(false, true, false, true);


}


if object_check_player(ColSolidU) and Player.Grinding = false 
{
Player.Grinding = true;
audio_sfx_play(sfxRailConnect, false);
audio_sfx_play(sfxRailGrind, true);
}

if !Player.Grounded { audio_sfx_stop(sfxRailGrind);}
