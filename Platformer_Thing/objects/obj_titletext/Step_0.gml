y -= 0.1;
if (input_check("jump") || input_check("jumpmenu") || input_check("grapple") || input_check("face_a") || input_check("face_b") || input_check("face_x") || input_check("face_y") || input_check("pause"))
	y -= 0.9;
if (y < y_threshold && transition == 0)
{
	instance_create_depth(0, 0, -100, obj_fade);
	alarm[0] = 30;
	transition = 1;
}
if (mode == 1)
{
	if (input_check_pressed("jump") || input_check_pressed("jumpmenu") || input_check_pressed("grapple") || input_check_pressed("face_a") || input_check_pressed("face_b") || input_check_pressed("face_x") || input_check_pressed("face_y") || input_check_pressed("pause"))
	{
		audio_stop_all();
		room_goto(rm_intro);
	}
}
