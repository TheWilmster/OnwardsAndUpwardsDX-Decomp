display_set_gui_size(160, 144);
draw_set_colour(c_black);
draw_rectangle(0, 0, 160, 144, false);
draw_set_colour(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(global.font_normal);
if (steam_overlay == 1)
	draw_text(80, 72, "Game paused;\nSteam overlay\nis open\n\nClose it to\ncontinue");
else
	draw_text(80, 72, "Controller lost\n\nInsert a\ncontroller\nor press SPACE\nto continue\nwithout");
draw_set_valign(fa_top);
