// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bob(_current_obj_y){
	
	center_y = _current_obj_y; 
	
	bob_amount = 15; 
	bob_direction = 0; //0 = up, 1 = down 
	
	target_upper = center_y - bob_amount; 
	target_lower = center_y + bob_amount; 
	
	if bob_direction == 0 {
		y = lerp(y, target_upper, .15); 
		
		if abs(center_y - target_upper) < 1 {
			bob_direction = 1; 
		}
	}
	else if bob_direction == 1 {
		y = lerp(y, target_lower, .15); 
		
		if abs(center_y - target_lower) < 1 {
			bob_direction = 0; 
		}
	}
	
}