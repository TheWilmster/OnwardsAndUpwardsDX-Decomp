if (ghost_coin == 1 || siz == 1)
{
	if (room == rm_editor || room == rm_custom_level)
	{
		if (global.bg_red < 128 && global.bg_green < 128 && global.bg_blue < 128)
			draw_sprite(spr_ghostcoin, image_index, xstart, ystart);
		else
			draw_sprite_ext(spr_ghostcoin, image_index, xstart, ystart, 1, 1, image_angle, c_black, 1);
	}
	else
	{
		draw_sprite(spr_ghostcoin, image_index, xstart, ystart);
	}
}
draw_self();
if (instance_exists(obj_editor))
{
	if (global.selected_entity == id)
	{
		if (tick == 1)
		{
			draw_set_colour(c_red);
			draw_rectangle(x, y, x + 8, y + 8, false);
		}
		if (ghost_coin == 1 || siz == 1)
			draw_sprite(spr_ghostindicator, 1, x + 8, y);
		else
			draw_sprite(spr_ghostindicator, 0, x + 8, y);
	}
}
