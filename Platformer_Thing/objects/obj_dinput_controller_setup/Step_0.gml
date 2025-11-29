if (step == 1)
{
	if (gamepad_button_check_pressed(global.gamepad, gp_face1))
	{
		global.controller_config = "playstation";
		step = 2;
		json[array_length(json)][0] = gamepad_get_description(global.gamepad);
		json[array_length(json) - 1][1] = "playstation";
		json = json_stringify(json);
		buffer_seek(buffer, buffer_seek_start, 1);
		buffer_write(buffer, buffer_string, json);
		buffer_save(buffer, "controller.onuc");
		buffer_delete(buffer);
	}
	else if (gamepad_button_check_pressed(global.gamepad, gp_face2))
	{
		step = 6;
	}
	else if (gamepad_button_check_pressed(global.gamepad, gp_face3))
	{
		global.controller_config = "xbox";
		step = 2;
		json[array_length(json)][0] = gamepad_get_description(global.gamepad);
		json[array_length(json) - 1][1] = "xbox";
		json = json_stringify(json);
		buffer_seek(buffer, buffer_seek_start, 1);
		buffer_write(buffer, buffer_string, json);
		buffer_save(buffer, "controller.onuc");
		buffer_delete(buffer);
	}
	else if (gamepad_button_check_pressed(global.gamepad, gp_face4))
	{
		global.controller_config = "nintendo";
		step = 2;
		json[array_length(json)][0] = gamepad_get_description(global.gamepad);
		json[array_length(json) - 1][1] = "nintendo";
		json = json_stringify(json);
		buffer_seek(buffer, buffer_seek_start, 1);
		buffer_write(buffer, buffer_string, json);
		buffer_save(buffer, "controller.onuc");
		buffer_delete(buffer);
	}
}
else if (step == 3)
{
	if (gamepad_button_check_pressed(global.gamepad, gp_face1))
	{
		global.controller_config = global.controller_config + "1";
		selection += 1;
	}
	if (gamepad_button_check_pressed(global.gamepad, gp_face2))
	{
		global.controller_config = global.controller_config + "2";
		selection += 1;
	}
	if (gamepad_button_check_pressed(global.gamepad, gp_face3))
	{
		global.controller_config = global.controller_config + "3";
		selection += 1;
	}
	if (gamepad_button_check_pressed(global.gamepad, gp_face4))
	{
		global.controller_config = global.controller_config + "4";
		selection += 1;
	}
	if (gamepad_button_check_pressed(global.gamepad, gp_start))
	{
		global.controller_config = global.controller_config + "5";
		selection += 1;
	}
	if (gamepad_button_check_pressed(global.gamepad, gp_select))
	{
		global.controller_config = global.controller_config + "6";
		selection += 1;
	}
	if (selection == 4)
	{
		step = 4;
		preconfigure_controller();
		json[array_length(json)][0] = gamepad_get_description(global.gamepad);
		json[array_length(json) - 1][1] = global.controller_config;
		json = json_stringify(json);
		buffer_seek(buffer, buffer_seek_start, 1);
		buffer_write(buffer, buffer_string, json);
		buffer_save(buffer, "controller.onuc");
		buffer_delete(buffer);
	}
}
else if (step == 2 || step == 4 || step == 5)
{
	if (gamepad_button_check_pressed(global.gamepad, gp_face1) || gamepad_button_check_pressed(global.gamepad, gp_face2) || gamepad_button_check_pressed(global.gamepad, gp_face3) || gamepad_button_check_pressed(global.gamepad, gp_face4))
		room_goto_next();
	if (gamepad_button_check_pressed(global.gamepad, gp_start))
		step = 7;
}
else if (step == 6)
{
	if (gamepad_button_check_pressed(global.gamepad, gp_face1) || gamepad_button_check_pressed(global.gamepad, gp_face2) || gamepad_button_check_pressed(global.gamepad, gp_face3) || gamepad_button_check_pressed(global.gamepad, gp_face4))
		step = 3;
}
else if (step == 7)
{
	if (gamepad_button_check_pressed(global.gamepad, gp_start))
		room_goto_next();
}
else if (step == 8 || step == 9)
{
	if (keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")))
		selection = 0;
	if (keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S")))
		selection = 1;
	if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(ord("Z")) || keyboard_check_pressed(ord("Y")))
	{
		if (selection == 1)
		{
			ini_open("ignore.ini");
			ini_write_real("Controller", "Valid", 1);
			ini_close();
		}
		room_goto_next();
	}
}
else if (step == 10)
{
	if (input_check_pressed("jump") || input_check_pressed("jumpmenu") || input_check_pressed("grapple") || input_check_pressed("face_a") || input_check_pressed("face_b") || input_check_pressed("face_x") || input_check_pressed("face_y") || input_check_pressed("pause"))
		room_goto_next();
}
