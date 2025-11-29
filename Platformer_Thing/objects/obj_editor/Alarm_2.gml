waiting = 0;
if (show_colour_picker == 0)
{
	switch (show_menu)
	{
		case 1:
			switch (global.selectionmenu)
			{
				case 0:
					keyboard_string = "";
					instance_destroy(obj_menu_revamped);
					inst = instance_create_depth(0, 0, depth - 1, obj_namer);
					inst.mode = 0;
					waiting = 1;
					alarm[2] = 5;
					break;
				case 1:
					keyboard_string = "";
					instance_destroy(obj_menu_revamped);
					inst = instance_create_depth(0, 0, depth - 1, obj_namer);
					inst.mode = 1;
					waiting = 1;
					alarm[2] = 5;
					break;
				case 2:
					cx = 80;
					cy = 72;
					show_colour_picker = 1;
					instance_destroy(obj_menu_revamped);
					break;
				case 4:
					keyboard_string = global.description;
					instance_destroy(obj_menu_revamped);
					inst = instance_create_depth(0, 0, depth - 1, obj_namer);
					inst.mode = 3;
					waiting = 1;
					alarm[2] = 5;
					break;
				case 5:
					next_menu = 2;
					break;
				case 6:
					if (instance_exists(obj_player_start) && instance_exists(obj_goalflag))
						next_menu = 3;
					else
						next_menu = 6;
					break;
				case 7:
					next_menu = 7;
					break;
				case 8:
					next_menu = 0;
					break;
			}
			break;
		case 2:
			switch (global.selectionmenu)
			{
				case 3:
					next_menu = 9;
					break;
				case 4:
					lives = global.lives;
					next_menu = 1;
					break;
			}
			break;
		case 3:
			switch (global.selectionmenu)
			{
				case 0:
					global.validating_now = 1;
					global.coins_to_collect = instance_number(obj_coin);
					accepting_input = 0;
					alarm[1] = 2;
					global.time_milliseconds = 0;
					global.time_minutes = 0;
					global.time_seconds = 0;
					global.check_x = obj_player_start.x;
					global.check_y = obj_player_start.y;
					instance_create_layer(obj_player_start.x, obj_player_start.y, "Player", obj_player);
					instance_create_layer(obj_player_start.x, obj_player_start.y, "Player", obj_camera);
					layer_set_visible(layer_get_id("Grid"), 0);
					instance_deactivate_object(obj_editor);
					instance_destroy(obj_menu_revamped);
					break;
				case 1:
					next_menu = 1;
					break;
			}
			break;
		case 4:
			switch (global.selectionmenu)
			{
				case 0:
					global.validating_now = 1;
					global.coins_to_collect = instance_number(obj_coin);
					accepting_input = 0;
					alarm[1] = 2;
					global.time_milliseconds = 0;
					global.time_minutes = 0;
					global.time_seconds = 0;
					global.check_x = obj_player_start.x;
					global.check_y = obj_player_start.y;
					instance_create_layer(obj_player_start.x, obj_player_start.y, "Player", obj_player);
					instance_create_layer(obj_player_start.x, obj_player_start.y, "Player", obj_camera);
					layer_set_visible(layer_get_id("Grid"), 0);
					instance_deactivate_object(obj_editor);
					instance_destroy(obj_menu_revamped);
					break;
				case 1:
					next_menu = 1;
					break;
			}
			break;
		case 5:
			next_menu = 1;
			break;
		case 6:
			next_menu = 1;
			break;
		case 7:
			if (global.selectionmenu < 7)
				next_menu = 8;
			else
				next_menu = 1;
			break;
		case 8:
			next_menu = 7;
			break;
		case 9:
			audio_play_sound(sfx_success, 0, 0);
			global.validated = 0;
			if (global.selectionmenu == 8)
				global.objective = 0;
			else
				global.objective = global.selectionmenu + 1;
			next_menu = 2;
			break;
	}
}
if (next_menu == 0)
{
	instance_destroy(obj_menu_revamped);
	show_menu = 0;
}
else if (next_menu == 1)
{
	if (!instance_exists(obj_menu_revamped))
	{
		inst = instance_create_depth(0, 0, 0, obj_menu_revamped);
		inst.starting_menu = -2;
	}
	obj_menu_revamped.menu_options = 9;
	obj_menu_revamped.menu_label = ["Save Level", "Load Level", "BG Colour", "Music", "Description", "Et Cetera", "Validate", "Help Topics", "Close"];
	obj_menu_revamped.menu_description = ["Saves this level to your computer's hard disk.", "Loads a level from your computer's hard disk.", "Change the background colour of the level.", "Change the music of the level.\nCurrent setting: ", "Describe your level in some detail.", "Adjust miscellaneous settings for your level.", "Validate your level so players know that it can be finished.", "Learn how to use the editor. It's recommended to read these.", "Return to the editor."];
	obj_menu_revamped.menu_description_locked = ["Saves this level to your computer's hard disk.", "Loads a level from your computer's hard disk.", "Change the background colour of the level.", "Change the music of the level.\nCurrent setting: ", "Describe your level in some detail.", "Adjust miscellaneous settings for your level.", "Validate your level so players know that it can be finished.", "Learn how to use the editor. It's recommended to read these.", "Return to the editor."];
	obj_menu_revamped.menu_function = ["redirectother", "redirectother", "redirectother", "variable", "redirectother", "redirectother", "redirectother", "redirectother", "redirectother"];
	obj_menu_revamped.menu_variable = [0, 0, 0, "music_track", 0, 0, 0, 0, 0];
	obj_menu_revamped.menu_var_max = [0, 0, 0, 7, 0, 0, 0, 0, 0];
	obj_menu_revamped.menu_var_min = [0, 0, 0, 0, 0, 0, 0, 0, 0];
	obj_menu_revamped.menu_var_inc = [0, 0, 0, 1, 0, 0, 0, 0, 0];
	obj_menu_revamped.menu_var_req = [0, 0, 0, 0, 0, 0, 0, 0, 0];
	obj_menu_revamped.menu_toggle_true = ["N/A", "N/A", "N/A", "ON", "ON", "ON", "N/A", "N/A", "N/A"];
	obj_menu_revamped.menu_toggle_false = ["N/A", "N/A", "N/A", "OFF", "OFF", "OFF", "N/A", "N/A", "N/A"];
	obj_menu_revamped.last_menu = -1;
	show_menu = 1;
}
else if (next_menu == 2)
{
	global.lives = lives;
	obj_menu_revamped.menu_options = 5;
	obj_menu_revamped.menu_label = ["Flag Keeper", "Low Gravity", "Lives", "Objectives", "Apply"];
	obj_menu_revamped.menu_description = ["When this is on, you won't lose any flags upon dying.\nCurrent setting: ", "When this is on, gravity will be weaker, like in 15,000m.\nCurrent setting: ", "Adjust the number of lives that Lily has to complete this level with.\nCurrent setting: ", "Set up a secondary objective that Lily must fulfill in order to complete the level.", "Save these changes and go back to the editor menu."];
	obj_menu_revamped.menu_description_locked = ["When this is on, you won't lose any flags upon dying.\nCurrent setting: ", "When this is on, gravity will be weaker, like in 15,000m.\nCurrent setting: ", "Adjust the number of lives that Lily has to complete this level with.\nCurrent setting: ", "Set up a secondary objective that Lily must fulfill in order to complete the level.", "Save these changes and go back to the editor menu."];
	obj_menu_revamped.menu_function = ["toggle", "toggle", "variablenoshow", "redirectother", "redirectother"];
	obj_menu_revamped.menu_variable = ["preserve_flags", "low_gravity", "lives", 0, 0, 0, 0, 0, 0];
	obj_menu_revamped.menu_var_max = [0, 0, 99, 0, 0];
	obj_menu_revamped.menu_var_min = [0, 0, 0, 0, 0];
	obj_menu_revamped.menu_var_inc = [0, 0, 1, 0, 0];
	obj_menu_revamped.menu_var_req = [0, 0, 0, 0, 0];
	obj_menu_revamped.menu_toggle_true = ["ON", "ON", "N/A", "ON", "ON", "ON", "N/A", "N/A", "N/A"];
	obj_menu_revamped.menu_toggle_false = ["OFF", "OFF", "N/A", "OFF", "OFF", "OFF", "N/A", "N/A", "N/A"];
	obj_menu_revamped.last_menu = -1;
	show_menu = 2;
}
else if (next_menu == 3)
{
	obj_menu_revamped.menu_options = 2;
	obj_menu_revamped.menu_label = ["Validate", "Go Back"];
	obj_menu_revamped.menu_description = ["", ""];
	obj_menu_revamped.menu_description_locked = ["", ""];
	obj_menu_revamped.menu_function = ["redirectother", "redirectother"];
	obj_menu_revamped.menu_variable = [0, 0];
	obj_menu_revamped.menu_var_max = [0, 0];
	obj_menu_revamped.menu_var_min = [0, 0];
	obj_menu_revamped.menu_var_inc = [0, 0];
	obj_menu_revamped.menu_var_req = [0, 0];
	obj_menu_revamped.menu_toggle_true = ["ON", "ON"];
	obj_menu_revamped.menu_toggle_false = ["OFF", "OFF"];
	obj_menu_revamped.last_menu = -1;
	show_menu = 3;
}
else if (next_menu == 4)
{
	obj_menu_revamped.menu_options = 2;
	obj_menu_revamped.menu_label = ["Retry", "Go Back"];
	obj_menu_revamped.menu_description = ["", ""];
	obj_menu_revamped.menu_description_locked = ["", ""];
	obj_menu_revamped.menu_function = ["redirectother", "redirectother"];
	obj_menu_revamped.menu_variable = [0, 0];
	obj_menu_revamped.menu_var_max = [0, 0];
	obj_menu_revamped.menu_var_min = [0, 0];
	obj_menu_revamped.menu_var_inc = [0, 0];
	obj_menu_revamped.menu_var_req = [0, 0];
	obj_menu_revamped.menu_toggle_true = ["ON", "ON"];
	obj_menu_revamped.menu_toggle_false = ["OFF", "OFF"];
	obj_menu_revamped.last_menu = -1;
	show_menu = 4;
}
else if (next_menu == 5 || next_menu == 6)
{
	obj_menu_revamped.menu_options = 1;
	obj_menu_revamped.menu_label = ["OK"];
	obj_menu_revamped.menu_description = [""];
	obj_menu_revamped.menu_description_locked = [""];
	obj_menu_revamped.menu_function = ["redirectother"];
	obj_menu_revamped.menu_variable = [0];
	obj_menu_revamped.menu_var_max = [0];
	obj_menu_revamped.menu_var_min = [0];
	obj_menu_revamped.menu_var_inc = [0];
	obj_menu_revamped.menu_var_req = [0];
	obj_menu_revamped.menu_toggle_true = ["ON"];
	obj_menu_revamped.menu_toggle_false = ["OFF"];
	obj_menu_revamped.last_menu = -1;
	show_menu = next_menu;
}
else if (next_menu == 7)
{
	instance_activate_object(obj_menu_revamped);
	obj_menu_revamped.menu_options = 8;
	obj_menu_revamped.menu_label = ["Basics", "Layers", "Tiles", "Entities", "Testing", "Validation", "Sharing", "Go Back"];
	obj_menu_revamped.menu_description = ["Covers the basics of the editor.", "Learn how the three layers work.", "Learn how to use tiles and the toolbar.", "Learn how to place and manipulate entities.", "Learn how testing works.", "Learn how level validation works.", "Learn how to share levels with others.", "Return to the editor menu."];
	obj_menu_revamped.menu_description_locked = ["Covers the basics of the editor.", "Learn how the three layers work.", "Learn how to use tiles and the toolbar.", "Learn how to place and manipulate entities.", "Learn how testing works.", "Learn how level validation works.", "Learn how to share levels with others.", "Return to the editor menu."];
	obj_menu_revamped.menu_function = ["redirectother", "redirectother", "redirectother", "redirectother", "redirectother", "redirectother", "redirectother", "redirectother"];
	obj_menu_revamped.menu_variable = [0, 0, 0, 0, 0, 0, 0, 0];
	obj_menu_revamped.menu_var_max = [0, 0, 0, 0, 0, 0, 0, 0];
	obj_menu_revamped.menu_var_min = [0, 0, 0, 0, 0, 0, 0, 0];
	obj_menu_revamped.menu_var_inc = [0, 0, 0, 0, 0, 0, 0, 0];
	obj_menu_revamped.menu_var_req = [0, 0, 0, 0, 0, 0, 0, 0];
	obj_menu_revamped.menu_toggle_true = ["N/A", "N/A", "N/A", "ON", "ON", "ON", "N/A", "N/A", "N/A"];
	obj_menu_revamped.menu_toggle_false = ["N/A", "N/A", "N/A", "OFF", "OFF", "OFF", "N/A", "N/A", "N/A"];
	obj_menu_revamped.last_menu = -1;
	obj_menu_revamped.exiting = 0;
	show_menu = 7;
}
else if (next_menu == 8)
{
	instance_deactivate_object(obj_menu_revamped);
	show_menu = 8;
}
else if (next_menu == 9)
{
	obj_menu_revamped.menu_options = 9;
	obj_menu_revamped.menu_label = ["Coins", "Checkpoints", "No jumping", "No landing", "No gliding", "No grapple", "Entities", "Time Limit", "Unset"];
	obj_menu_revamped.menu_description = ["", "", "", "", "", "", "", "", ""];
	obj_menu_revamped.menu_description_locked = ["", "", "", "", "", "", "", "", ""];
	obj_menu_revamped.menu_function = ["variableredirect", "variableredirect", "redirectother", "redirectother", "redirectother", "redirectother", "redirectother", "variableredirect", "redirectother"];
	obj_menu_revamped.menu_variable = ["objective_value", "objective_value", 0, 0, 0, 0, 0, "objective_value", 0];
	obj_menu_revamped.menu_var_max = [instance_number(obj_coin), instance_number(obj_save), 0, 0, 0, 0, 0, 300, 0];
	obj_menu_revamped.menu_var_min = [0, 0, 0, 0, 0, 0, 0, 0, 0];
	obj_menu_revamped.menu_var_inc = [1, 1, 0, 0, 0, 0, 0, 1, 0];
	obj_menu_revamped.menu_var_req = [0, 0, 0, 0, 0, 0, 0, 0, 0];
	obj_menu_revamped.menu_toggle_true = ["N/A", "N/A", "ON", "ON", "ON", "ON", "N/A", "N/A", "N/A"];
	obj_menu_revamped.menu_toggle_false = ["N/A", "N/A", "OFF", "OFF", "OFF", "OFF", "N/A", "N/A", "N/A"];
	obj_menu_revamped.last_menu = -1;
	show_menu = 9;
}
next_menu = -1;
