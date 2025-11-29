draw_set_halign(fa_left);
draw_set_font(global.font);
draw_set_colour(c_white);
draw_text(0, y + 168, "KraftPunk - Composer\n\n PureKnix - Levels");
if (input_player_get_gamepad() != -1)
	draw_text(0, (other_y + 168) - 48, "  Press L Stick to\n take a screenshot.");
else
	draw_text(0, (other_y + 168) - 48, "   F2: Screenshot\n\n   F4: Fullscreen");
