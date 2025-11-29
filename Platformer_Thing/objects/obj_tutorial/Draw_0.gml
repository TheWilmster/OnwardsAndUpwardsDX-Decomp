draw_set_colour(c_white);
draw_set_halign(fa_left);
if (input_player_get_gamepad_type() == "switch joycon left" || input_player_get_gamepad_type() == "switch joycon right")
	draw_set_font(global.font_nintendo_joycon);
else
	draw_set_font(global.font);
draw_text(x, y, text);
