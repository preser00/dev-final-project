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
	
		change_player_sprite(spr_player_waiting); 
	
		if wait_timer == 0 {
			
			//wait_timer = random_range(5, 10)*room_speed; 
			wait_timer = room_speed; //for faster testing
			
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
				
				//use visual/audio to alert player
				alert = instance_create_layer(player.x+player.sprite_width/2+sprite_get_width(spr_alert)/2+20, player.y-50, "Instances", obj_alert)
				
				timer = 0; 
				wait_timer = 0; 
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
				
			}
			
		}
		else {
			
			//fish gets away
			catch_results = 0; 
			
			instance_destroy(alert); 
			
		}
	
	break; 
	
	//case state.results:
		
	//	show_debug_message(catch_results); 
		
	//	if catch_results == 1 {
			
	//		//create obj here and change the create textbox used 
			
	//		create_textbox(player.textbox_x, player.textbox_y, "success"); 
	//		change_player_sprite(spr_player_success);
			
	//		//global.state = state.idle; 
			
	//	}
	//	else if catch_results == 0 {
			
	//		create_textbox(player.textbox_x, player.textbox_y, "fail"); 
	//		change_player_sprite(spr_player_fail); 
			
	//		global.state = state.idle; 
			
	//	}
		
	//break;
	
}
	
}
