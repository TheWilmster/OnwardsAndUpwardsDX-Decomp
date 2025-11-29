draw_set_colour(c_black);
draw_set_alpha(0.5);
draw_rectangle(0, 0, 160, 144, false);
draw_set_colour(c_white);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_font(global.font_normal);
draw_set_valign(fa_middle);
if (global.validated == 1)
	draw_text_ext(80, 8, "(Validated)", 8, 160);
if (legacy_level == 0)
{
	draw_set_font(fon_naming);
	if (string_length(global.description) > 250)
		draw_text_ext(80, 44, global.level_name + "\nDescription too long.", 8, 160);
	else
		draw_text_ext(80, 44, global.level_name + "\n" + global.description, 8, 160);
}
draw_set_font(global.font_normal);
draw_set_valign(fa_top);
if (legacy_level == 1)
	draw_text(80, 44, global.level_name + "\n\nThis level uses\nthe legacy format.\nIt can't be played\nin this version of\nthe game.");
