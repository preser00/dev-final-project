/// @description Insert description here
// You can write your code in this editor

draw_sprite(cg_start, 0, room_width/2, room_height/2-18); 

draw_set_font(fnt_title)
draw_set_halign(fa_center)
draw_set_valign(fa_center)
draw_text(room_width/2, room_height/5, "Wayfisher")

draw_set_font(fnt_main)
draw_text(room_width/2, room_height-room_height/5, "[ Press Space to Start ]")


