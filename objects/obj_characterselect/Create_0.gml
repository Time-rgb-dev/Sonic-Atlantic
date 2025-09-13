/// @description Initialize 

// Play main menu theme
//audio_sfx_play(bgm_MainMenu, true);

// Defaults
global.character = 0;

fade_in_room(5);

// Character data
char_count       = 3;
char_index       = 0; // Actual character selected (0 = Sonic, 1 = Tails, 2 = Knuckles)
carousel_index   = 0; // Visual index that scrolls infinitely
scroll_offset    = 0; // Smooth scrolling offset
input_timer      = 0;
transitioning    = false;

// Visuals
option_spacing   = 250;

// Names for display
char_names = 

	[
    "SONIC THE HEDGEHOG",
    "MILES 'TAILS' PROWER",
    "KNUCKLES THE ECHIDNA"
];

confirm_timer = 0;
confirm_scale = 1;
confirm_alpha = 1;
