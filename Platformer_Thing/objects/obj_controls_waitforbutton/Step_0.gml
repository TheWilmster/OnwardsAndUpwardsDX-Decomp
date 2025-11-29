if (accepting == 1)
{
	if (input_player_get_gamepad() == -1)
	{
		if (keyboard_lastchar != "")
		{
			keyboard_lastchar = string_upper(keyboard_lastchar);
			if (keyboard_lastchar != "W" && keyboard_lastchar != "S" && keyboard_lastchar != "A" && keyboard_lastchar != "D" && keyboard_lastchar != "R" && keyboard_lastchar != "P")
			{
				if (arg == 0)
					input_binding_set("jump", input_binding_key(keyboard_lastchar), 0, 0, "keyboard_and_mouse");
				else if (arg == 1)
					input_binding_set("grapple", input_binding_key(keyboard_lastchar), 0, 0, "keyboard_and_mouse");
				audio_play_sound(sfx_success, 0, 0);
				instance_activate_object(obj_menu_revamped);
				instance_destroy();
			}
			else
			{
				audio_play_sound(sfx_error, 0, 0);
				global.show_error_message = 300;
				global.error_message = "Can't use! Try again!";
				keyboard_lastchar = "";
			}
		}
	}
}
