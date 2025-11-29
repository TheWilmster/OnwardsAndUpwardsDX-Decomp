y = 160;
mode = 0;
transition = 0;
if (global.time_seconds < 10)
	global.time_seconds = "0" + string(global.time_seconds);
if (global.time_milliseconds < 10)
	global.time_milliseconds = "0" + string(round(global.time_milliseconds));
else
	global.time_milliseconds = round(global.time_milliseconds);
