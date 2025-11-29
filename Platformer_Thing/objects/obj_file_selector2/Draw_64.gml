draw_set_colour(c_black);
draw_set_alpha(0.5);
draw_rectangle(0, 0, 160, 144, false);
draw_set_colour(c_blue);
draw_rectangle(0, 92, 160, 100, false);
draw_set_alpha(1);
draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_set_font(global.font_normal);
draw_text(0, 4, "Choose screenshot.");
for (var i = 0; i < (array_length(files) + 1); i++)
{
	if (i == array_length(files))
		draw_text(0, ((8 * i) - (8 * selection)) + 96, "(Go back)");
	else
		draw_text(0, ((8 * i) - (8 * selection)) + 96, files_truncated[i]);
}
if (loading == 0 && scr != -1)
	draw_sprite_ext(scr, 0, 40, 8, scale, scale, 0, c_white, 1);
draw_set_valign(fa_top);
