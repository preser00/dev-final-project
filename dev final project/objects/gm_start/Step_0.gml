//timer prevents players from accidentally skipping screens
//in the case they click space too fast 
if timer > 0 { 
	timer--; 
}
else {
	if(keyboard_check_pressed(vk_space) 
	//&& alarm[0] <= 0
	){
		audio_play_sound(snd_small_splash, 0, false); 
	
		//alarm[0] = 1*room_speed; 
		room_goto(room_main); 
	
	}
}
