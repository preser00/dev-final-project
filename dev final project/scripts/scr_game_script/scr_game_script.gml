// All of the game's actual script goes here.
// (Dialogue system made by Peyton Burnham)
function scr_game_script(_text_id){

switch _text_id {
	
	default:
	break;
	
	case "game start":
	scr_text("I should start fishing soon... \n(SPACE is the only tool I need.)");
	scr_text("Today I need any number of fish worth 500 coins altogether."); 
	scr_text("As usual, after I throw my line in, I need to pull when I hear the strange, calming music..."); 
	scr_text("... The more my pulling matches up to the calm music's rhythm, the more likely it is to reward me."); 
	break; 
	
	case "fail": 
	scr_text("The melody swept the fish away... I'll get the next one."); 
	break; 
	
	case "game end": 
	scr_text("Looks like I've gotten enough fish for today..."); 
	scr_text("Time for a nice break."); 
		//scr_option("Take a break.", "end - game end"); 
		//scr_option("Keep fishing.", "end - game continue"); 
	break; 
	
//		case "end - game end":
//		scr_text("I think I'll take a nice break."); 
//		break;
		
//		case "end - game continue":
//		scr_text("Why not."); 
//		break; 
}

}
