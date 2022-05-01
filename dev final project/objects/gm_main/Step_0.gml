if instance_exists(obj_textbox){
	global.game_paused = true; 
}

if !global.game_paused {
	
switch global.state {
		
	case state.idle:
		
		player.sprite_index = spr_player_idle; 
		
		if keyboard_check_released(global.confirm_key) {
			global.state = state.waiting; 
		}
		
	break; 
	
	case state.waiting:
	
		if fish_timer == 0 {
			
			fish_timer = random_range(5, 10)*room_speed; 
			
			show_debug_message(string(current_fish_rarity) + " " + string(fish_timer)); 
			player.sprite_index = spr_player_waiting; 
			
		}
		else {
			
			timer++; 
			
			if timer > fish_timer {
				
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
				
				//probably play a sound 
				global.current_state = state.fishing; 
				
			}
			
		}
		
	
	break; 
	
	case state.fishing:
	
	break; 
		
}
	
}
