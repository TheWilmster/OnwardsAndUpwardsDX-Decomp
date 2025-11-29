if (input_check_pressed("jump") || input_check_pressed("jumpmenu") || input_check_pressed("grapple") || input_check_pressed("face_a") || input_check_pressed("face_b") || input_check_pressed("face_x") || input_check_pressed("face_y") || input_check_pressed("pause"))
	event_perform(ev_alarm, 0);
