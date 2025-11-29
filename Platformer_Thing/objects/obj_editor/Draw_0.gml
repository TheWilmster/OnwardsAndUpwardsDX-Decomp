draw_sprite(spr_lily_walk, 0, x, y);
draw_set_colour(c_red);
draw_rectangle(floor(mouse_or_cursor_x() / 8) * 8, floor(mouse_or_cursor_y() / 8) * 8, (floor(mouse_or_cursor_x() / 8) * 8) + 7, (floor(mouse_or_cursor_y() / 8) * 8) + 7, false);
draw_set_colour(c_black);
draw_rectangle(-1024, -1024, -1, 2560, false);
draw_rectangle(2560, -1024, 4096, 2560, false);
draw_rectangle(-1024, -1024, 4096, 0, false);
draw_rectangle(-1024, 1536, 4096, 2560, false);
