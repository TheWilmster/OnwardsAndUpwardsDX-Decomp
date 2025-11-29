if (recording == 1)
{
	show_message("Make sure your clipboard is empty before continuing");
	clipboard_set_text(data_left);
	show_message("Copied left data to clipboard");
	clipboard_set_text(data_right);
	show_message("Copied right data to clipboard");
	clipboard_set_text(data_up);
	show_message("Copied up data to clipboard");
	clipboard_set_text(data_jump);
	show_message("Copied jump data to clipboard");
	clipboard_set_text(data_jump_pressed);
	show_message("Copied jump pressed data to clipboard");
	clipboard_set_text(data_run);
	show_message("Copied run data to clipboard");
	clipboard_set_text(data_run_pressed);
	show_message("Copied run pressed data to clipboard");
	clipboard_set_text(data_run_released);
	show_message("Copied run released data to clipboard");
	game_end();
}
else
{
	global.coins = 0;
	room_restart();
}
