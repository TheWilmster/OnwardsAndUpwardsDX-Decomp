if (input_check_pressed("up") || input_check_pressed("stick_up"))
{
	selection = 0;
	audio_play_sound(sfx_jump, 0, 0);
}
if (input_check_pressed("down") || input_check_pressed("stick_down"))
{
	selection = 1;
	audio_play_sound(sfx_jump, 0, 0);
}
if (input_check_pressed("jump") || input_check_pressed("jumpmenu"))
{
	if (selection == 0)
		file_delete(global.level);
	instance_activate_object(obj_menu_revamped);
	instance_create_depth(0, 0, depth, obj_file_selector);
	instance_destroy();
}
if (input_check_pressed("cancel"))
{
	instance_activate_object(obj_menu_revamped);
	instance_create_depth(0, 0, depth, obj_file_selector);
	instance_destroy();
}
