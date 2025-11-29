timeout -= 1;
if (timeout == 0 && step == 1)
	step = 3;
else
	alarm[0] = 60;
