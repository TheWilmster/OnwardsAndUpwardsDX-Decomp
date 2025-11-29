if (input_check_pressed("jump") || input_check_pressed("jumpmenu") || input_check_pressed("pause"))
{
	instance_destroy(obj_camera);
	instance_destroy(obj_player);
	instance_destroy(obj_grapple_up);
	instance_destroy(obj_grapple_left);
	instance_destroy(obj_grapple_right);
	if (selection == 1)
	{
		global.coins = 0;
		global.time_milliseconds = 0;
		global.time_seconds = 0;
		global.time_minutes = 0;
		instance_destroy(obj_fade);
		instance_create_depth(0, 0, -1, obj_fade);
		audio_stop_sound(bgm_intro);
		alarm[1] = 30;
	}
	else
	{
		inst = instance_create_depth(0, 0, depth - 1, obj_menu_revamped);
		inst.starting_menu = obj_title_menu;
		alarm[0] = 1;
	}
}
if (keyboard_check_pressed(ord("2")))
{
	if (!code_is_compiled())
	{
		global.coins = 0;
		instance_destroy(obj_fade);
		audio_stop_sound(bgm_intro);
		room_goto(rm_level2);
	}
}
if (keyboard_check_pressed(ord("3")))
{
	if (!code_is_compiled())
	{
		global.coins = 0;
		instance_destroy(obj_fade);
		audio_stop_sound(bgm_intro);
		room_goto(rm_level3);
	}
}
if (keyboard_check_pressed(ord("4")))
{
	if (!code_is_compiled())
	{
		global.coins = 0;
		instance_destroy(obj_fade);
		audio_stop_sound(bgm_intro);
		room_goto(rm_level4);
	}
}
if (keyboard_check_pressed(ord("5")))
{
	if (!code_is_compiled())
	{
		instance_destroy(obj_fade);
		audio_stop_sound(bgm_intro);
		room_goto(rm_ending);
	}
}
