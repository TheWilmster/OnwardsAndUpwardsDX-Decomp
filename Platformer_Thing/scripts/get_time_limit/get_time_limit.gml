function get_time_limit(arg0)
{
	minutes = 0;
	arg0 *= 10;
	while (arg0 >= 60)
	{
		arg0 -= 60;
		minutes += 1;
	}
	if (arg0 == 0)
		return string(minutes) + ":0" + string(arg0);
	else
		return string(minutes) + ":" + string(arg0);
}
