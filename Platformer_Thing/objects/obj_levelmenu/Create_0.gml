global.validated = 0;
selection = 0;
done = 0;
ini_open(global.level);
test = ini_read_string("level", "decor", "not a legacy level");
ini_close();
instance_activate_object(obj_menu_revamped);
if (test == "not a legacy level")
{
	lvl = buffer_load(global.level);
	buffer_seek(lvl, buffer_seek_start, 0);
	global.description = buffer_read(lvl, buffer_string);
	global.validated = buffer_read(lvl, buffer_u8);
	buffer_delete(lvl);
	legacy_level = 0;
	done = 0;
	if (global.foreign_level == 0)
	{
		obj_menu_revamped.menu_options = 5;
		obj_menu_revamped.menu_label = ["Play Level", "Edit Level", "Delete", "Upload", "Go Back"];
		obj_menu_revamped.menu_description = ["", "", "", "", ""];
		obj_menu_revamped.menu_description_locked = ["", "", "", "", ""];
		obj_menu_revamped.menu_function = ["room", "room", "redirect", "room", "redirect"];
		obj_menu_revamped.menu_variable = [rm_custom_level, rm_editor, obj_deleteconfirmation, rm_uploadmenu, obj_file_selector];
		obj_menu_revamped.menu_var_max = [0, 0, 0, 0, 0];
		obj_menu_revamped.menu_var_min = [0, 0, 0, 0, 0];
		obj_menu_revamped.menu_var_inc = [0, 0, 0, 0, 0];
		obj_menu_revamped.menu_var_req = [0, 0, 0, 0, 0];
		obj_menu_revamped.menu_toggle_true = ["N/A", "N/A", "N/A", "N/A", "N/A"];
		obj_menu_revamped.menu_toggle_false = ["N/A", "N/A", "N/A", "N/A", "N/A"];
		obj_menu_revamped.last_menu = obj_file_selector;
	}
	else
	{
		obj_menu_revamped.menu_options = 4;
		obj_menu_revamped.menu_label = ["Play Level", "Edit Level", "Delete", "Go Back"];
		obj_menu_revamped.menu_description = ["", "", "", ""];
		obj_menu_revamped.menu_description_locked = ["", "", "", ""];
		obj_menu_revamped.menu_function = ["room", "togglerequirement", "redirect", "redirect"];
		obj_menu_revamped.menu_variable = [rm_custom_level, rm_editor, obj_deleteconfirmation, obj_file_selector];
		obj_menu_revamped.menu_var_max = [0, 0, 0, 0];
		obj_menu_revamped.menu_var_min = [0, 0, 0, 0];
		obj_menu_revamped.menu_var_inc = [0, 0, 0, 0];
		obj_menu_revamped.menu_var_req = [0, 0, 0, 0];
		obj_menu_revamped.menu_toggle_true = ["N/A", "", "N/A", "N/A"];
		obj_menu_revamped.menu_toggle_false = ["N/A", "", "N/A", "N/A"];
		obj_menu_revamped.last_menu = obj_file_selector;
	}
}
else
{
	obj_menu_revamped.menu_options = 1;
	obj_menu_revamped.menu_label = ["OK"];
	obj_menu_revamped.menu_description = [""];
	obj_menu_revamped.menu_description_locked = [""];
	obj_menu_revamped.menu_function = ["redirect"];
	obj_menu_revamped.menu_variable = [obj_file_selector];
	obj_menu_revamped.menu_var_max = [0];
	obj_menu_revamped.menu_var_min = [0];
	obj_menu_revamped.menu_var_inc = [0];
	obj_menu_revamped.menu_var_req = [0];
	obj_menu_revamped.menu_toggle_true = ["N/A"];
	obj_menu_revamped.menu_toggle_false = ["N/A"];
	obj_menu_revamped.last_menu = obj_file_selector;
}
