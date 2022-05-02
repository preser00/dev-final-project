// All of the game's actual script goes here.
// (Dialogue system made by Peyton Burnham)
function scr_game_script(_text_id){

switch _text_id {
	
	default:
	break;
	
	case "game start":
	scr_text("I should start fishing soon... \n(Press Z)");
	scr_text("Today's quota is any number of fish worth 500 coins total."); 
	break; 
	
	case "success": 
	scr_text("I caught the fish"); //change this later 
	break; 
	
	case "fail": 
	scr_text("The fish got away..."); 
	scr_text("I'll get the next one."); 
	break; 
	
}

}

//@param string text_id, obj fish_id
//function scr_game_script(_text_id, _fish_id) {

//switch _text_id {
//	default:
//	break; 
	
//	case "success":
//	break; 

//}	

//}
