/// @description Add background
	
	//Inherit the parent event
	event_inherited();
	
	//Vertical scroll factor
	var v_scroll = 0.9;
	
	//Add backgrounds
	add_background(spr_bg_bridge_sky, 0, 0, 1, v_scroll, 0.5,  0, 200);
	add_background(spr_bg_aaz1_mountain, 0, 1, v_scroll, 0, 0, -120, 300);
	add_background(spr_bg_aaz1_hills,  0, 0.9, v_scroll, 0, 0, 0, 150);
	add_background(spr_bg_aaz1_plains, 0, 0.8, v_scroll, 0, 0, 0, 350);
	add_background(spr_bg_aaz1_flickies, 0, 1, v_scroll, 1.0, 0, 0, 250);
	add_background(spr_bg_aaz1_spires, 0, 0.7, v_scroll, 0, 0, 0, 400);
	add_background(spr_bg_aaz1_forest_back, 0, 0.60, v_scroll, 0, 0, 0, 400);
	add_background(spr_bg_aaz1_forest_middle, 0, 0.55, v_scroll, 0, 0, 0, 400);
	add_background(spr_bg_aaz1_forest_front, 0, 0.50, v_scroll, 0, 0, 0, 400);