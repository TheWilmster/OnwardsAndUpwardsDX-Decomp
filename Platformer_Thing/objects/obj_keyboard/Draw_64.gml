draw_sprite_ext(spr_circle, 0, 8 + (16 * xselection), 100 + (9 * yselection), 1, 1, 0, make_colour_hsv(hue, 100, 255), 0.5);
draw_set_font(global.font_normal);
draw_set_valign(fa_top);
if (shift == 0)
	draw_text_ext(4, 96, "1 2 3 4 5 6 7 8 9 0\nq w e r t y u i o p\na s d f g h j k l \\\nz x c v b n m . _ ?", 9, 160);
else
	draw_text_ext(4, 96, "! @ # $ % ^ & ' ( )\nQ W E R T Y U I O P\nA S D F G H J K L \\\nZ X C V B N M - : ;", 9, 160);
draw_sprite(spr_keyboard_commands, 0, 0, 136);
draw_set_font(global.font);
draw_text(0, 136, input_verb_get_icon("face_a") + "   " + input_verb_get_icon("face_b") + "   " + input_verb_get_icon("face_x") + "   " + input_verb_get_icon("face_y") + "   " + input_verb_get_icon("pause"));
