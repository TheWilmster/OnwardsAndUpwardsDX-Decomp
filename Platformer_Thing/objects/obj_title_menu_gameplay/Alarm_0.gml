if (global.selectionmenu == 0)
{
	audio_stop_sound(bgm_intro);
	global.coins = 0;
	global.deaths = 0;
	global.time_milliseconds = 0;
	global.time_minutes = 0;
	global.time_seconds = 0;
	if (global.tutorial_complete == 0)
		room_goto(rm_tutorial);
	else
		room_goto(rm_level1);
}
instance_destroy();
