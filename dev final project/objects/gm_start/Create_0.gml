if audio_is_playing(bgm_end) {
	audio_stop_sound(bgm_end); 
}

timer = room_speed; 

audio_play_sound(bgm_main,10, true)
audio_sound_gain(bgm_main, .4, 1000); 
