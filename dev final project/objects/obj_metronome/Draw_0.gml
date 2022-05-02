

if(bar)
{
  draw_set_color(c_green);
  draw_rectangle(0,0,room_width,room_height,false);
}
else if(beat)
{
  draw_set_color(c_red);
  draw_rectangle(0,0,room_width,room_height,false);
}

//draw_set_color(c_white);
//draw_text(8,8,string(time));
//draw_text(8,8,string(pos_mod_beat_max));



