if bob_direction == 0 {
	y -= bob_speed; 
		
	if abs(target_upper - y) < 1 {
		bob_direction = 1; 
	}
}
else if bob_direction == 1 {
	y += bob_speed; 
		
	if abs(target_lower-y) < 1 {
		bob_direction = 0; 
	}
}
