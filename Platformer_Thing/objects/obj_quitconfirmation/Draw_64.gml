draw_set_colour(c_black);
draw_rectangle(16, 48, 144, 80, false);
draw_set_colour(c_white);
draw_set_halign(fa_center);
if (selection == 0)
	draw_text(80, 48, "Sure you want\nto quit?\n[Yes]\nNo");
else
	draw_text(80, 48, "Sure you want\nto quit?\nYes\n[No]");
