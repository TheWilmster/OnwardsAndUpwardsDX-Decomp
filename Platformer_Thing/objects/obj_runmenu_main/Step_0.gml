if (obj_menu_revamped.exiting == 1)
{
	ini_open("controls.onuc");
	ini_write_real("Option", "Zoom", global.zoom);
	ini_write_real("Option", "ScreenFX", global.screen_fx);
	if (global.starting_tile_mode == 1)
		global.starting_tile_mode = "rec";
	else
		global.starting_tile_mode = "fav";
	ini_write_string("Option", "EditorDefaultMode", global.starting_tile_mode);
	ini_close();
	instance_destroy();
}
