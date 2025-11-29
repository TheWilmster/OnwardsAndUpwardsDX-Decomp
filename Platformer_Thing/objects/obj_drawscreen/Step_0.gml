if (keyboard_check_pressed(vk_f5) && keyboard_check(vk_control) && room != rm_error)
{
	audio_stop_all();
	global.game_restarting = 1;
	game_restart();
	instance_destroy();
}
if (keyboard_check_pressed(vk_f2) || input_check_pressed("screenshot"))
{
	if (os_type == os_windows)
		path = "C:/Users/" + global.user + "/OnU/Screenshots/";
	else
		path = global.user + "/OnU/Screenshots/";
	if (room == rm_editor)
		name = global.level_name + string(current_day) + string(current_month) + string(current_year) + "at" + string(current_hour) + string(current_minute) + string(current_second) + ".png";
	else
		name = string(current_day) + string(current_month) + string(current_year) + "at" + string(current_hour) + string(current_minute) + string(current_second) + ".png";
	screen_save(path + name);
	audio_play_sound(sfx_success, 0, 0);
	show_confirmation = 180;
}
else if (steam_is_screenshot_requested())
{
	if (os_type == os_windows)
		path = "C:/Users/" + global.user + "/OnU/Screenshots/";
	else
		path = global.user + "/OnU/Screenshots/";
	if (room == rm_editor)
		name = global.level_name + string(current_day) + string(current_month) + string(current_year) + "at" + string(current_hour) + string(current_minute) + string(current_second) + "-STEAM.png";
	else
		name = string(current_day) + string(current_month) + string(current_year) + "at" + string(current_hour) + string(current_minute) + string(current_second) + "-STEAM.png";
	screen_save(path + name);
	steam_send_screenshot(path + name, 640, 576);
	audio_play_sound(sfx_success, 0, 0);
	show_confirmation = 180;
}
if (input_player_get_gamepad(0) > -1)
{
	gamepad_connected = 1;
}
else if (gamepad_connected == 1 && !steam_utils_is_steam_running_on_steam_deck())
{
	if (!instance_exists(obj_nomorecontroller))
	{
		gamepad_connected = 0;
		global.controlstopall = true;
		instance_create_depth(0, 0, -100, obj_nomorecontroller);
		instance_activate_object(obj_drawscreen);
	}
}
if (room != rm_editor)
{
	window_set_cursor(cr_none);
	valid = 0;
}
else
{
	window_set_cursor(cr_default);
	if (global.validated == 1)
	{
		level_name = global.level_name;
		valid = 1;
	}
	else if (valid == 1 && global.level_name == level_name)
	{
		global.show_error_message = 300;
		global.error_message = "Validation revoked!";
		valid = 0;
		audio_play_sound(sfx_error, 0, 0);
	}
	else if (level_name != global.level_name)
	{
		level_name = global.level_name;
		valid = 0;
	}
}
if (steam_initialised())
{
	steam_update();
	if (steam_stats_ready())
		global.ready_to_send_achievements = 1;
	if (steam_is_overlay_activated() && activado == 0)
	{
		inst = instance_create_depth(0, 0, -100, obj_nomorecontroller);
		inst.steam_overlay = 1;
		activado = 1;
	}
	else if (!steam_is_overlay_activated() && activado == 1)
	{
		instance_destroy(obj_nomorecontroller);
		activado = 0;
	}
}
else if (steam_message == 0)
{
	steam_message = 1;
	show_steam_message = 300;
	audio_play_sound(sfx_error, 0, 0);
}
if (keyboard_check_pressed(vk_f4))
{
	if (window_get_fullscreen())
		window_set_fullscreen(false);
	else
		window_set_fullscreen(true);
}
if (show_confirmation > 0)
	show_confirmation -= 1;
if (show_steam_message > 0)
	show_steam_message -= 1;
if (global.show_error_message > 0)
	global.show_error_message -= 1;
if (global.show_notification_message > 0)
	global.show_notification_message -= 1;
if (global.spin_screen == 1)
	screen_angle += 1;
else
	screen_angle = 0;
camera_set_view_angle(view_camera[0], screen_angle);
if (global.blind_spot == 1)
{
	if (circdir == 0)
	{
		circx -= 2;
		circy -= 2;
		if (circx <= 20)
			circdir = 1;
		if (circy <= 20)
			circdir = 3;
	}
	else if (circdir == 1)
	{
		circx += 2;
		circy -= 2;
		if (circx >= 140)
			circdir = 0;
		if (circy <= 20)
			circdir = 2;
	}
	else if (circdir == 2)
	{
		circx += 2;
		circy += 2;
		if (circx >= 140)
			circdir = 3;
		if (circy >= 124)
			circdir = 1;
	}
	else if (circdir == 3)
	{
		circx -= 2;
		circy += 2;
		if (circx <= 20)
			circdir = 2;
		if (circy >= 124)
			circdir = 0;
	}
}
if (you_are_an_idiot == 1)
{
	for (var i = 0; i < 5; i++)
	{
		if (screen_dir[i] == 0)
		{
			screen_x[i] -= 2;
			screen_y[i] -= 2;
			if (screen_x[i] <= 0)
				screen_dir[i] = 1;
			if (screen_y[i] <= 0)
				screen_dir[i] = 3;
		}
		else if (screen_dir[i] == 1)
		{
			screen_x[i] += 2;
			screen_y[i] -= 2;
			if (screen_x[i] >= 80)
				screen_dir[i] = 0;
			if (screen_y[i] <= 0)
				screen_dir[i] = 2;
		}
		else if (screen_dir[i] == 2)
		{
			screen_x[i] += 2;
			screen_y[i] += 2;
			if (screen_x[i] >= 80)
				screen_dir[i] = 3;
			if (screen_y[i] >= 72)
				screen_dir[i] = 1;
		}
		else if (screen_dir[i] == 3)
		{
			screen_x[i] -= 2;
			screen_y[i] += 2;
			if (screen_x[i] <= 0)
				screen_dir[i] = 2;
			if (screen_y[i] >= 72)
				screen_dir[i] = 0;
		}
	}
}
if (global.chaos_mode == 1 && chaos_mode_init == 0)
{
	if (room == rm_level1)
	{
		chaos_mode_init = 1;
		alarm[0] = irandom_range(300, 1200);
	}
}
else if (global.chaos_mode == 0 && chaos_mode_init == 1)
{
	screen_burn = 0;
	shrinking = 0;
	shrink_offset = 0;
	chaos_mode_init = 0;
	show_snapshot = 0;
	dizzy_mode = 0;
}
if (global.super_chaos_mode == 1 && super_chaos_mode_init == 0)
{
	if (room == rm_level1)
	{
		super_chaos_mode_init = 1;
		alarm[1] = irandom_range(180, 900);
	}
}
else if (global.super_chaos_mode == 0 && super_chaos_mode_init == 1)
{
	screen_burn = 0;
	shrinking = 0;
	shrink_offset = 0;
	super_chaos_mode_init = 0;
	show_snapshot = 0;
	dizzy_mode = 0;
	you_are_an_idiot = 0;
	game_set_speed(60, gamespeed_fps);
	speed_ramping = 0;
}
if (global.mega_chaos_mode == 1 && mega_chaos_mode_init == 0)
{
	if (room == rm_level1)
	{
		mega_chaos_mode_init = 1;
		alarm[2] = irandom_range(180, 900);
	}
}
else if (global.mega_chaos_mode == 0 && mega_chaos_mode_init == 1)
{
	screen_burn = 0;
	shrinking = 0;
	shrink_offset = 0;
	mega_chaos_mode_init = 0;
	show_snapshot = 0;
	dizzy_mode = 0;
	you_are_an_idiot = 0;
	game_set_speed(60, gamespeed_fps);
	speed_ramping = 0;
}
if (room == rm_ending)
{
	global.chaos_mode = 0;
	global.super_chaos_mode = 0;
	global.mega_chaos_mode = 0;
	chaos_mode_init = 0;
	super_chaos_mode_init = 0;
	mega_chaos_mode_init = 0;
}
if (shrinking > 0)
{
	shrinking -= 0.001;
	shrink_offset += (1/3);
}
if (mode == 0)
{
	topleft_x -= 1;
	if (topleft_x == -10)
		mode = 1;
}
else
{
	topleft_x += 1;
	if (topleft_x == 10)
		mode = 0;
}
if (speed_ramping == 1)
{
	if (speed_mode == 0)
	{
		if (frames > 20)
		{
			frames -= 1;
			game_set_speed(frames, gamespeed_fps);
		}
		else
		{
			speed_mode = 1;
		}
	}
	else if (frames < 120)
	{
		frames += 1;
		game_set_speed(frames, gamespeed_fps);
	}
	else
	{
		speed_mode = 0;
	}
	audio_sound_pitch(bgm_level1, frames / 60);
	audio_sound_pitch(bgm_level2, frames / 60);
	audio_sound_pitch(bgm_level3, frames / 60);
	audio_sound_pitch(bgm_level4, frames / 60);
}
btmleft_x = topleft_x * -1;
if (super_chaos_mode_init == 1 || mega_chaos_mode_init == 1)
{
	if (rewind == 0)
	{
		if (instance_exists(obj_player))
		{
			lily_x[array_length(lily_x)] = obj_player.x;
			if (array_length(lily_x) > 300)
				array_shift(lily_x);
			lily_y[array_length(lily_y)] = obj_player.y;
			if (array_length(lily_y) > 300)
				array_shift(lily_y);
			lily_xscale[array_length(lily_xscale)] = obj_player.xscl;
			if (array_length(lily_xscale) > 300)
				array_shift(lily_xscale);
			lily_action[array_length(lily_action)] = obj_player.action;
			if (array_length(lily_action) > 300)
				array_shift(lily_action);
		}
		with (obj_level_entity)
		{
			my_x[array_length(my_x)] = x;
			if (array_length(my_x) > 300)
				array_shift(my_x);
			my_y[array_length(my_y)] = y;
			if (array_length(my_y) > 300)
				array_shift(my_y);
			if (variable_instance_exists(self, "mode"))
			{
				my_mode[array_length(my_mode)] = mode;
				if (array_length(my_mode) > 300)
					array_shift(my_mode);
			}
		}
	}
	else
	{
		global.controlstopall = 1;
		obj_player.x = lily_x[rewind - 1];
		obj_player.y = lily_y[rewind - 1];
		obj_player.xscl = lily_xscale[rewind - 1];
		obj_player.action = lily_action[rewind - 1];
		with (obj_level_entity)
		{
			if (object_index != obj_fake_coin && object_index != obj_nonmovingcrusher)
			{
				x = my_x[other.rewind - 1];
				y = my_y[other.rewind - 1];
				if (variable_instance_exists(self, "mode"))
					mode = my_mode[other.rewind - 1];
			}
		}
		rewind -= 1;
		if (rewind == 0)
		{
			lily_x = [];
			lily_y = [];
			lily_xscale = [];
			lily_action = [];
			with (obj_level_entity)
			{
				my_x = [];
				my_y = [];
				my_mode = [];
			}
			track_pos = audio_sound_get_track_position(global.music);
			switch (room)
			{
				case rm_level1:
					audio_stop_sound(global.music);
					global.music = audio_play_sound(bgm_level1, 0, 1);
					break;
				case rm_level2:
					audio_stop_sound(global.music);
					global.music = audio_play_sound(bgm_level2, 0, 1);
					break;
				case rm_level3:
					audio_stop_sound(global.music);
					global.music = audio_play_sound(bgm_level3, 0, 1);
					break;
				case rm_level4:
					audio_stop_sound(global.music);
					global.music = audio_play_sound(bgm_level4, 0, 1);
					break;
			}
			audio_sound_set_track_position(global.music, audio_sound_length(global.music) - track_pos);
			global.controlstopall = 0;
		}
	}
}
if (frozen_trick > 0)
{
	audio_sound_set_track_position(global.music, track_pos);
	frozen_trick -= 1;
	if (frozen_trick == 0)
	{
		global.show_notification_message = 180;
		global.notification_message = "Haha fooled you!";
		global.controlstopall = 0;
		global.sound_fx = 1;
	}
}
tick += 1;
if (touch_fuzzy_mode == 1)
{
	for (var i = 0; i < 21; i++)
		fuzzy[i] = sin((tick / 8) + i) * 4;
}
if (show_random_chars == 1)
{
	if (start_putting_random_chars_on_screen < 128)
	{
		if (time_between_characters == 0)
		{
			start_putting_random_chars_on_screen += 1;
			time_between_characters = 10;
		}
		else
		{
			time_between_characters -= 1;
		}
	}
}
if (vhold == 1)
{
	vhold_screen1y += vhold_speed;
	vhold_screen2y += vhold_speed;
	if (vhold_screen1y > 144)
	{
		vhold_screen1y -= 144;
		vhold_screen2y -= 144;
	}
	if (vhold_mode == 0)
	{
		vhold_speed += 0.01;
		if (vhold_speed == 6)
			vhold_mode = 1;
	}
	else
	{
		vhold_speed -= 0.01;
		if (vhold_speed == 0.5)
			vhold_mode = 0;
	}
}
if (meteors == 1)
{
	if (time_between_meteors == 0)
	{
		time_between_meteors = 30;
		inst = instance_create_depth(obj_player.x, obj_player.y - 128, depth, obj_fallingcrusher);
		inst.my_x = [];
		inst.my_y = [];
		inst.my_mode = [];
	}
	else
	{
		time_between_meteors -= 1;
	}
}
