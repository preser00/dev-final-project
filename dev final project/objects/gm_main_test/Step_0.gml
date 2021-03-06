if instance_exists(obj_textbox){
	global.game_paused = true; 
}

if !global.game_paused {
	
switch global.state {
		
	case state.idle:
		
		player.sprite_index = spr_player_idle; 
		
		if keyboard_check_pressed(global.confirm_key) {
			global.state = state.waiting; 
			player.sprite_index = spr_player_throwing; 
		}
		
	break; 
	
	case state.waiting:
		firsttime = true
		change_player_sprite(spr_player_waiting); 
	
		if wait_timer == 0 {
			
			//wait_timer = random_range(5, 10)*room_speed; 
			wait_timer = room_speed; //for faster testing
			
			//show_debug_message(string(current_fish_rarity) + " " + string(wait_timer/room_speed)); 
			
		}
		else {
			
			timer++; 
			
			if timer > wait_timer {
				
				//generate a fish w/ weighted percentages
				var i = irandom_range(1, 100); 
			
				if i < 50 {
					current_fish_rarity = 1; 
				}
				else if 50 < i < 90 {
					current_fish_rarity = 2; 
				}
				else {
					current_fish_rarity = 3; 
				}
				
				fish_timer = (.5 + 1/current_fish_rarity)*room_speed;
				
				//use visual/audio to alert player
				alert = instance_create_layer(player.x+player.sprite_width/2+sprite_get_width(spr_alert)/2+20, player.y-50, "Instances", obj_alert)
				
				timer = 0; 
				wait_timer = 0; 
				global.state = state.fishing; 
				
			}
			
		}
		
	
	break; 
	
	case state.fishing: //this doesn't include the rhythm element 
		
		//if fish_timer > 0 {
			
		//	fish_timer--; 
			
		//	if keyboard_check_released(global.confirm_key) {
				
		//		show_debug_message("pressed"); 
				
		//		instance_destroy(alert); 
		//		//catch_results = 1; 
				
		//		global.state = state.success; 
				
		//	}
			
		//}
		//else {
			
		//	//fish gets away
		//	instance_destroy(alert); 
		//	//catch_results = 0; 
		//	global.state = state.fail; 
			
		//}
	//firsttime entering this state
	if(turn == 0){
	if(firsttime){
		music = audio_play_sound(track, 1, true);

	position = audio_sound_get_track_position(music);
	firsttime = false
	}
	} 
	if(turn > 0){
		audio_resume_sound(track)
	}

		//adding rhythm
		time = get_timer();
position = audio_sound_get_track_position(music)*1000;

pos_mod_beat = position mod mspb;
pos_mod_bar = position mod mspbar;


if(interval == true){
if(keyboard_check_pressed(vk_space)){
	
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
			fishtype = 3
			global.state = state.success;
		}
				if(evaluation <= 0.6 && evaluation >0.3){
			fishtype = 2
			global.state = state.success;
		}
				if(evaluation <= 0.3 && evaluation > 0 ){
			fishtype = 1
			global.state = state.success;
		}
	} 
	if(pressedtime > 1.47){
		fishtype = 3
		global.state = state.fail;
		
	}
	
	audio_pause_sound(track)
	turn += 1
	//show_debug_message("pressedtime:"+string(pressedtime - pressedtime_start)+ "evaluation:" + string(evaluation))
	//show_debug_message("pressedtime:"+string(pressedtime_start)+ "intervaltime:" + string(intervaltime))
}
show_debug_message(turn)
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
	
	break; 
	
	//case state.results:
		
	//	show_debug_message(catch_results); 
		
	//	if catch_results == 1 {
			
	//		//create obj here and change the create textbox used 
		
	//		create_textbox(player.textbox_x, player.textbox_y, "success"); 
	//		change_player_sprite(spr_player_success);	
			
			
	//	}
	//	else if catch_results == 0 {
			
	//		create_textbox(player.textbox_x, player.textbox_y, "fail"); 
	//		change_player_sprite(spr_player_fail); 
			
	//		global.state = state.idle; 
			
	//	}
		
	//break;
	
	case state.success:
	
		player.sprite_index = spr_player_success; 
		
		if !fish_displayed {
			fish = create_fish(player.x, player.y, current_fish_rarity); 
			fish_displayed = true; 
		}
		else {
			if fish.image_xscale > 0 {
			
				fish.image_xscale -= .1; 
				fish.image_yscale -= .1; 
			
			}
			else {
				
				//MONEY SFX HERE
				global.money += fish.worth; 
				instance_destroy(fish); 
				
				//reset fishing related variables
				fish_displayed = false; 
				
				global.state = state.idle; 
			}
		}
	
	break;
	
	case state.fail:
		
		player.sprite_index = spr_player_fail; 
		
		create_textbox("fail"); 
		
		global.state = state.idle; 
		
	break; 
	
}
	
}
