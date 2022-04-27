confirm_key = keyboard_check_released(ord("Z"));

box_x = room_width/2; 
box_y = room_height-box_height; 

if !setup {
	draw_set_font(fnt_main); 
	draw_set_valign(fa_top); 
	draw_set_halign(fa_left); 
	
	//store text lengths
	for(var p = 0; p < page_count; p++){
		text_lengths[p] = string_length(text[p]);
		
		text_x_offset[p] = 100;
		
		//there was a lot more stuff here but i cut it out, it was just
		//related to animated text effects 
	}
	
	setup = true; 
}

/***typing the text***/
if char_index < text_lengths[page] {
	char_index += text_speed; 
	char_index = clamp(char_index, 0, text_lengths[page]); 
}

/***proceed through lines***/ 
if confirm_key {
	
	if char_index == text_lengths[page] {
		//go to next "page" of text if there is still text in the sequence
		if page < page_count-1 {
			page++; 
			char_index = 0;
		}
		//otherwise present options if they exist; if not, destroy textbox
		else { 
			
			if option_count > 0 {
				
				opt_results(option_link_id[option_pos]);
				//audio_play_sound(snd_option_select, 0, false);
				create_textbox(box_x, box_y, option_link_id[option_pos]); 
				
			}
			
			instance_destroy();
			
		}
	}
	
	//else if not done typing out the line
	else {
		char_index = text_lengths[page]; 
	}
	
}

/***drawing the textbox***/ 
var _textbox_x = box_x + text_x_offset[page]; 
var _textbox_y = box_y; 

box_frame_index += box_frame_rate; 
box_sprite_w = sprite_get_width(box_sprite); 
box_sprite_h = sprite_get_height(box_sprite); 

//will draw the sprite stretched out to the specified dimensions
draw_sprite_ext(
	box_sprite, 
	box_frame_index, 
	_textbox_x,
	_textbox_y, 
	box_width/box_sprite_w, box_height/box_sprite_h,
	0, c_white, 1
);

/***options code would go here but we're not using it for now 
so i won't be adding it to save time***/

var text_to_draw = string_copy(text[page], 1, char_index); 

draw_text_ext(
	_textbox_x + buffer, 
	_textbox_y + buffer, 
	text_to_draw,
	line_height,
	line_width
);
