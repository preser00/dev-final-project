player = instance_create_layer(room_width/2, room_height*(2/3), "Instances", obj_player); 
boat = instance_create_layer(player.x, player.y + player.sprite_height/2, "Instances", obj_boat); 

global.money = 0; 
global.game_paused = false; 
global.confirm_key = ord("Z"); //this can be changed later 

enum state {
	idle, 
	waiting,
	fishing,
	success,
	fail
}

global.state = state.idle; 

timer = 0; 
current_fish_rarity = 0; 
wait_timer = 0; 
//catch_results = 2; //0 = fail, 1 = success, 2 = currently not applicable 

fish_timer = 0; 
