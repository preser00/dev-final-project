// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_fish(_x, _y, _rarity){
	
	fish =  instance_create_layer(_x, _y, "Instances", obj_fish); 
	fish.rarity = _rarity; 
	
	//fish_sprite, worth, fish_name, fish rarity
	
	return fish; 
	
}