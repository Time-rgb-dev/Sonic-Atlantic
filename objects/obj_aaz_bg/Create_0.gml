/// @description Add background
	
	//Inherit the parent event
	event_inherited();
	
	//Vertical scroll factor
	var v_scroll = 0.9;
	
	//Add backgrounds
	add_background(spr_bg_bridge_sky, 0, 0, 1, v_scroll, 0.5,  0, 200);
	add_background(spr_bg_aaz1_mountain, 0, 1, v_scroll, 0, 0, -120, 300);
	add_background(spr_bg_aaz1_hills,  0, 0.98, 0.86, 0, 0, 0, 250);
	add_background(spr_bg_aaz1_plains, 0, 0.83, 0.84, 0, 0, 0, 550);
	add_background(spr_bg_aaz1_flickies, 0, 1, v_scroll, 1.0, 0, 0, 250);
	add_background(spr_bg_aaz1_spires, 0, 0.7, 0.86, 0, 0, 0, 475);
	add_background(spr_bg_aaz1_forest_back, 0, 0.60, 0.84, 0, 0, 0, 615);
	add_background(spr_bg_aaz1_forest_middle, 0, 0.55, 0.82, 0, 0, 0, 720);
	add_background(spr_bg_aaz1_forest_front, 0, 0.50, 0.80, 0, 0, 0, 800);
	add_background(spr_bg_aaz1_sun, 0, 0.99, 1, 0, 0, 0, -50);