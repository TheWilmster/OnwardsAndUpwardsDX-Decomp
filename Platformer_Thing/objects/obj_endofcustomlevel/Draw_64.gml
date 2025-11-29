if (input_player_get_gamepad_type() == "switch joycon left" || input_player_get_gamepad_type() == "switch joycon right")
	draw_set_font(global.font_nintendo_joycon);
else
	draw_set_font(global.font);
draw_set_colour(c_white);
draw_rectangle(0, 0, 160, 144, false);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
if (input_player_get_gamepad() != -1)
{
	draw_set_colour(c_black);
	draw_text(80, 72, "Deaths: " + string(global.deaths) + "\nCoins: " + string(global.coins) + "/" + string(global.coins_to_collect) + "\nTime: " + string(global.time_minutes) + ":" + string(global.time_seconds) + "." + string(global.time_milliseconds) + "\n\nPress  .");
	draw_text_outline(80, 72, "\n\n\n\n      " + input_verb_get_icon("jump") + " ", 0, 16777215);
}
else
{
	draw_set_colour(c_black);
	draw_text(80, 72, "Deaths: " + string(global.deaths) + "\nCoins: " + string(global.coins) + "/" + string(global.coins_to_collect) + "\nTime: " + string(global.time_minutes) + ":" + string(global.time_seconds) + "." + string(global.time_milliseconds) + "\n\nPress SPACEBAR.");
}
draw_set_valign(fa_top);
draw_set_colour(c_black);
draw_text_ext(80, 4, "CONGRATULATIONS!\nYou beat this custom level!", 8, 160);
draw_set_halign(fa_left);
