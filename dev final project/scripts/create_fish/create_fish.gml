// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_fish(_x, _y, _rarity){
	
	fish =  instance_create_layer(_x, _y, "Instances", obj_fish); 
	
	fish.worth = fish.fish_worths[_rarity]; 
	fish.fish_name = fish.fish_names[_rarity]
	fish.sprite_index = fish.fish_sprites[_rarity]; 
	
	return fish; 
	
}