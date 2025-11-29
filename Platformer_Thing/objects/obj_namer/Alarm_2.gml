if (mode == 2)
{
	alarm[0] = 1;
}
else if (input_player_get_gamepad() != -1)
{
	using_on_screen_keyboard = 1;
	instance_create_depth(0, 0, depth - 1, obj_keyboard);
}
