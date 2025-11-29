draw_set_colour(c_white);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_font(global.font);
draw_text(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 56, "Press a key.\nTimeout: " + string(timeout));
