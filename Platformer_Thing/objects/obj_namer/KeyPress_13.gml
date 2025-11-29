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
pressed_enter = 1;
alarm[0] = 1;
