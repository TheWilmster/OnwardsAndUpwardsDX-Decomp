// NO fucking idea what this function is used for -TheWilmster
function pluralise_word(_string, _condition, _default)
{
	if (_condition == 1)
	{
		return _string;
	}
	else
	{
		// why not just return _default? -TheWilmster
		_string = _default;
		return _string;
	}
}
