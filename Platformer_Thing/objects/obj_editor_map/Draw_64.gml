if (!surface_exists(map_surface))
{
	map_surface = surface_create(160, 96);
	map_ready = 0;
}
if (map_ready == 0)
{
	surface_set_target(map_surface);
	draw_clear_alpha(c_black, 0);
	draw_set_colour(c_black);
	draw_rectangle(0, 0, 160, 96, false);
	buffer_seek(map_data, buffer_seek_start, 0);
	draw_set_colour(c_lime);
	for (var i = 0; i < 96; i++)
	{
		for (var j = 0; j < 160; j++)
		{
			til = buffer_read(map_data, buffer_u16);
			if (til > 0)
				draw_rectangle(j, i, j + 0.5, i + 0.5, false);
		}
	}
	surface_reset_target();
	map_ready = 1;
}
else
{
	draw_surface(map_surface, 0, 24);
	switch (global.zoom)
	{
		case 1:
			draw_sprite(spr_view_highlight_4, image_index, obj_editor.x / 16, (obj_editor.y / 16) + 24);
			break;
		case 2:
			draw_sprite(spr_view_highlight_3, image_index, obj_editor.x / 16, (obj_editor.y / 16) + 23.5);
			break;
		case 3:
			draw_sprite(spr_view_highlight_2, image_index, obj_editor.x / 16, (obj_editor.y / 16) + 24);
			break;
		case 4:
			draw_sprite(spr_view_highlight, image_index, obj_editor.x / 16, (obj_editor.y / 16) + 23.5);
			break;
	}
}
