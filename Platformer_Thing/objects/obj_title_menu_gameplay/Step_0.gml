if (obj_menu_revamped.exiting == 1 && exiting == 0 && obj_menu_revamped.cancel == 0)
{
	if (global.selectionmenu == 0)
	{
		instance_destroy(obj_fade);
		instance_create_depth(0, 0, -1, obj_fade);
	}
	alarm[0] = 30;
	exiting = 1;
}
else if (obj_menu_revamped.exiting == 1 && exiting == 0)
{
	alarm[1] = 30;
	exiting = 1;
}
