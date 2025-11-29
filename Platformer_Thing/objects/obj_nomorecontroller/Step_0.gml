if (steam_overlay == 0 && checking == 1)
{
	if (keyboard_check_pressed(vk_space) || input_player_get_gamepad(0) > -1)
		instance_destroy();
}
