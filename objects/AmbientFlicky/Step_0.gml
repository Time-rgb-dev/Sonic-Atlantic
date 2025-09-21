/// @description Fly if Player near
// You can write your code in this editor
// Play animation in sync with all rings


	if object_check_player(ColTrigger)
	{
		StartPanicking = true;
	}
	// Start Animating
	if StartPanicking = true
	{
		
	animation_play(sprite_index,[1, 2, 5, 5, 5, 5], 2);
	
	if (floor(image_index) == 3)
	{
	StartFlying = true

	}
	// Start MOVING
	if StartFlying = true
	{
	 y = y - choose(1, 2, 3);
     x = x + choose(5, 6, 8);
	}
	}
	if (floor(image_index) == 3)
	{
		audio_sfx_play(sfxFlickytweet, false);
	}