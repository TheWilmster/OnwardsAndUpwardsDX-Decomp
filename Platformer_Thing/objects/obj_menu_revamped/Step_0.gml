if ((x == 0 && transition_mode == -1) || (x == 90 && transition_mode == 1))
{
	hspeed = 0;
	transition_mode = 0;
}
if (input_check_pressed("up") || input_check_pressed("stick_up"))
{
	if (exiting == 0)
	{
		if (selection > 0)
			selection -= 1;
		audio_play_sound(sfx_jump, 0, 0);
	}
}
if (input_check_pressed("down") || input_check_pressed("stick_down"))
{
	if (exiting == 0)
	{
		if (selection < (menu_options - 1))
			selection += 1;
		audio_play_sound(sfx_jump, 0, 0);
	}
}
if (input_check_pressed("left") || input_check_pressed("stick_left"))
{
	if (exiting == 0)
	{
		for (var i = 0; i < menu_options; i++)
		{
			if (selection == i)
			{
				if (menu_function[i] == "variable" || menu_function[i] == "variablenoshow" || menu_function[i] == "variableredirect")
				{
					if (variable_global_get(menu_variable[i]) > menu_var_min[i])
					{
						variable_global_set(menu_variable[i], variable_global_get(menu_variable[i]) - menu_var_inc[i]);
						audio_play_sound(sfx_jump, 0, 0);
					}
				}
			}
		}
	}
}
if (input_check_pressed("right") || input_check_pressed("stick_right"))
{
	if (exiting == 0)
	{
		for (var i = 0; i < menu_options; i++)
		{
			if (selection == i)
			{
				if (menu_function[i] == "variable" || menu_function[i] == "variablenoshow" || menu_function[i] == "variableredirect")
				{
					if (variable_global_get(menu_variable[i]) < menu_var_max[i])
					{
						variable_global_set(menu_variable[i], variable_global_get(menu_variable[i]) + menu_var_inc[i]);
						audio_play_sound(sfx_jump, 0, 0);
					}
				}
			}
		}
	}
}
if (input_check_pressed("jump") || input_check_pressed("jumpmenu"))
{
	if (exiting == 0 && transition_mode == 0)
	{
		for (var i = 0; i < menu_options; i++)
		{
			if (selection == i)
			{
				if (menu_function[i] == "toggle")
				{
					if (variable_global_get(menu_variable[i]) == 0)
						variable_global_set(menu_variable[i], 1);
					else
						variable_global_set(menu_variable[i], 0);
					audio_play_sound(sfx_coin, 0, 0);
				}
				else if (menu_function[i] == "togglerequirement")
				{
					if (variable_global_get(menu_var_req[i]) == 1)
					{
						if (variable_global_get(menu_variable[i]) == 0)
							variable_global_set(menu_variable[i], 1);
						else
							variable_global_set(menu_variable[i], 0);
						audio_play_sound(sfx_coin, 0, 0);
					}
					else
					{
						if (menu_function[i] == "togglerequirement" && variable_global_get(menu_var_req[i]) != 1)
							show_debug_message("requirements NOT met");
						audio_play_sound(sfx_error, 0, 0);
					}
				}
				else if (menu_function[i] == "redirect")
				{
					pass_argument = selection;
					exiting = 1;
					object_to_create = menu_variable[i];
					hspeed = 3;
					alarm[1] = 30;
					audio_play_sound(sfx_coin, 0, 0);
				}
				else if (menu_function[i] == "redirectrequirement")
				{
					if (variable_global_get(menu_var_req[i]) == 1)
					{
						pass_argument = selection;
						exiting = 1;
						object_to_create = menu_variable[i];
						hspeed = 3;
						alarm[1] = 30;
						audio_play_sound(sfx_coin, 0, 0);
					}
					else
					{
						audio_play_sound(sfx_error, 0, 0);
					}
				}
				else if (menu_function[i] == "room")
				{
					exiting = 1;
					object_to_create = menu_variable[i];
					hspeed = 3;
					alarm[0] = 30;
					instance_destroy(obj_fade);
					instance_create_depth(0, 0, -1, obj_fade);
					audio_play_sound(sfx_coin, 0, 0);
				}
				else if (menu_function[i] == "roomrequirement")
				{
					if (variable_global_get(menu_var_req[i]) == 1)
					{
						exiting = 1;
						object_to_create = menu_variable[i];
						hspeed = 3;
						alarm[0] = 30;
						instance_destroy(obj_fade);
						instance_create_depth(0, 0, -1, obj_fade);
						audio_play_sound(sfx_coin, 0, 0);
					}
					else
					{
						audio_play_sound(sfx_error, 0, 0);
					}
				}
				else if (menu_function[i] == "quit")
				{
					exiting = 1;
					object_to_create = menu_variable[i];
					hspeed = 3;
					alarm[2] = 30;
					instance_destroy(obj_fade);
					instance_create_depth(0, 0, -1, obj_fade);
					audio_play_sound(sfx_coin, 0, 0);
				}
				else if (menu_function[i] == "opensteamurl")
				{
					steam_activate_overlay_browser(menu_variable[i]);
				}
				else if (menu_function[i] == "redirectother")
				{
					exiting = 1;
					hspeed = 3;
					alarm[3] = 30;
					audio_play_sound(sfx_coin, 0, 0);
				}
				else if (menu_function[i] == "variableredirect")
				{
					exiting = 1;
					hspeed = 3;
					alarm[3] = 30;
					audio_play_sound(sfx_coin, 0, 0);
				}
				else if (menu_function[i] == "start")
				{
					global.coins = 0;
					global.time_milliseconds = 0;
					global.time_seconds = 0;
					global.time_minutes = 0;
					object_to_create = menu_variable[i];
					exiting = 1;
					alarm[0] = 30;
					hspeed = 3;
					instance_destroy(obj_fade);
					instance_create_depth(0, 0, -1, obj_fade);
					audio_play_sound(sfx_coin, 0, 0);
				}
			}
		}
	}
}
global.selectionmenu = selection;
if (input_check_pressed("cancel"))
{
	cancel = 1;
	if (last_menu != -1)
	{
		show_debug_message(last_menu);
		exiting = 1;
		object_to_create = last_menu;
		alarm[1] = 30;
		hspeed = 3;
	}
	else if (last_room != -1)
	{
		show_debug_message(last_room);
		exiting = 1;
		object_to_create = last_room;
		alarm[0] = 30;
		instance_destroy(obj_fade);
		instance_create_depth(0, 0, -1, obj_fade);
		hspeed = 3;
	}
}
depth = -1;
