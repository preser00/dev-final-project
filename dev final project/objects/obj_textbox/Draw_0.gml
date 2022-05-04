confirm_key = keyboard_check_released(global.confirm_key); 

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
				create_textbox(option_link_id[option_pos]); 
				
			}
			
			global.game_paused = false; 
			
			if global.money > global.win_amount {		
				audio_play_sound(snd_small_splash, 0, false); 
				room_goto(room_end); 
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
var _textbox_x = global.box_x + text_x_offset[page]; 
var _textbox_y = global.box_y; 

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

/***option selecting***/
//******options to select if any******//
if char_index == text_lengths[page] && page == page_count - 1 {
	
	//option selection
	option_pos += keyboard_check_pressed(vk_down) - keyboard_check_pressed(vk_up);
	option_pos = clamp(option_pos, 0, option_count-1);
	
	//for drawing options
	var _op_space = 30;
	var _op_border = 6;
	for(var op = 0; op < option_count; op++) {
		//the option box
		var _op_width = string_width(option[op]) + _op_border*2;
		
		draw_sprite_ext(
			box_sprite, box_frame_index, 
			_textbox_x + 16, _textbox_y - _op_space*option_count + _op_space*op, //draws options starting from top 
			_op_width/box_sprite_w, (_op_space - 2)/box_sprite_h,
			0, c_white, 1);
		
		//the option arrow
		//if loop we're on is same as option position, then we can draw arrow
		if option_pos == op {
			draw_sprite(spr_option_selected, 0, _textbox_x, _textbox_y - _op_space*option_count + _op_space*op); 
		}
		
		//the option text
		draw_text(
			_textbox_x + 16 + _op_border, 
			_textbox_y - _op_space*option_count + _op_space*op + 2,
			option[op]); 
	}
	
	
	
}

/***drawing the text***/
var text_to_draw = string_copy(text[page], 1, char_index); 

draw_text_ext(
	_textbox_x + buffer, 
	_textbox_y + buffer, 
	text_to_draw,
	line_height,
	line_width
);
