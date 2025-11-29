if (step == 0)
{
	global.camera_stop = 1;
	global.controlstop = 1;
	alarm[0] = 120;
}
else if (step == 1)
{
	obj_camera.vspeed = -0.3;
	alarm[0] = 180;
}
else if (step == 2)
{
	obj_camera.vspeed = 0;
	alarm[0] = 120;
}
else if (step == 3)
{
	global.controlstop = 2;
	alarm[0] = 120;
}
else if (step == 4)
{
	instance_destroy(obj_fade);
	instance_create_depth(0, 0, -1, obj_fade);
	alarm[0] = 30;
}
else if (step == 5)
{
	ini_open("ignore.ini");
	ini_write_real("Tutorial", "Valid", 1);
	global.tutorial_complete = 1;
	ini_close();
	global.camera_stop = 0;
	global.time_milliseconds = 0;
	global.time_seconds = 0;
	global.time_minutes = 0;
	global.coins = 0;
	global.deaths = 0;
	room_goto(rm_level1);
}
step += 1;
