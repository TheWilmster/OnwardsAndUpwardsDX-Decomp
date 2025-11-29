if (instance_exists(obj_player))
{
	if (global.objective == 1)
	{
		if (global.coins >= global.objective_value)
			open = 1;
		else
			open = 0;
	}
	else if (global.objective == 2)
	{
		if (global.touched_save_points >= global.objective_value)
			open = 1;
		else
			open = 0;
	}
}
else
{
	open = 1;
}
if (place_meeting(x, y, obj_player) && open == 1)
{
	global.goal_flags -= 1;
	audio_play_sound(sfx_yeah, 0, 0);
	x = -500;
	if (global.goal_flags == 0)
	{
		obj_player.timer_running = 0;
		global.level_won = 1;
		global.controlstopall = 1;
		audio_stop_sound(sfx_yeah);
		audio_play_sound(sfx_wedidit, 0, 0);
		alarm[0] = 180;
	}
}
if (global.respawn_all_platforms == 1)
{
	image_index = 0;
	x = xstart;
}
if (global.reset_all_flags == 1 && x != xstart)
{
	x = xstart;
	global.goal_flags += 1;
}
