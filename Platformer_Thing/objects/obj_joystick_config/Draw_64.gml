if (showing == 1)
{
	if (input_player_get_gamepad_type() == "switch joycon left" || input_player_get_gamepad_type() == "switch joycon right")
		draw_set_font(global.font_nintendo_joycon);
	else
		draw_set_font(global.font);
	display_set_gui_size(160, 144);
	draw_set_colour(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0, 0, 160, 144, false);
	draw_set_alpha(1);
	draw_set_colour(c_white);
	draw_set_halign(fa_left);
	draw_text(0, 24, "Jump: " + input_verb_get_icon("jump") + "\nGrapple: " + input_verb_get_icon("grapple") + "\nQuit: " + input_verb_get_icon("pause") + "\nRespawn: " + input_verb_get_icon("respawn"));
}
