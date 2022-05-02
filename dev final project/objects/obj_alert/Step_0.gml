image_xscale = size_mod; 
image_yscale = size_mod; 

if scaling_down {
	size_mod -= .01; 
	
	if size_mod < .7 {
		scaling_down = false; 
	}
	
}
else {
	size_mod += .01; 
	
	if size_mod > 1 {
		scaling_down = true; 
	}
}

