
time = get_timer();
position = audio_sound_get_track_position(music)*1000;

pos_mod_beat = position mod mspb;
pos_mod_bar = position mod mspbar;
show_debug_message(intervaltime)
if(pos_mod_bar < pos_mod_bar_prev) {
  bar = true;
  alarm[0] = 4;
  intervaltime = 0
  pos_mod_beat_max = pos_mod_beat;
} 

if(pos_mod_beat < pos_mod_beat_prev) {
  beat = true;
  interval = false
  intervaltime = 0
  alarm[0] = 4;
  pos_mod_beat_max = pos_mod_beat;
} else {
	interval = true
	intervaltime += 1/room_speed
}

pos_mod_beat_prev = pos_mod_beat;
pos_mod_bar_prev = pos_mod_bar;


