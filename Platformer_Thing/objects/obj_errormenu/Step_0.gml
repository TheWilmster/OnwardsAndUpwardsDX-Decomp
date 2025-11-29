if (input_check_pressed("jump") || input_check_pressed("jumpmenu"))
{
	if (global.missing == "dataload" || global.missing == "datasave" || global.missing == "generic")
	{
		if (os_type == os_windows)
		{
			directory_create("C:/Users/" + global.user + "/OnU Errors");
			error = file_text_open_write("C:/Users/" + global.user + "/OnU Errors/error_report_" + string(current_day) + string(current_month) + string(current_year) + "_at_" + string(current_hour) + string(current_minute) + string(current_second) + ".txt");
			if (error == -1)
			{
				show_message("Error saving error report.");
				game_end();
			}
			else
			{
				file_text_write_string(error, global.exception);
				file_text_close(error);
				game_end();
			}
		}
		else
		{
			directory_create(global.user + "/OnU/Errors");
			error = file_text_open_write(global.user + "/OnU/Errors/error_report_" + string(current_day) + string(current_month) + string(current_year) + "_at_" + string(current_hour) + string(current_minute) + string(current_second) + ".txt");
			if (error == -1)
			{
				show_message("Error saving error report.");
				game_end();
			}
			else
			{
				file_text_write_string(error, global.exception);
				file_text_close(error);
				game_end();
			}
		}
	}
	else
	{
		instance_destroy(obj_fade);
		instance_create_depth(0, 0, -1, obj_fade);
		alarm[0] = 30;
	}
}
if (keyboard_check_pressed(vk_f1))
{
	if (global.missing == "dataload" || global.missing == "datasave")
	{
		if (page == 2)
			page = 0;
		else
			page += 1;
	}
}
