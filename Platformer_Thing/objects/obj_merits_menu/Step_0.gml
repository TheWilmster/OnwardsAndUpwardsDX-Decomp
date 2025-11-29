if (input_check_pressed("up") || input_check_pressed("stick_up"))
{
	if (selection == 0)
	{
		if (scroll > 0)
		{
			audio_play_sound(sfx_jump, 0, 0);
			scroll -= 1;
		}
	}
	else
	{
		audio_play_sound(sfx_jump, 0, 0);
		selection -= 1;
	}
}
if (input_check_pressed("down") || input_check_pressed("stick_down"))
{
	if (selection == 2)
	{
		if (scroll < (9 + test))
		{
			audio_play_sound(sfx_jump, 0, 0);
			scroll += 1;
		}
	}
	else
	{
		audio_play_sound(sfx_jump, 0, 0);
		selection += 1;
	}
	show_debug_message(global.achievements[selection + scroll]);
}
if ((y * -1) > ((scroll * 44) - 12))
	y += 4;
else if ((y * -1) < ((scroll * 44) - 12))
	y -= 4;
if (input_check_pressed("face_a") || input_check_pressed("face_b") || input_check_pressed("face_x") || input_check_pressed("face_y") || input_check_pressed("jump") || input_check_pressed("jumpmenu") || input_check_pressed("grapple") || keyboard_check_pressed(vk_escape))
{
	if (!instance_exists(obj_fade))
	{
		instance_create_depth(0, 0, -1, obj_fade);
		alarm[0] = 30;
	}
}
