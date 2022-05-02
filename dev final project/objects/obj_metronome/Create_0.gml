/* 

  Beat test project
  by Mikael Norrgard of Gamephase 
  
  Licensed under CC0 license:
  https://creativecommons.org/publicdomain/zero/1.0/
  
*/


// Song info
track = mus_test_170_3;
bpm = 82;
beats_per_bar = 4;

// Internal variables
bps = bpm/60; // Beats per second
mspb = (1/bps)*1000; // Milliseconds per beat
mspbar = mspb * beats_per_bar; // Milliseconds per bar 4/4

beat = false;
bar = false;

pos_mod_beat = 0;
pos_mod_beat_prev = 0;
pos_mod_bar = 0;
pos_mod_bar_prev = 0;

pos_mod_beat_max = 0;

music = audio_play_sound(track, 1, true);

position = audio_sound_get_track_position(music);

time = get_timer();

interval = false
intervaltime = 0



/* */
/*  */
