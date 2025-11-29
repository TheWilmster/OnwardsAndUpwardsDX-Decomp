display_set_gui_size(160, 144);
draw_set_font(global.font_normal);
if (dizzy_mode == 1)
{
	if (global.flip_screen == 0)
		draw_sprite_pos(spr_screen, 0, topleft_x, 0, topleft_x + 160, 0, btmleft_x + 160, 144, btmleft_x, 144, 1);
	else
		draw_sprite_pos(spr_screen, 0, topleft_x + 160, 0, topleft_x, 0, btmleft_x, 144, btmleft_x + 160, 144, 1);
}
if (global.blind_spot == 1)
{
	draw_set_colour(c_black);
	draw_circle(circx, circy, 20, false);
}
if (you_are_an_idiot == 1)
{
	for (var i = 0; i < 5; i++)
		draw_sprite_ext(spr_screen, 0, screen_x[i], screen_y[i], 0.125, 0.125, 0, c_white, 1);
}
if (vhold == 1)
{
	for (var i = 0; i < 5; i++)
	{
		draw_sprite_ext(spr_screen, 0, 0, vhold_screen1y, 0.25, 0.25, 0, c_white, 1);
		draw_sprite_ext(spr_screen, 0, 0, vhold_screen2y, 0.25, 0.25, 0, c_white, 1);
	}
}
if (touch_fuzzy_mode == 1)
{
	for (var i = 0; i < 21; i++)
	{
		surface_copy(dizzy_surf[i], i * -64, 0, application_surface);
		draw_surface_ext(dizzy_surf[i], i * 16, fuzzy[i], 0.25, 0.25, 0, c_white, 1);
	}
}
if (show_random_chars == 1)
{
	for (var i = 0; i < start_putting_random_chars_on_screen; i++)
	{
		draw_set_colour(c_black);
		draw_rectangle(characters_x[i] * 8, characters_y[i] * 8, (characters_x[i] * 8) + 7.5, (characters_y[i] * 8) + 7.5, false);
		draw_set_colour(c_white);
		draw_set_halign(fa_left);
		draw_text(characters_x[i] * 8, characters_y[i] * 8, characters_text[i]);
	}
}
if (show_confirmation > 0)
{
	draw_set_colour(c_black);
	draw_rectangle(0, 136, 160, 144, false);
	draw_set_valign(fa_bottom);
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_text(80, 144, "Screenshot saved!");
	draw_set_valign(fa_top);
}
if (show_steam_message > 0)
{
	draw_set_colour(c_red);
	draw_rectangle(0, 136, 160, 144, false);
	draw_set_valign(fa_bottom);
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_text(80, 144, "Steam init failed!");
	draw_set_valign(fa_top);
}
if (global.show_error_message > 0)
{
	draw_set_colour(c_red);
	draw_rectangle(0, 136, 160, 144, false);
	draw_set_valign(fa_bottom);
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_text(80, 144, global.error_message);
	draw_set_valign(fa_top);
}
if (global.show_notification_message > 0)
{
	draw_set_colour(c_black);
	draw_rectangle(0, 136, 160, 144, false);
	draw_set_valign(fa_bottom);
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
	draw_text(80, 144, global.notification_message);
	draw_set_valign(fa_top);
}
if (keyboard_check_pressed(vk_f8) || input_check_pressed("debug"))
{
	if (is_debug_overlay_open() == 0)
	{
		display_set_gui_size(640, 576);
		show_debug_overlay(1);
	}
	else
	{
		show_debug_overlay(0);
	}
}
