function check_for_bad_language(_string)
{
	swear = false;
	_string = string_lower(_string);
	_string += " ";
	_string = " " + _string;
	_string = string_replace_all(_string, "fuck", "¤");
	_string = string_replace_all(_string, " shit", "¤");
	_string = string_replace_all(_string, " bullshit ", "¤");
	_string = string_replace_all(_string, " ass", "¤");
	_string = string_replace_all(_string, " dumbass ", "¤");
	_string = string_replace_all(_string, " cunt ", "¤");
	_string = string_replace_all(_string, " tit ", "¤");
	_string = string_replace_all(_string, " tits ", "¤");
	_string = string_replace_all(_string, " titty ", "¤");
	_string = string_replace_all(_string, " titties ", "¤");
	_string = string_replace_all(_string, " penis ", "¤");
	_string = string_replace_all(_string, " penises ", "¤");
	_string = string_replace_all(_string, " pussy ", "¤");
	_string = string_replace_all(_string, " vagina", "¤");
	_string = string_replace_all(_string, " nigg", "¤");
	_string = string_replace_all(_string, " boob", "¤");
	_string = string_replace_all(_string, "damn", "¤");
	_string = string_replace_all(_string, " bitch", "¤");
	_string = string_replace_all(_string, " whore ", "¤");
	_string = string_replace_all(_string, " slut ", "¤");
	_string = string_replace_all(_string, " piss", "¤");
	_string = string_replace_all(_string, " rape", "¤");
	_string = string_replace_all(_string, " rapi", "¤");
	_string = string_replace_all(_string, " faggot", "¤");
	_string = string_replace_all(_string, " hitler ", "¤");
	_string = string_replace_all(_string, " abdl", "¤");
	_string = string_replace_all(_string, " bdsm ", "¤");
	_string = string_replace_all(_string, " bugger ", "¤");
	_string = string_replace_all(_string, " spastic ", "¤");
	_string = string_replace_all(_string, " bollock", "¤");
	_string = string_replace_all(_string, " fag ", "¤");
	for (var i = 0; i < string_length(_string); i++)
	{
		if (string_char_at(_string, i) == "¤")
			swear = true;
	}
	return swear;
}
