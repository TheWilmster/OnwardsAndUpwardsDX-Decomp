if (input_check_pressed("pause"))
{
	if (global.controlstop == 0)
	{
		if (room != rm_editor && room != rm_test)
		{
			if (!instance_exists(obj_endofcustomlevel))
			{
				if (pause == 0)
				{
					pause = 1;
					global.controlstopall = true;
					instance_deactivate_all(true);
					instance_activate_object(obj_drawscreen);
					instance_activate_object(input_controller_object);
				}
				else
				{
					pause = 0;
					global.controlstopall = false;
					instance_activate_all();
				}
			}
		}
	}
}
if (input_check_pressed("cancel") || input_check_pressed("respawn"))
{
	if (pause == 1)
	{
		audio_stop_all();
		room_goto(rm_intro);
	}
}
if (fall > 150)
{
	if (!steam_get_achievement("ACH_FALL"))
		steam_set_achievement("ACH_FALL");
	give_achievement(11);
}
if (pause == 1)
{
	key_run_released = input_check_released("grapple");
	if (key_run_released)
		run_key_released_while_paused = 1;
}
if (global.spin_objects == 1)
	image_angle += 1;
else
	image_angle = 0;
