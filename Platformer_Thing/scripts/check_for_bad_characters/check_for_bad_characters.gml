function check_for_bad_characters(_string)
{
	badchar = false;
	_string = string_replace_all(_string, "*", "¤");
	_string = string_replace_all(_string, "?", "¤");
	_string = string_replace_all(_string, "\\", "¤");
	_string = string_replace_all(_string, "/", "¤");
	_string = string_replace_all(_string, "|", "¤");
	_string = string_replace_all(_string, "\"", "¤");
	_string = string_replace_all(_string, ":", "¤");
	_string = string_replace_all(_string, "<", "¤");
	_string = string_replace_all(_string, ">", "¤");
	for (var i = 0; i < string_length(_string); i++)
	{
		if (string_char_at(_string, i) == "¤")
			badchar = true;
	}
	return badchar;
}
