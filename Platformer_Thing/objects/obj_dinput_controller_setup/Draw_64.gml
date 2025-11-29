draw_set_font(global.font_normal);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_colour(c_white);
display_set_gui_size(160, 144);
if (step == 0)
{
	draw_text_ext(80, 72, "Loading...", 8, 160);
}
else if (step == 1)
{
	draw_text_ext(80, 72, "Unable to automatically detect this DirectInput controller's layout. Please identify its layout.\n\nPress the button labelled \"X.\"\n\nIf you don't have an \"X\" button, wait " + string(timeout) + " seconds to configure manually.", 8, 160);
}
else if (step == 2)
{
	draw_set_font(global.font);
	if (global.controller_config == "xbox")
		draw_text_ext(80, 72, "Xbox like controller\n\nThank you. You won't have to go through this process again unless you hook up a new controller.\n\nPress any button,\nor { to test.", 8, 160);
	else if (global.controller_config == "playstation")
		draw_text_ext(80, 72, "PlayStation controller\n\nThank you. You won't have to go through this process again unless you hook up a new controller.\n\nPress any button,\nor OPTIONS to test.", 8, 160);
	else if (global.controller_config == "nintendo")
		draw_text_ext(80, 72, "Switch controller\n\nThank you. You won't have to go through this process again unless you hook up a new controller.\n\nPress any button,\nor + to test.", 8, 160);
}
else if (step == 3)
{
	if (selection == 0)
		draw_text_ext(80, 72, "Other configuration\n\nPlease press the button that's used for\njumping:\n\n\n", 8, 160);
	else if (selection == 1)
		draw_text_ext(80, 72, "Other configuration\n\nPlease press the button that's used for\njumping: OK\ngrappling:\n\n", 8, 160);
	else if (selection == 2)
		draw_text_ext(80, 72, "Other configuration\n\nPlease press the button that's used for\njumping: OK\ngrappling: OK\npausing:\n", 8, 160);
	else if (selection == 3)
		draw_text_ext(80, 72, "Other configuration\n\nPlease press the button that's used for\njumping: OK\ngrappling: OK\npausing: OK\nrespawning:", 8, 160);
}
else if (step == 4)
{
	draw_text_ext(80, 72, "Custom controller configuration made\n\nThank you.\n\nPress any button.", 8, 160);
}
else if (step == 5)
{
	draw_set_font(global.font);
	if (global.controller_config == "xbox")
		draw_text_ext(80, 72, "Controller configuration has been automatically detected:\n\nXbox like controller\n\nPress any button,\nor { to test.", 8, 160);
	else if (global.controller_config == "playstation")
		draw_text_ext(80, 72, "Controller configuration has been automatically detected:\n\nPlayStation controller\n\nPress any button,\nor OPTIONS to test.", 8, 160);
	else if (global.controller_config == "nintendo")
		draw_text_ext(80, 72, "Controller configuration has been automatically detected:\n\nSwitch controller\n\nPress any button,\nor + to test.", 8, 160);
}
else if (step == 6)
{
	draw_text_ext(80, 72, "Hrm. No known controller has an \"X\" button in this position.\n\nPress any button to manually configure this controller.", 8, 160);
}
else if (step == 7)
{
	draw_set_font(global.font);
	draw_set_halign(fa_center);
	draw_set_valign(fa_top);
	draw_text_ext(80, 8, "Controller test;\npress " + return_controller_button_name(gp_start) + " to leave.", 8, 160);
	draw_set_halign(fa_left);
	if (gamepad_button_check(global.gamepad, gp_face1))
		draw_text(0, 48, return_controller_button_name(gp_face1));
	if (gamepad_button_check(global.gamepad, gp_face2))
		draw_text(16, 48, return_controller_button_name(gp_face2));
	if (gamepad_button_check(global.gamepad, gp_face3))
		draw_text(32, 48, return_controller_button_name(gp_face3));
	if (gamepad_button_check(global.gamepad, gp_face4))
		draw_text(48, 48, return_controller_button_name(gp_face4));
	if (gamepad_button_check(global.gamepad, gp_shoulderl))
		draw_text(64, 48, return_controller_button_name(gp_shoulderl));
	if (gamepad_button_check(global.gamepad, gp_shoulderr))
		draw_text(80, 48, return_controller_button_name(gp_shoulderr));
	if (gamepad_button_check(global.gamepad, gp_shoulderlb))
		draw_text(96, 48, return_controller_button_name(gp_shoulderlb));
	if (gamepad_button_check(global.gamepad, gp_shoulderrb))
		draw_text(128, 48, return_controller_button_name(gp_shoulderrb));
}
else if (step == 8)
{
	draw_set_colour(c_white);
	if (selection == 0)
		draw_text_ext(80, 72, "Controller support not found.\n\nIf you have a Debian-based distro, try typing this into a terminal, then restart the game:\n\nsudo apt install joystick\n\n[Continue]\nDon't show again", 8, 160);
	else
		draw_text_ext(80, 72, "Controller support not found.\n\nIf you have a Debian-based distro, try typing this into a terminal, then restart the game:\n\nsudo apt install joystick\n\nContinue\n[Don't show again]", 8, 160);
	draw_set_colour(c_yellow);
	draw_text_ext(80, 72, "\n\n\n\n\n\nsudo apt install joystick", 8, 160);
}
else if (step == 9)
{
	if (selection == 0)
		draw_text_ext(80, 72, "Hrm. Looks like your device doesn't support controllers...\n\n[Continue]\nDon't show again", 8, 160);
	else
		draw_text_ext(80, 72, "Hrm. Looks like your device doesn't support controllers...\n\nContinue\n[Don't show again]", 8, 160);
}
else if (step == 10)
{
	draw_text_ext(80, 72, "Pardon our dust, but we're currently trying out a new input system. Please let us know if anything breaks, thanks!\n\nIf everything goes well, the logo of the library will go here.\n\nPress Z / SPACE or (A)", 8, 160);
}
draw_set_valign(fa_top);
