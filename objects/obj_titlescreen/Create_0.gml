/// @description Setup
// You can write your code in this editor
    
	FadeActive = false;
    Starting = false;
    //audio_bgm_play(AudioPrimary, bgm_TitleScreen);
	
 // Logo settings
 
   logo_y = -150;
   logo_target_y = 100; 
   logo_ease_speed = 0.1; // easing factor
   logo_sprite = spr_title_logo;
   show_text = false;

   logo_scale_x = 1;
   logo_scale_y = 1;
   logo_bounce_timer = 0;
   text_flash_timer  = 0;
 
 // Text 
 
	quotes = ["PRESS ANYTHING!"];
	quote_index = irandom(array_length(quotes)-1);