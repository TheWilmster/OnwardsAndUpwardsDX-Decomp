function check_for_bad_language(arg0)
{
	swear = 0;
	arg0 = string_lower(arg0);
	arg0 += " ";
	arg0 = " " + arg0;
	arg0 = string_replace_all(arg0, "fuck", "¤");
	arg0 = string_replace_all(arg0, " shit", "¤");
	arg0 = string_replace_all(arg0, " bullshit ", "¤");
	arg0 = string_replace_all(arg0, " ass", "¤");
	arg0 = string_replace_all(arg0, " dumbass ", "¤");
	arg0 = string_replace_all(arg0, " cunt ", "¤");
	arg0 = string_replace_all(arg0, " tit ", "¤");
	arg0 = string_replace_all(arg0, " tits ", "¤");
	arg0 = string_replace_all(arg0, " titty ", "¤");
	arg0 = string_replace_all(arg0, " titties ", "¤");
	arg0 = string_replace_all(arg0, " penis ", "¤");
	arg0 = string_replace_all(arg0, " penises ", "¤");
	arg0 = string_replace_all(arg0, " pussy ", "¤");
	arg0 = string_replace_all(arg0, " vagina", "¤");
	arg0 = string_replace_all(arg0, " nigg", "¤");
	arg0 = string_replace_all(arg0, " boob", "¤");
	arg0 = string_replace_all(arg0, "damn", "¤");
	arg0 = string_replace_all(arg0, " bitch", "¤");
	arg0 = string_replace_all(arg0, " whore ", "¤");
	arg0 = string_replace_all(arg0, " slut ", "¤");
	arg0 = string_replace_all(arg0, " piss", "¤");
	arg0 = string_replace_all(arg0, " rape", "¤");
	arg0 = string_replace_all(arg0, " rapi", "¤");
	arg0 = string_replace_all(arg0, " faggot", "¤");
	arg0 = string_replace_all(arg0, " hitler ", "¤");
	arg0 = string_replace_all(arg0, " abdl", "¤");
	arg0 = string_replace_all(arg0, " bdsm ", "¤");
	arg0 = string_replace_all(arg0, " bugger ", "¤");
	arg0 = string_replace_all(arg0, " spastic ", "¤");
	arg0 = string_replace_all(arg0, " bollock", "¤");
	arg0 = string_replace_all(arg0, " fag ", "¤");
	for (var i = 0; i < string_length(arg0); i++)
	{
		if (string_char_at(arg0, i) == "¤")
			swear = 1;
	}
	return swear;
}
