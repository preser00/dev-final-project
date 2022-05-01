// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_fish(_x, _y, _rarity){
	
	with instance_create_layer(_x, _y, "Instances", obj_fish) {
		
		rarity = _rarity; 
		
		if rarity == 1 { //common
			//change sprite
			fish_sprite = spr_fish1; 
			worth = 20; 
		}
		else if rarity == 2 { //uncommon
			//change sprite
			worth = 50; 
		}
		else if rarity == 3 { //rare
			//change sprite
			worth = 100; 
		}
		
	}
	

	
}