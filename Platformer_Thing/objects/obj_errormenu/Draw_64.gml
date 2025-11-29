if (page == 1)
{
	display_set_gui_size(320, 288);
	draw_set_font(fon_main);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_ext(0, 0, global.exception + "\n\n\nProblematic file: " + global.whatfailed + "\n*** PRESS F1 FOR STACK TRACE ***", 12, 320);
	draw_set_font(global.font_normal);
}
else if (page == 2)
{
	display_set_gui_size(320, 288);
	draw_set_font(fon_main);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_ext(0, 0, global.stack, 12, 320);
	draw_set_font(global.font_normal);
}
