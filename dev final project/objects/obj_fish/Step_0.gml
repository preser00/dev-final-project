if !reached_exhibit {
	y = lerp(y, exhibit_y, .15); 
	
	if abs(exhibit_y - y) < 1 {
		reached_exhibit = true; 
	}
}
else {
	//event_inherited(); 
}
