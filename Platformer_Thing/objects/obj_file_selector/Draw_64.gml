draw_set_font(global.font_normal);
draw_set_colour(c_black);
draw_set_alpha(0.5);
draw_rectangle(0, 0, 160, 144, false);
draw_set_colour(c_blue);
draw_rectangle(0, 76, 160, 84, false);
draw_set_alpha(1);
draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_middle);
if (mode == 0)
{
	draw_text(0, 4, "Showing local levels");
	draw_set_font(fon_naming);
	for (var i = 0; i < (array_length(files) + 3); i++)
	{
		if (i == (array_length(files) + 2))
			draw_text(0, ((8 * i) - (8 * selection)) + 80, "(Go back)");
		else if (i == (array_length(files) + 1))
			draw_text(0, ((8 * i) - (8 * selection)) + 80, "(New level)");
		else if (i == array_length(files))
			draw_text(0, ((8 * i) - (8 * selection)) + 80, "(Workshop)");
		else
			draw_text(0, ((8 * i) - (8 * selection)) + 80, files_truncated[i]);
	}
}
else
{
	draw_text(0, 4, "Showing Steam levels");
	draw_set_font(fon_naming);
	for (var i = 0; i < (array_length(steam_files) + 3); i++)
	{
		if (i == (array_length(steam_files) + 2))
			draw_text(0, ((8 * i) - (8 * selection)) + 80, "(Go back)");
		else if (i == (array_length(steam_files) + 1))
			draw_text(0, ((8 * i) - (8 * selection)) + 80, "(New level)");
		else if (i == array_length(steam_files))
			draw_text(0, ((8 * i) - (8 * selection)) + 80, "(Your levels)");
		else
			draw_text(0, ((8 * i) - (8 * selection)) + 80, steam_files_truncated[i]);
	}
}
draw_set_valign(fa_top);
