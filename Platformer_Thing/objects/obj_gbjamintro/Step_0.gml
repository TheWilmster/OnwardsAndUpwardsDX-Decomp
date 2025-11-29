if (y == -48)
	vspeed = 0;
if (keyboard_check_pressed(vk_space) || input_check_pressed("face_a") || input_check_pressed("face_b") || input_check_pressed("face_x") || input_check_pressed("face_y") || input_check_pressed("pause"))
{
	audio_stop_sound(sfx_tfs_intro);
	alarm[2] = 30;
	instance_create_depth(0, 0, -1, obj_fade);
}
other_y += abs(vspeed);
if (keyboard_check_pressed(ord("2")))
{
	if (!code_is_compiled())
	{
		instance_destroy(obj_fade);
		audio_stop_sound(bgm_intro);
		room_goto(rm_level2);
	}
}
if (keyboard_check_pressed(ord("3")))
{
	if (!code_is_compiled())
	{
		instance_destroy(obj_fade);
		audio_stop_sound(bgm_intro);
		room_goto(rm_level3);
	}
}
if (keyboard_check_pressed(ord("4")))
{
	if (!code_is_compiled())
	{
		instance_destroy(obj_fade);
		audio_stop_sound(bgm_intro);
		room_goto(rm_level4);
	}
}
if (keyboard_check_pressed(ord("5")))
{
	if (!code_is_compiled())
	{
		instance_destroy(obj_fade);
		audio_stop_sound(bgm_intro);
		room_goto(rm_ending);
	}
}
if (keyboard_check_pressed(ord("6")))
{
	if (!code_is_compiled())
	{
		instance_destroy(obj_fade);
		audio_stop_sound(bgm_intro);
		room_goto(rm_editor);
	}
}
