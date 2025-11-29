draw_set_colour(c_black);
draw_rectangle(0, 0, 160, 144, false);
draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_set_font(global.font_normal);
if (mode == 0)
{
	draw_text(0, 0, "Enter level name\nto SAVE as:");
	draw_set_font(fon_naming);
	draw_text(0, 0, "\n\n" + str + "_.onul");
}
else if (mode == 1)
{
	draw_text(0, 0, "Enter level name\nto LOAD:");
	draw_set_font(fon_naming);
	draw_text(0, 0, "\n\n" + str + "_.onul");
}
else if (mode == 2)
{
	draw_text(0, 0, "Now loading...");
}
else if (mode == 3)
{
	draw_text_ext(0, 0, "Word wrap is on.\nEnter description:", 8, 160);
	draw_set_font(fon_naming);
	draw_text_ext(0, 0, "\n\n" + str + "_", 8, 160);
}
