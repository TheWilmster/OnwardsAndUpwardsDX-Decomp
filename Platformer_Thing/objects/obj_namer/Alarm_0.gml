instance_activate_object(obj_editor);
using_on_screen_keyboard = 0;
instance_destroy(obj_keyboard);
if (mode == 0)
{
	global.level_name = string_copy(str, 1, 20);
	path = str;
	if (path != "")
	{
		if (os_type == os_windows)
			path = "C:/Users/" + global.user + "/OnU/Levels/" + path + ".onul";
		else
			path = global.user + "/OnU/Levels/" + path + ".onul";
		success = save_level(path);
		if (success == 1)
		{
			audio_play_sound(sfx_success, 0, 0);
			obj_editor.show_menu = 0;
			instance_destroy();
		}
	}
}
else if (mode == 1)
{
	global.level_name = string_copy(str, 1, 20);
	path = str;
	if (path != "")
	{
		if (os_type == os_windows)
			path = "C:/Users/" + global.user + "/OnU/Levels/" + path + ".onul";
		else
			path = global.user + "/OnU/Levels/" + path + ".onul";
		if (file_exists(path))
		{
			success = load_level(path);
			if (success == 1)
			{
				obj_editor.show_menu = 0;
				audio_stop_all();
				audio_play_sound(sfx_success, 0, 0);
				if (instance_exists(obj_player_start))
				{
					obj_editor.x = obj_player_start.x;
					obj_editor.y = obj_player_start.y;
				}
				layer_background_blend(layer_background_get_id(layer_get_id("Background")), make_colour_rgb(obj_editor.bg_red, obj_editor.bg_green, obj_editor.bg_blue));
				global.music_track = obj_editor.music_track;
				switch (obj_editor.music_track)
				{
					case 1:
						audio_play_sound(bgm_intro, 0, 1);
						break;
					case 2:
						audio_play_sound(bgm_level1, 0, 1);
						break;
					case 3:
						audio_play_sound(bgm_level2, 0, 1);
						break;
					case 4:
						audio_play_sound(bgm_level3, 0, 1);
						break;
					case 5:
						audio_play_sound(bgm_level4, 0, 1);
						break;
					case 6:
						audio_play_sound(bgm_ending, 0, 1);
						break;
					case 7:
						audio_play_sound(bgm_runsettings, 0, 1);
						break;
				}
				instance_destroy();
			}
		}
		else
		{
			instance_destroy();
		}
	}
}
else if (mode == 2)
{
	global.level_name = filename_name(global.level);
	path = global.level;
	if (path != "")
	{
		if (file_exists(path))
		{
			success = load_level(path);
			if (success == 1)
			{
				obj_editor.show_menu = 0;
				audio_stop_all();
				audio_play_sound(sfx_success, 0, 0);
				if (instance_exists(obj_player_start))
				{
					obj_editor.x = obj_player_start.x;
					obj_editor.y = obj_player_start.y;
				}
				layer_background_blend(layer_background_get_id(layer_get_id("Background")), make_colour_rgb(obj_editor.bg_red, obj_editor.bg_green, obj_editor.bg_blue));
				global.music_track = obj_editor.music_track;
				switch (obj_editor.music_track)
				{
					case 1:
						audio_play_sound(bgm_intro, 0, 1);
						break;
					case 2:
						audio_play_sound(bgm_level1, 0, 1);
						break;
					case 3:
						audio_play_sound(bgm_level2, 0, 1);
						break;
					case 4:
						audio_play_sound(bgm_level3, 0, 1);
						break;
					case 5:
						audio_play_sound(bgm_level4, 0, 1);
						break;
					case 6:
						audio_play_sound(bgm_ending, 0, 1);
						break;
					case 7:
						audio_play_sound(bgm_runsettings, 0, 1);
						break;
				}
				instance_destroy();
			}
		}
		else
		{
			instance_destroy();
		}
	}
}
else if (mode == 3)
{
	global.description = string_copy(str, 1, 250);
	audio_play_sound(sfx_success, 0, 0);
	obj_editor.alarm[2] = 1;
	obj_editor.next_menu = 1;
	obj_editor.show_menu = 0;
	instance_destroy();
}
