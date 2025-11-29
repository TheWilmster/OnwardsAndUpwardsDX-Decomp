if (instance_exists(obj_menu_revamped))
{
	if (obj_menu_revamped.exiting == 1 && exiting == 0)
	{
		if (uploading_status == 0 && obj_menu_revamped.selection == 0)
			alarm[0] = 30;
		else if (uploading_status == 7)
			alarm[1] = 30;
		exiting = 1;
	}
}
else if (uploading_status != 1 && uploading_status != 2)
{
	instance_activate_object(obj_menu_revamped);
	exiting = 0;
	if (uploading_status == 4 || uploading_status == 5 || uploading_status == 6)
	{
		obj_menu_revamped.selection = 0;
		obj_menu_revamped.menu_options = 1;
		obj_menu_revamped.menu_label = ["OK"];
		obj_menu_revamped.menu_description = [""];
		obj_menu_revamped.menu_description_locked = [""];
		obj_menu_revamped.menu_function = ["room"];
		obj_menu_revamped.menu_variable = [rm_demo];
		obj_menu_revamped.menu_var_max = [0];
		obj_menu_revamped.menu_var_min = [0];
		obj_menu_revamped.menu_var_inc = [0];
		obj_menu_revamped.menu_var_req = [0];
		obj_menu_revamped.menu_toggle_true = ["N/A"];
		obj_menu_revamped.menu_toggle_false = ["N/A"];
		obj_menu_revamped.last_menu = -1;
		obj_menu_revamped.last_room = rm_demo;
	}
	else if (uploading_status == 0)
	{
		obj_menu_revamped.selection = 0;
		obj_menu_revamped.menu_options = 3;
		obj_menu_revamped.menu_label = ["Continue", "Read Terms", "Go Back"];
		obj_menu_revamped.menu_description = ["", "", ""];
		obj_menu_revamped.menu_description_locked = ["", "", ""];
		obj_menu_revamped.menu_function = ["redirectother", "opensteamurl", "room"];
		obj_menu_revamped.menu_variable = [0, "http://steamcommunity.com/sharedfiles/workshoplegalagreement", rm_demo];
		obj_menu_revamped.menu_var_max = [0, 0, 0];
		obj_menu_revamped.menu_var_min = [0, 0, 0];
		obj_menu_revamped.menu_var_inc = [0, 0, 0];
		obj_menu_revamped.menu_var_req = [0, 0, 0];
		obj_menu_revamped.menu_toggle_true = ["N/A", "N/A", "N/A"];
		obj_menu_revamped.menu_toggle_false = ["N/A", "N/A", "N/A"];
		obj_menu_revamped.last_room = rm_demo;
		obj_menu_revamped.last_menu = -1;
	}
}
