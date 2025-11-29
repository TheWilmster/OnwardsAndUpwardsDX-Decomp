if (input_check_pressed("pause"))
{
	global.coins = 0;
	global.time_milliseconds = 0;
	global.time_seconds = 0;
	global.time_minutes = 0;
	instance_destroy(obj_fade);
	instance_create_depth(0, 0, -1, obj_fade);
	audio_stop_all();
	instance_destroy(obj_camera);
	instance_destroy(obj_player);
	instance_destroy(obj_grapple_left);
	instance_destroy(obj_grapple_right);
	instance_destroy(obj_grapple_up);
	alarm[0] = 30;
}
if (input_player_get_gamepad() == -1)
{
	audio_stop_all();
	audio_play_sound(bgm_intro, 0, 1);
	room_goto(rm_demo);
}
