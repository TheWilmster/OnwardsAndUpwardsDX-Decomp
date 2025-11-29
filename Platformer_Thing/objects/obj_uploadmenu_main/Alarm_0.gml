swears = 0;
uploading_status = 1;
app_id = steam_get_app_id();
test = check_for_bad_language(global.level_name);
if (test == 1)
	swears = 1;
test = check_for_bad_language(global.description);
if (test == 1)
	swears = 1;
test = check_for_bad_characters(global.level_name);
if (test == 1)
	uploading_status = 6;
if (uploading_status == 1)
{
	uploading_status = 7;
	instance_create_depth(0, 0, depth, obj_file_selector2);
}
else
{
	audio_play_sound(sfx_error, 0, 0);
}
exiting = 0;
if (uploading_status == 7)
{
	obj_menu_revamped.menu_options = 2;
	obj_menu_revamped.menu_label = ["Yes", "No"];
	obj_menu_revamped.menu_description = ["", ""];
	obj_menu_revamped.menu_description_locked = ["", ""];
	obj_menu_revamped.menu_function = ["redirectother", "redirectother"];
	obj_menu_revamped.menu_variable = [0, 0];
	obj_menu_revamped.menu_var_max = [0, 0];
	obj_menu_revamped.menu_var_min = [0, 0];
	obj_menu_revamped.menu_var_inc = [0, 0];
	obj_menu_revamped.menu_var_req = [0, 0];
	obj_menu_revamped.menu_toggle_true = ["N/A", "N/A"];
	obj_menu_revamped.menu_toggle_false = ["N/A", "N/A"];
	obj_menu_revamped.last_menu = -1;
	obj_menu_revamped.last_room = -1;
	instance_deactivate_object(obj_menu_revamped);
}
