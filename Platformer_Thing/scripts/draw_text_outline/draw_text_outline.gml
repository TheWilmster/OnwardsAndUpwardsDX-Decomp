function draw_text_outline(_x, _y, _string, _outline_color, _text_color)
{
	draw_set_colour(_outline_color);
	draw_text(_x + 1, _y, _string);
	draw_text(_x - 1, _y, _string);
	draw_text(_x, _y + 1, _string);
	draw_text(_x, _y - 1, _string);
	draw_set_colour(_text_color);
	draw_text(_x, _y, _string);
}
