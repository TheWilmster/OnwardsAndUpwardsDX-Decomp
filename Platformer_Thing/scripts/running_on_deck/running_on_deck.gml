function running_on_deck()
{
	if (input_player_get_gamepad() != -1)
		return 1;
	else
		return 0;
}
