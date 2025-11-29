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
	{
		window_set_caption("Onward and Upward! DX");
		audio_stop_all();
		room_goto(rm_intro);
	}
	else
	{
		instance_activate_object(obj_editor);
		instance_destroy();
	}
}
if (input_check_pressed("cancel"))
{
	instance_activate_object(obj_editor);
	instance_destroy();
}
