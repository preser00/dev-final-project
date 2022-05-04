/// @description Insert description here
// You can write your code in this editor

time = get_timer();
position = audio_sound_get_track_position(music)*1000;

pos_mod_beat = position mod mspb;
pos_mod_bar = position mod mspbar;
evaluation = (pressedtime - pressedtime_start)/1.47


if(keyboard_check_pressed(vk_space)){
	if(interval == true){
	pressedtime = intervaltime
	pressedtime_start = intervaltime
	startcounting = true
	}
}
if(keyboard_check_released(vk_space)){
	startcounting = false
	evaluation = (pressedtime - pressedtime_start)/1.47
	if(pressedtime <= 1.47){
		if(evaluation < 1 && evaluation >0.6){
			fishtype = 1
		}
				if(evaluation <= 0.6 && evaluation >0.3){
			fishtype = 2
		}
				if(evaluation <= 0.3 && evaluation > 0 ){
			fishtype = 3
		}
	} 
	if(pressedtime > 1.47){
		fishtype = 3
	}
	show_debug_message(fishtype)
	//show_debug_message("pressedtime:"+string(pressedtime - pressedtime_start)+ "evaluation:" + string(evaluation))
	//show_debug_message("pressedtime:"+string(pressedtime_start)+ "intervaltime:" + string(intervaltime))
}

if(startcounting == true){
	pressedtime += 1/room_speed
} else {
	pressedtime = pressedtime
}



if(pos_mod_bar < pos_mod_bar_prev) {
  bar = true;
  alarm[0] = 4;
  intervaltime = 0
  //intervalnumber += 1
  pos_mod_beat_max = pos_mod_beat;
} 

if(pos_mod_beat < pos_mod_beat_prev) {
  beat = true;
  interval = false
  intervaltime = 0
  //intervalnumber += 1
  alarm[0] = 4;
  pos_mod_beat_max = pos_mod_beat;
} else {
	interval = true
	intervaltime += 1/room_speed
}

//previous_intervalnumber = intervalnumber
pos_mod_beat_prev = pos_mod_beat;
pos_mod_bar_prev = pos_mod_bar;
