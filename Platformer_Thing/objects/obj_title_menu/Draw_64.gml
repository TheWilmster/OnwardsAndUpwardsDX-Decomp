draw_set_colour(c_black);
draw_set_alpha(0.5);
draw_rectangle(0, 0, 160, 144, false);
draw_set_colour(c_white);
draw_set_alpha(1);
if (perfect == 1 || global.cloud_perfect == 1)
	draw_sprite(spr_titleanim2, 0, 0, 0);
else
	draw_sprite(spr_titleanim, 0, 0, 0);
