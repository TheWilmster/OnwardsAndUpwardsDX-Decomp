if (mode == 0)
{
	if (input_check_pressed("up") || input_check_pressed("stick_up"))
	{
		if (selection > 0)
			selection -= 1;
		audio_play_sound(sfx_jump, 0, 0);
	}
	if (input_check_pressed("down") || input_check_pressed("stick_down"))
	{
		if (selection < (array_length(files) + 2))
			selection += 1;
		audio_play_sound(sfx_jump, 0, 0);
	}
	if (input_check_pressed("jump") || input_check_pressed("jumpmenu"))
	{
		if (selection < array_length(files))
		{
			if (mode == 0)
			{
				if (os_type == os_windows)
					global.level = "C:/Users/" + global.user + "/OnU/Levels/" + files[selection];
				else
					global.level = global.user + "/OnU/Levels/" + files[selection];
				global.level_name = files[selection];
				instance_create_depth(0, 0, depth, obj_levelmenu);
				instance_destroy();
			}
			else
			{
				global.level = steam_file_paths[selection];
				global.level_name = steam_files[selection];
				global.foreign_level = 1;
				instance_create_depth(0, 0, depth, obj_levelmenu);
				instance_destroy();
			}
		}
		else if (selection == array_length(files))
		{
			selection = 0;
			if (mode == 0)
				mode = 1;
			else
				mode = 0;
		}
		else if (selection == (array_length(files) + 1))
		{
			global.level = "";
			instance_destroy(obj_fade);
			instance_create_depth(0, 0, -1, obj_fade);
			audio_stop_sound(bgm_intro);
			alarm[1] = 30;
		}
		else
		{
			instance_activate_object(obj_menu_revamped);
			instance_create_depth(0, 0, depth, obj_title_menu_gameplay);
			instance_destroy();
		}
	}
}
else
{
	if (input_check_pressed("up") || input_check_pressed("stick_up"))
	{
		if (selection > 0)
			selection -= 1;
		audio_play_sound(sfx_jump, 0, 0);
	}
	if (input_check_pressed("down") || input_check_pressed("stick_down"))
	{
		if (selection < (array_length(steam_files) + 2))
			selection += 1;
		audio_play_sound(sfx_jump, 0, 0);
	}
	if (input_check_pressed("jump") || input_check_pressed("jumpmenu"))
	{
		if (selection < array_length(steam_files))
		{
			if (mode == 0)
			{
				if (os_type == os_windows)
					global.level = "C:/Users/" + global.user + "/OnU/Levels/" + files[selection];
				else
					global.level = global.user + "/OnU/Levels/" + files[selection];
				global.level_name = files[selection];
				instance_create_depth(0, 0, depth, obj_levelmenu);
				instance_destroy();
			}
			else
			{
				global.level = steam_file_paths[selection];
				global.level_name = steam_files[selection];
				global.foreign_level = 1;
				instance_create_depth(0, 0, depth, obj_levelmenu);
				instance_destroy();
			}
		}
		else if (selection == array_length(steam_files))
		{
			selection = 0;
			if (mode == 0)
				mode = 1;
			else
				mode = 0;
		}
		else if (selection == (array_length(steam_files) + 1))
		{
			global.level = "";
			instance_destroy(obj_fade);
			instance_create_depth(0, 0, -1, obj_fade);
			audio_stop_sound(bgm_intro);
			alarm[1] = 30;
		}
		else
		{
			instance_activate_object(obj_menu_revamped);
			instance_create_depth(0, 0, depth, obj_title_menu_gameplay);
			instance_destroy();
		}
	}
}
if (input_check_pressed("cancel"))
{
	instance_activate_object(obj_menu_revamped);
	instance_create_depth(0, 0, depth, obj_title_menu_gameplay);
	instance_destroy();
}
