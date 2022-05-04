// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function opt_results(_option_id){
	
	switch _option_id {
		
		default:
		break; 
		
		case "example - no":
		show_debug_message("you refused"); 
		break; 
		
		case "end - game end":
		room_goto(room_end); 
		break;
		
		case "end - game continue": 
		global.times_continued_fishing++; 
		break; 
		
	}
	
}