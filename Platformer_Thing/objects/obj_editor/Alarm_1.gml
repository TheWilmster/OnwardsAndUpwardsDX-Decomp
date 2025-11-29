inst = instance_create_depth(0, 0, 0, obj_menu_revamped);
inst.starting_menu = -2;
global.selectionmenu = -1;
alarm[2] = 1;
accepting_input = 1;
if (global.coins != global.coins_to_collect)
	global.validated = 0;
else if (global.deaths > 0)
	global.validated = 0;
else if (global.validating_now == -1)
	global.validated = 0;
else
	global.validated = 1;
global.coins = 0;
global.deaths = 0;
global.validating_now = 0;
if (global.validated == 0)
	next_menu = 4;
else
	next_menu = 5;
