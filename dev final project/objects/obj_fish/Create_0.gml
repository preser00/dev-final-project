fish_worths = [40, 60, 100]; 
fish_sprites = [spr_fish1, spr_fish2, spr_fish3]; 
fish_names = ["Fish1", "Fish2", "Fish3"]; 

rarity = 0; 
worth = fish_worths[rarity]; 
fish_name = fish_names[rarity]
sprite_index = fish_sprites[rarity]; 

exhibit_y = room_height*(2/7)-50; 
reached_exhibit = false; 

textbox = instance_create_layer(global.box_x, global.box_y, "Text", obj_textbox);
textbox.text[0] = "I caught a " + fish_name + "."; 
textbox.page_count++; 

//create_textbox("test"); 
