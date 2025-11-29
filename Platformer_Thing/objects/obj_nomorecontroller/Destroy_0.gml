if (game_paused == 0)
{
	global.controlstopall = false;
	instance_activate_all();
	if (upload_menu_disabled == 1)
		instance_deactivate_object(obj_uploadmenu_main);
	if (editor_disabled == 1)
		instance_deactivate_object(obj_editor);
	if (menu_disabled == 1)
		instance_deactivate_object(obj_menu_revamped);
}
else
{
	instance_activate_object(obj_player);
}
