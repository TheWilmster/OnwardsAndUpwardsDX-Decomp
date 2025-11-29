if (obj_menu_revamped.exiting == 1)
{
	str = input_player_export();
	buffer = buffer_create(1, buffer_grow, 1);
	buffer_write(buffer, buffer_string, str);
	buffer_save(buffer, "controller.onuc");
	buffer_delete(buffer);
	instance_destroy();
}
obj_menu_revamped.menu_description[0] = "Current setting: " + input_verb_get_icon("jump");
obj_menu_revamped.menu_description[1] = "Current setting: " + input_verb_get_icon("grapple");
