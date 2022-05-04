player = instance_create_layer(room_width/2, room_height*(4/7), "Instances", obj_player); 
boat = instance_create_layer(player.x, player.y + player.sprite_height/2, "Instances", obj_boat); 

//textbox_x = room_width/2-100;
//textbox_y = player.y+player.sprite_height/2+100;

create_textbox("game start");

global.money = 0; 
global.game_paused = false; 
global.confirm_key = ord("Z"); //this can be changed later 

//enum state {
//	idle, 
//	waiting,
//	fishing,
//	success,
//	fail
//}

global.state = state.idle; 

timer = 0; 
current_fish_rarity = 0; 
wait_timer = 0; 
//catch_results = 2; //0 = fail, 1 = success, 2 = currently not applicable 

fish_timer = 0; 
fish_displayed = false; 

//rhythm part
// Song info
track = mus_test_170_3;
bpm = 41;
beats_per_bar = 4;

// Internal variables
bps = bpm/60; // Beats per second
mspb = (1/bps)*1000; // Milliseconds per beat
mspbar = mspb * beats_per_bar; // Milliseconds per bar 4/4

beat = false;
bar = false;

pos_mod_beat = 0;
pos_mod_beat_prev = 0;
pos_mod_bar = 0;
pos_mod_bar_prev = 0;

pos_mod_beat_max = 0;

//music = audio_play_sound(track, 1, true);

//position = audio_sound_get_track_position(music);

time = get_timer();

interval = false
intervaltime = 0
pressedtime_start = 0
pressedtime = 0; 
//intervalnumber = 0; 
//previous_intervalnumber = 0;
evaluation = 0;
fishtype = 0 ; 
startcounting = false; 
firsttime = true
turn = 0
