if (instance_exists(obj_file_selector2))
	upload_menu_disabled = 1;
else
	upload_menu_disabled = 0;
if (instance_exists(obj_namer))
	editor_disabled = 1;
else
	editor_disabled = 0;
if (!instance_exists(obj_menu_revamped))
	menu_disabled = 1;
else
	menu_disabled = 0;
if (instance_exists(obj_player))
{
	editor_disabled = 1;
	if (obj_player.pause == 0)
	{
		instance_deactivate_all(true);
		instance_activate_object(obj_drawscreen);
		game_paused = 0;
	}
	else
	{
		instance_deactivate_object(obj_player);
		game_paused = 1;
	}
}
else
{
	editor_disabled = 0;
	instance_deactivate_all(true);
	instance_activate_object(obj_drawscreen);
	game_paused = 0;
}
steam_overlay = 0;
checking = 0;
instance_activate_object(input_controller_object);
alarm[0] = 1;
