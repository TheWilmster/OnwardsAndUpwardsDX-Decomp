if (input_check_pressed("jump") || input_check_pressed("jumpmenu"))
{
	instance_create_depth(0, 0, depth, obj_runmenu_main);
	instance_destroy();
}
