// All of the game's actual script goes here.
// (Dialogue system made by Peyton Burnham)
function scr_game_script(_text_id){

switch _text_id {
	
	default:
	break;
	
	case "game start":
	scr_text("I should start fishing soon... \n(SPACE is my most important key.)");
	scr_text("Today's quota is any number of fish worth 500 coins total."); 
	scr_text("As usual, when I hear the music, I need to pull..."); 
	scr_text("... If my pulling doesn't match up to the music's rhythm, then the fish will be swept away."); 
	break; 
	
	case "fail": 
	scr_text("The fish got away... I'll get the next one."); 
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
