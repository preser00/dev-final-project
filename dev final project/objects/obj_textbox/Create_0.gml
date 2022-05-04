global.game_paused = true; 
depth = -9999; 

box_width = room_width-200; 
box_height = 100; 

global.box_x = 0; 
global.box_y = room_height-box_height; 

buffer = 10; 
line_width = box_width - buffer*2; 
line_height = 24; 

box_sprite = tile_ui; 
box_frame_index = 0; 
box_frame_rate = 6/room_speed; 

//the text
page = 0; 
page_count = 0;

text[0] = ""; 
text_lengths[0] = string_length(text[0]); 

char_index = 0; 
text_speed = 1; 

//option related stuff, i don't actually know if it's necessary for this proj 
//but it's included anyways 
option[0] = ""; 
option_link_id[0] = -1; 
option_pos = 0; 
option_count = 0; 

setup = false; 
