function draw_text_outline(arg0, arg1, arg2, arg3, arg4)
{
	draw_set_colour(arg3);
	draw_text(arg0 + 1, arg1, arg2);
	draw_text(arg0 - 1, arg1, arg2);
	draw_text(arg0, arg1 + 1, arg2);
	draw_text(arg0, arg1 - 1, arg2);
	draw_set_colour(arg4);
	draw_text(arg0, arg1, arg2);
}
