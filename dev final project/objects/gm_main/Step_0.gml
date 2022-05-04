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
				
				instance_destroy(alert); 
				//catch_results = 1; 
				
				global.state = state.success; 
				
			}
			
		}
		else {
			
			//fish gets away
			instance_destroy(alert); 
			//catch_results = 0; 
			global.state = state.fail; 
			
		}
	
	break; 
	
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
