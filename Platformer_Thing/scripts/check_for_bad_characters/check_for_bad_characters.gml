function check_for_bad_characters(arg0)
{
	badchar = 0;
	arg0 = string_replace_all(arg0, "*", "¤");
	arg0 = string_replace_all(arg0, "?", "¤");
	arg0 = string_replace_all(arg0, "\\", "¤");
	arg0 = string_replace_all(arg0, "/", "¤");
	arg0 = string_replace_all(arg0, "|", "¤");
	arg0 = string_replace_all(arg0, "\"", "¤");
	arg0 = string_replace_all(arg0, ":", "¤");
	arg0 = string_replace_all(arg0, "<", "¤");
	arg0 = string_replace_all(arg0, ">", "¤");
	for (var i = 0; i < string_length(arg0); i++)
	{
		if (string_char_at(arg0, i) == "¤")
			badchar = 1;
	}
	return badchar;
}
