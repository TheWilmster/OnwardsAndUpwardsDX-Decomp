if (recording == 1)
{
	data_left += string(keyboard_check(vk_left));
	data_right += string(keyboard_check(vk_right));
	data_up += string(keyboard_check(vk_up));
	data_jump += string(keyboard_check(ord("Z")));
	data_jump_pressed += string(keyboard_check_pressed(ord("Z")));
	data_run += string(keyboard_check(ord("X")));
	data_run_pressed += string(keyboard_check_pressed(ord("X")));
	data_run_released += string(keyboard_check_released(ord("X")));
}
if (run_key_released_while_paused == 1 && pause == 0)
	run_key_released_while_paused = 0;
if (input_check_pressed("editor_return") || (input_check_pressed("pause") && running_on_deck() == 1))
{
	if (allowed_to_exit_playtest_mode == 0)
	{
		if (room == rm_editor)
		{
			instance_activate_object(obj_editor);
			instance_destroy(obj_camera);
			instance_destroy(obj_grapple_up);
			instance_destroy(obj_grapple_left);
			instance_destroy(obj_grapple_right);
			global.validating_now = 0;
			layer_set_visible(layer_get_id("Grid"), 1);
			instance_destroy();
		}
	}
}
if (global.invisible_map == 1)
{
	time_before_show_hide -= 1;
	if (time_before_show_hide == 0)
	{
		if (showing_map == 1)
		{
			showing_map = 0;
			time_before_show_hide = 80;
			layer_set_visible(layer_get_id("Collision"), 0);
			layer_set_visible(layer_get_id("Decor"), 0);
		}
		else
		{
			showing_map = 1;
			time_before_show_hide = 10;
			layer_set_visible(layer_get_id("Collision"), 1);
			layer_set_visible(layer_get_id("Decor"), 1);
		}
	}
}
