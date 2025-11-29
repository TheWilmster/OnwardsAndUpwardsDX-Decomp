draw_set_colour(c_white);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_font(global.font_normal);
draw_set_valign(fa_middle);
if (global.super_chaos_mode == 0)
	draw_text_ext(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 72, "Notice:\n\nThe Workshop may contain content not appropriate for children.\n\nCaution is advised.", 8, 160);
else
	draw_text_ext(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 72, "WARNING!!!\n\nYou've enabled SUPER CHAOS MODE. This mode is designed to be a living nightmare. Not even I expect you to beat this mode. Also, potential epilepsy warning.\n\nIf you're sure you're ready to proceed, press any button.", 8, 160);
draw_set_valign(fa_top);
