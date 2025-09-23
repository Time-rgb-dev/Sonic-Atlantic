/// @description Add background
	
	//Inherit the parent event
	event_inherited();
	
	//Vertical scroll factor
	var v_scroll = 0.88;
	
	//Background mode (Used for BG switch)
	bg_mode = 0;
	
	//Add backgrounds, ID starting out from 0, increments by 1 with each background added
	
	add_background(spr_bg_tsz_sky, 0, 1, v_scroll,  0, 0, 0, 100);
	add_background(spr_bg_tsz_sky, 1, 1, v_scroll, 0, 0, 0, 100);
	add_background(spr_bg_tsz_sky, 2, 1, v_scroll, 0, 0, 0, 100);
	add_background(spr_bg_tsz_sky, 3, 1, v_scroll, 0, 0, 0, 100);
	add_background(spr_bg_tsz_sky, 4, 1, v_scroll, 0, 0, 0, 100);
	
	add_background(spr_bg_tsz_moon, 0, 1.0, v_scroll, 0, 0, 320, 100);
	
	add_background(spr_bg_tsz_cloudlayer, 0, 1, v_scroll, -0.6, 0, 0, 120);
	
	add_background(spr_bg_tsz_ruins, 0, 0.99, v_scroll, 0, 0, 0, 75) ;
	add_background(spr_bg_tsz_ruins, 1, 0.97, v_scroll, 0, 0, 0, 65);
	add_background(spr_bg_tsz_ruins, 2, 0.93, v_scroll, 0, 0, 0, 50)	 ;
	
	
	add_background(spr_bg_tsz_cloudlayer, 1, 1, v_scroll, -1.2, 0, 0, 170);
	add_background(spr_bg_tsz_cloudlayer, 2, 1, v_scroll, -2.4, 0, 0, 180, false);
	
	// You may use fractions as parallax factors too!
	//add_background(spr_bg_aaz_ruins, 1, 2/3, 2/3, 0, 0, 0, 0, false);

