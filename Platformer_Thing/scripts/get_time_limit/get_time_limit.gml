function get_time_limit(_tens_of_seconds)
{
	minutes = 0;
	_tens_of_seconds *= 10;
	while (_tens_of_seconds >= 60)
	{
		_tens_of_seconds -= 60;
		minutes += 1;
	}
	if (_tens_of_seconds == 0)
		return string(minutes) + ":0" + string(_tens_of_seconds);
	else
		return string(minutes) + ":" + string(_tens_of_seconds);
}
