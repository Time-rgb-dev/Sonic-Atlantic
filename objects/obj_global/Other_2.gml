/// @description Set the value
	
	//Dev stuff
	global.dev_mode = true;					//Flag for developer mode, which allows you to use dev commands, don't forget to turn this off when releasing the game
	
	//Character globals
	global.character = 0		//Global value for the character
	
	//Screen values
	global.window_width  = 426;	  	// 426 // 484		            //Window's horizontal size
	global.window_height = 240;		// 240 // 224 //272 //302		//Window's vertical size
	global.window_size   = 3;				//Window size multiplier
	
	//keyboard inputs
	global.up = vk_up;						
    global.down = vk_down;
    global.left = vk_left;
    global.right = vk_right;
    global.a = ord("Z");
    global.b = ord("X");
    global.c = ord("C");
	global.l = ord("S");
	global.r = ord("D");
    global.start = vk_enter;
	
	//Setup volume
	global.bgm_volume = 1;					//Music's channel volume
	global.sfx_volume = 1;					//Sound effects volume
	
	//Checkpoint values
	global.checkpoint = ds_list_create();	//The list of active checkpoints
	global.checkpoint_id = noone;			//Checkpoint that is currently active
	global.time_store = 0;					//Store value for timer when checkpoint gets active
	
	//Stage values
	global.object_timer = 0;				//Object pre frame timer, every 60 frames in a 1 second
	global.score = 0;						//Global variable for score
	global.stage_timer = 0;					//Global variable for stage timer
	global.rings = 0                        //Global variable for rings
	global.shells = 0                       //Global variable for rings
	global.life = 3;						//Global variable for life
	global.title_card = false;				//Flag that allows title card to be triggered, used in dev
	global.emeralds = [false, false, false, false, false, false, false];				//List of active emeralds
	global.col_tile = ["CollisionMain", "CollisionSemi", "CollisionA", "CollisionB"];	//List of collision layers
	
	//Act transition variables
	global.monitor_store = [];				//List of monitor instances that were bumped with sign
	global.monitor_id = 0;					//Current list ID of bumped monitor
	global.act_transition = false;			//Act transition trigger, this is active for a single frame when new act starts
	
	//Extra life stuff
	global.score_extralife = 50000;			//Score threshold for extra life
	global.ring_extralife = 100;			//Ring threshold for extra life
	
	//Customizables variables
	global.rotation_type = 2;				//This changes player's visual rotation 
	global.use_battery_rings = false;		//If this is disabled, destroying enemies will spawn flickies instead
	global.chaotix_monitors = true;		//Changes monitor icons to be like chaotix, monitor icon spins and it turns into dust
	global.use_peelout = true;				//Flag that allows peel-out ability
	global.use_dropdash = true;				//Flag that allows dropdash ability
	global.use_airroll = true;				//Flag that allows rolling while air-borne
	global.chaotix_dust_effect = true;		//Flag that disables classic spindash/skid dust effect
	global.camera_type = 1;					//Vertical camera scrolling type, 0 = Megadrive, 1 = Mania
	global.knux_camera_smooth = true;		//Flag for using smooth ledge climb camera movement
	
	//Badge Variables
	global.maxrev_bonus = 0;
	
	//Font setup:
	global.hud_number = font_add_sprite(spr_hud_numbers, ord("0"), false, 0);
	global.text_font = font_add_sprite_ext(spr_hud_font, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ", false, 0);
	global.font_small = font_add_sprite_ext(fontDebug, " ! #$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ", false, 0);
	global.text_random = font_add_sprite_ext(spr_font_random, "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ.:-!", true, 1);
	
	//Create controllers:
	instance_create_depth(0, 0, 0, obj_window);
	instance_create_depth(0, 0, 0, obj_input);
	instance_create_depth(0, 0, 0, obj_music);
	instance_create_depth(0, 0, -100, obj_fade);
	
	//Controlers for dev mode
	if(global.dev_mode) 
	{
		instance_create_depth(0, 0, 0, obj_dev);
		instance_create_depth(0, 0, 0, obj_shell);
	}
	
	//Initilize the music list
	init_music_list();
	
	//Macros:
	#macro Input obj_input
	#macro WINDOW_WIDTH global.window_width
	#macro WINDOW_HEIGHT global.window_height
	#macro OBJECT_TIMER global.object_timer
	
	// Data Setup
	
		// Initialise other variables. Do not edit these
    global.SaveIsNew       = 0;
	global.character	   = 0;
    global.ActiveSave      = 0;
	global.SaveData		   = 0;
	global.SaveState       = 0;
	global.StartFullscreen = 0;
	global.WindowSize	   = 0;
	global.MusicVolume	   = 0;
	global.SoundVolume     = 0;
	global.Score		   = 0;
	global.TotalRings      = [];
	global.Lives		   = 0;
	global.Continues	   = 0;
    global.Shells          = 0;
	global.ChromaStones    = 0;
	global.ZoneID		   = 0;
	global.StageRoom       = 0;
	global.GameStartTime   = 0;	
	global.StarPostData    = [];
	global.BonusStageData  = [];
	global.SpecialRingData = [];
	global.SpecialRingList = [];
	
	
	//Ending event:
	room_goto_next();
