// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function change_player_sprite(_sprite){
	if player.sprite_index != _sprite && player.image_index >= player.image_number-1 {
		player.sprite_index = _sprite; 
		
	}
	

}