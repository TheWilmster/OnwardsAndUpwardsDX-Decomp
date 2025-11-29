uploading_status = 0;
selection = 0;
success = 0;
type = 0;
update_handle = 0;
request_id = 0;
legal_agreement = 0;
exiting = 0;
if (string_length(global.description) > 100)
{
	desc = string_copy(global.description, 0, 100);
	desc += "...";
}
else
{
	desc = global.description;
}
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
obj_menu_revamped.last_menu = -1;
obj_menu_revamped.last_room = rm_demo;
