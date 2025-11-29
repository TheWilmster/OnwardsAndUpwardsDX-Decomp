if (input_check_pressed("face_a") || input_check_pressed("face_b") || input_check_pressed("face_x") || input_check_pressed("face_y"))
{
	instance_create_depth(0, 0, depth, obj_file_selector);
	instance_destroy();
}
if (keyboard_check_pressed(vk_space))
{
	instance_destroy(obj_fade);
	instance_create_depth(0, 0, -1, obj_fade);
	audio_stop_sound(bgm_intro);
	alarm[0] = 30;
}
