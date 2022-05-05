// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_fish(_x, _y, _rarity){
	
	fish =  instance_create_layer(_x, _y, "Instances", obj_fish); 
	
	//fish.worth = fish.fish_worths[_rarity]; 
	
	//if _rarity == 0 {
	//	random_range();
	//}
	
	//fish.fish_name = fish.fish_names[_rarity]
	//fish.sprite_index = fish.fish_sprites[_rarity]; 
	
	fish.rarity = _rarity; 
	
	with fish {
		worth = fish_worths[rarity]; 
		
		var which_fish = 0; 
		
		if rarity == 0 {
			which_fish = irandom_range(0, array_length(common_sprites)-1); 
			
			fish_name = common_names[which_fish]; 
			sprite_index = common_sprites[which_fish]; 
		}
		else if rarity == 1 {
			which_fish = irandom_range(0, array_length(uncommon_sprites)-1); 
			
			fish_name = uncommon_names[which_fish]; 
			sprite_index = uncommon_sprites[which_fish]; 
		}
		else if rarity == 2 {
			which_fish = irandom_range(0, array_length(rare_sprites)-1); 
			
			fish_name = rare_names[which_fish]; 
			sprite_index = rare_sprites[which_fish]; 
		}
	}
	
	return fish; 
	
}