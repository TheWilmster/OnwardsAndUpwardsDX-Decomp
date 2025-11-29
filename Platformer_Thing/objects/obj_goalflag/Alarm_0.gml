if (room == rm_editor)
{
	global.level_won = 0;
	instance_activate_object(obj_editor);
	instance_destroy(obj_camera);
	instance_destroy(obj_grapple_up);
	instance_destroy(obj_grapple_left);
	instance_destroy(obj_grapple_right);
	layer_set_visible(layer_get_id("Grid"), 1);
	instance_destroy(obj_player);
}
else
{
	instance_create_depth(0, 0, -100, obj_endofcustomlevel);
}
