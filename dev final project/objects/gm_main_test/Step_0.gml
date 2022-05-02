if instance_exists(obj_textbox){
	global.game_paused = true; 
}

if !global.game_paused {
	
switch global.state {
		
	case state.idle:
		
		player.sprite_index = spr_player_idle; 
		
		if keyboard_check_released(global.confirm_key) {
			global.state = state.waiting; 
			player.sprite_index = spr_player_throwing; 
		}
		
	break; 
	
	case state.waiting:
	
		change_sprite_to(spr_player_waiting); 
	
		if wait_timer == 0 {
			
			//wait_timer = random_range(5, 10)*room_speed; 
			wait_timer = 5; 
			
			show_debug_message(string(current_fish_rarity) + " " + string(wait_timer/room_speed)); 
			
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
				
				alert = instance_create_layer(player.x+player.sprite_width/2+sprite_get_width(spr_alert)/2+20, player.y-50, "Instances", obj_alert)
				
				global.state = state.fishing; 
				
			}
			
		}
		
	
	break; 
	
	case state.fishing: //this doesn't include the rhythm element 
		
		if fish_timer > 0 {
			
			fish_timer--; 
			
			if keyboard_check_released(global.confirm_key) {
				
				show_debug_message("pressed"); 
				
				player.sprite_index = spr_player_reeling; 
				
				//successfully get fish 
				catch_results = 1; 
				
				instance_destroy(alert); 
				global.state = state.results; 
				
			}
			
		}
		else {
			
			//fish gets away
			catch_results = 0; 
			
			instance_destroy(alert); 
			global.state = state.results; 
			
		}
	
	break; 
	
	case state.results:
		
		if catch_results = 1 {
			
			change_sprite_to(spr_player_success);
			
		}
		else if catch_results = 0 {
			
			change_sprite_to(spr_player_fail); 
			
		}
		
	break;
	
}
	
}
