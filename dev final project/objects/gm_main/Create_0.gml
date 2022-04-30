player = instance_create_layer(room_width/2, room_height*(2/3), "Instances", obj_player); 
boat = instance_create_layer(player.x, player.y + player.sprite_height/2, "Instances", obj_boat); 

global.money = 0; 
global.game_paused = false; 

enum state {
	idle, 
	waiting,
	fishing,
	results
}


