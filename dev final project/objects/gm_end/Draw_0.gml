/// @description Insert description here
// You can write your code in this editor
draw_sprite(cg_end, 0, room_width/2+20, room_height-sprite_get_height(cg_end)/2-50); 

draw_set_font(fnt_title)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text(room_width/2, room_height/10, "Fishing End")
draw_set_font(fnt_main)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text(room_width/2, room_height/10+50, "[ Press Space to Restart ]")
