if (global.starting_tile_mode == "rec")
	global.starting_tile_mode = 1;
if (global.starting_tile_mode == "fav")
	global.starting_tile_mode = 0;
done = 0;
obj_menu_revamped.menu_options = 8;
obj_menu_revamped.menu_label = ["Editor Zoom", "Screen FX", "Toolbar", "Tutorial", "Cheats Menu", "Controls", "Audio Menu", "Save & Quit"];
obj_menu_revamped.menu_description = ["Default zoom of the editor.\n\nCurrent setting: x", "Turn screen effects ON or OFF.\n\nCurrent setting: ", "Default mode for the editor toolbar.\n\nCurrent setting: ", "Replay the tutorial level.", "Enable or disable various cheats.", "Change the game's keyboard or gamepad controls.", "Adjust music and sound effect volume.", "Save these settings and go back to the title."];
obj_menu_revamped.menu_description_locked = ["Default zoom of the editor.", "Turn screen effects ON or OFF.", "Default mode for the editor toolbar.", "Locked. To unlock: Complete the tutorial.", "Locked. To unlock: Complete the tutorial.", "Change the game's keyboard or gamepad controls.", "Adjust music and sound effect volume.", "Save these settings and go back to the title."];
obj_menu_revamped.menu_function = ["variable", "toggle", "toggle", "roomrequirement", "redirectrequirement", "redirect", "redirect", "room"];
obj_menu_revamped.menu_variable = ["zoom", "screen_fx", "starting_tile_mode", rm_tutorial, obj_runmenu_cheats, obj_runmenu_controls, obj_runmenu_audio, rm_demo];
obj_menu_revamped.menu_var_max = [4, 0, 0, 0, 0, 0, 0, 0];
obj_menu_revamped.menu_var_min = [1, 0, 0, 0, 0, 0, 0, 0];
obj_menu_revamped.menu_var_inc = [1, 0, 0, 0, 0, 0, 0, 0];
obj_menu_revamped.menu_var_req = [0, 0, 0, "tutorial_complete", "tutorial_complete", 0, 0, 0];
obj_menu_revamped.menu_toggle_true = ["N/A", "ON", "Recents", "N/A", "N/A", "N/A", "N/A", "N/A"];
obj_menu_revamped.menu_toggle_false = ["N/A", "OFF", "Favourites", "N/A", "N/A", "N/A", "N/A", "N/A"];
obj_menu_revamped.last_room = rm_demo;
obj_menu_revamped.last_menu = -1;
