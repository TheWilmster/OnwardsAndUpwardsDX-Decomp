draw_set_colour(c_red);
draw_set_alpha(0.5);
draw_rectangle(0, 0, 160, 144, false);
draw_set_alpha(1);
draw_rectangle(16, 48, 144, 80, false);
draw_set_colour(c_white);
draw_set_halign(fa_center);
if (selection == 0)
	draw_text(80, 48, "Sure you want\nto delete?\n[Yes]\nNo");
else
	draw_text(80, 48, "Sure you want\nto delete?\nYes\n[No]");
