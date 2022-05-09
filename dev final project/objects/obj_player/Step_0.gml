/// @description Insert description here
// You can write your code in this editor
depth = 20
if bob_direction == 0 {
	y -= bob_speed; 
		
	if abs(target_upper - y) < bob_speed {
		bob_direction = 1; 
	}
}
else if bob_direction == 1 {
	y += bob_speed; 
		
	if abs(target_lower-y) < bob_speed {
		bob_direction = 0; 
	}
}
