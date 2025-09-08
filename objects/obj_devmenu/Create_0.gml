/// @description Creation

	BackgroundImage = sprite_create_from_surface(application_surface, 0, 0, global.window_width, global.window_height, false, 0, 0, 0);
	Surface = noone;
	Section = 0;
	Select = 0;
	CoolDown = 4;

	//Storage array

	Presentation = [rm_alpine_ascent1, rm_arboreal_agate1];
	Stages = [rm_alpine_ascent1, rm_alpine_ascent2, rm_arboreal_agate1, rm_arboreal_agate2]
	Unfinished = [];