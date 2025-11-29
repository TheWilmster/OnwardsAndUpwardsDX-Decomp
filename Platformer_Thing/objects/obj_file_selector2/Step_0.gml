if (input_check_pressed("up") || input_check_pressed("stick_up"))
{
	if (selection > 0)
	{
		selection -= 1;
		if (selection < array_length(files))
		{
			if (os_type == os_windows)
				sprite_replace(scr, "C:/Users/" + global.user + "/OnU/Screenshots/" + files[selection], 1, 0, 0, 0, 0);
			else
				sprite_replace(scr, global.user + "/OnU/Screenshots/" + files[selection], 1, 0, 0, 0, 0);
			loading = 1;
			alarm[2] = 5;
		}
	}
	audio_play_sound(sfx_jump, 0, 0);
}
if (input_check_pressed("down") || input_check_pressed("stick_down"))
{
	if (selection < array_length(files))
	{
		selection += 1;
		if (selection < array_length(files))
		{
			if (os_type == os_windows)
				sprite_replace(scr, "C:/Users/" + global.user + "/OnU/Screenshots/" + files[selection], 1, 0, 0, 0, 0);
			else
				sprite_replace(scr, global.user + "/OnU/Screenshots/" + files[selection], 1, 0, 0, 0, 0);
			loading = 1;
			alarm[2] = 5;
		}
	}
	audio_play_sound(sfx_jump, 0, 0);
}
if (input_check_pressed("jump") || input_check_pressed("jumpmenu"))
{
	if (selection < array_length(files))
	{
		global.screenshot = files[selection];
		alarm[1] = 3;
	}
	else
	{
		alarm[0] = 3;
	}
}
if (input_check_pressed("cancel"))
	alarm[0] = 3;
