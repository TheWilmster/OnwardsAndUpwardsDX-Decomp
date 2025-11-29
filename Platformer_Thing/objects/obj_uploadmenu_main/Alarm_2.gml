exiting = 0;
instance_activate_object(obj_menu_revamped);
if (uploading_status == 3)
{
	obj_menu_revamped.menu_options = 2;
	obj_menu_revamped.menu_label = ["Yes", "No"];
	obj_menu_revamped.menu_description = ["", ""];
	obj_menu_revamped.menu_description_locked = ["", ""];
	obj_menu_revamped.menu_function = ["opensteamurl", "room"];
	obj_menu_revamped.menu_variable = ["steam://url/CommunityFilePage/" + string(global.published_id), rm_demo];
	obj_menu_revamped.menu_var_max = [0, 0];
	obj_menu_revamped.menu_var_min = [0, 0];
	obj_menu_revamped.menu_var_inc = [0, 0];
	obj_menu_revamped.menu_var_req = [0, 0];
	obj_menu_revamped.menu_toggle_true = ["N/A", "N/A"];
	obj_menu_revamped.menu_toggle_false = ["N/A", "N/A"];
	obj_menu_revamped.last_menu = -1;
	obj_menu_revamped.last_room = -1;
}
