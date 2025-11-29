draw_set_colour(c_white);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_font(global.font_normal);
draw_set_valign(fa_middle);
draw_text_ext(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 72, "We're sorry but we're currently redoing the controller rebinding menu. Please come back later.", 8, 160);
draw_set_valign(fa_top);
