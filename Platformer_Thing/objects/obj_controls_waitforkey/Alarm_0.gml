alarm[0] = 60;
if (accepting == 0)
{
	keyboard_string = "";
	accepting = 1;
}
else
{
	timeout -= 1;
	if (timeout == 0)
	{
		instance_create_depth(0, 0, depth, obj_runmenu_controls);
		instance_destroy();
	}
}
