if (using_on_screen_keyboard == 0)
	str = keyboard_string;
else if (instance_exists(obj_keyboard))
	str = obj_keyboard.my_string;
if (instance_exists(obj_keyboard))
{
	if (obj_keyboard.cancel == 1)
	{
		instance_destroy(obj_keyboard);
		alarm[1] = 1;
	}
}
if (instance_exists(obj_keyboard))
{
	if (obj_keyboard.done == 1)
	{
		string_replace_all(str, "\\", "X");
		string_replace_all(str, "\"", "X");
		string_replace_all(str, "\n", "");
		string_replace_all(str, "\n", "");
		if (os_type == os_windows)
		{
			string_replace_all(str, "*", "X");
			string_replace_all(str, "?", "X");
			string_replace_all(str, "/", "X");
			string_replace_all(str, "|", "X");
			string_replace_all(str, ":", "X");
			string_replace_all(str, "<", "X");
			string_replace_all(str, ">", "X");
		}
		alarm[0] = 1;
		instance_destroy(obj_keyboard);
	}
}
