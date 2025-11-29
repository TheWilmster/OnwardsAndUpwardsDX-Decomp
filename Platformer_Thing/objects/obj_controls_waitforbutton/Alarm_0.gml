alarm[0] = 60;
if (accepting == 0)
{
	keyboard_lastchar = "";
	accepting = 1;
}
else
{
	timeout -= 1;
	if (timeout == 0)
	{
		input_binding_scan_abort();
		instance_activate_object(obj_menu_revamped);
		instance_destroy();
	}
}
