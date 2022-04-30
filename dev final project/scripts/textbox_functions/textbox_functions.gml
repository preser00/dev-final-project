/***scripting (scr_) functions are pretty much exclusively used in the game script***/

//use this function to script what text will be displayed by textbox objs 
//will be called by textbox objs
//@param string _text
function scr_text(_text){
	text[page_count] = _text; 
	page_count++; 
}

//use this function to script options into the game script 
//@param string _option, the text that the option is displayed as (ex: "yes" or "no")
//@param string _link_id, the id that will be used to retrieve option results 
function scr_option(_option, _link_id){
	option[option_count] = _option; 
	option_link_id[option_count] = _link_id; 
	
	option_count++; 
}

//@param string text_id, the id that will be used to retrieve text sequences
function create_textbox(_x, _y, _text_id) {
	
	if _text_id == "" {
		//nothing happens, no textbox is created
	}
	else {
		
		with instance_create_layer(0, 0, "text", obj_textbox) {
			scr_game_script(_text_id); 
			box_x = _x - 150 - 30; 
			box_y = _y - 60; 
		}
		
	}
	
}
