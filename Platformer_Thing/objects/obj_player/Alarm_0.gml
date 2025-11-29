if (global.validating_now == 1)
{
	global.validating_now = -1;
	instance_activate_object(obj_editor);
	instance_destroy(obj_camera);
	instance_destroy(obj_grapple_up);
	instance_destroy(obj_grapple_left);
	instance_destroy(obj_grapple_right);
	layer_set_visible(layer_get_id("Grid"), 1);
	instance_destroy();
}
else if (global.no_death_mode == 1)
{
	audio_stop_all();
	global.coins = 0;
	global.deaths = 0;
	global.time_milliseconds = 0;
	global.time_seconds = 0;
	global.time_minutes = 0;
	global.coin1 = 0;
	global.coin2 = 0;
	global.coin3 = 0;
	room_goto(rm_level1);
}
else if (lives > 0)
{
	lives -= 1;
	if (lives == 0)
	{
		if (room == rm_editor)
		{
			global.validating_now = -1;
			instance_activate_object(obj_editor);
			instance_destroy(obj_camera);
			instance_destroy(obj_grapple_up);
			instance_destroy(obj_grapple_left);
			instance_destroy(obj_grapple_right);
			layer_set_visible(layer_get_id("Grid"), 1);
			instance_destroy();
		}
		else
		{
			instance_create_depth(0, 0, -100, obj_gameover);
		}
	}
	else
	{
		vis = 1;
		x = global.check_x;
		y = global.check_y;
		dead = 0;
		global.controlstopall = 0;
		alarm[2] = 5;
		if (global.preserve_flags == 0)
			global.reset_all_flags = 1;
	}
}
else
{
	vis = 1;
	x = global.check_x;
	y = global.check_y;
	dead = 0;
	global.controlstopall = 0;
	alarm[2] = 5;
	if (global.preserve_flags == 0)
		global.reset_all_flags = 1;
}
