if (keyboard_check_pressed(vk_space) || input_check_pressed("face_a") || input_check_pressed("face_b") || input_check_pressed("face_x") || input_check_pressed("face_y"))
{
	audio_stop_all();
	room_goto(rm_intro);
}
