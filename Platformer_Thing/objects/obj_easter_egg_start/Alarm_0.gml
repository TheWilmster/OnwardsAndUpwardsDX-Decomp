if (step == 0)
{
	global.controlstop = -1;
	obj_player.xscl = 1;
	alarm[0] = 60;
}
else if (step == 1)
{
	alarm[0] = 40;
}
else if (step == 2)
{
	audio_play_sound(sfx_flush, 0, 0);
	alarm[0] = 75;
}
else if (step == 3)
{
	global.controlstop = 2;
	alarm[0] = 30;
}
else if (step == 4)
{
	global.controlstop = 0;
	instance_destroy(obj_cannonblock);
	obj_player.depth = 100;
	if (!steam_get_achievement("ACH_TOILET"))
		steam_set_achievement("ACH_TOILET");
	give_achievement(12);
}
step += 1;
