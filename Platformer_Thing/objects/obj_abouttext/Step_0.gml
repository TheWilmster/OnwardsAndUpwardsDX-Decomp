y -= 0.1;
if (keyboard_check(vk_anykey))
{
	if (keyboard_check(vk_space))
	{
		y -= 0.9;
		space_pressed = 1;
	}
	else if (keyboard_check_pressed(vk_anykey))
	{
		instance_destroy(obj_fade);
		instance_create_depth(0, 0, -1, obj_fade);
		audio_stop_sound(bgm_level4);
		alarm[0] = 30;
	}
}
if (input_check_pressed("pause"))
{
	instance_destroy(obj_fade);
	instance_create_depth(0, 0, -1, obj_fade);
	audio_stop_sound(bgm_level4);
	alarm[0] = 30;
}
if (input_check("face_a") || input_check("face_b") || input_check("face_x") || input_check("face_y"))
{
	y -= 0.9;
	space_pressed = 1;
}
if (y < -1300)
{
	if (!steam_get_achievement("ACH_ABOUTME") && space_pressed == 0)
		steam_set_achievement("ACH_ABOUTME");
}
