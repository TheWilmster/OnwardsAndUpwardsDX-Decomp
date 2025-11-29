for (var i = 0; i < image_xscale; i++)
	draw_sprite(spr_brick, 0, x + (i * 16), y);
for (var i = 0; i < image_xscale; i++)
	draw_sprite(spr_brickspike1, 0, x + (i * 16), y - 8);
if (instance_exists(obj_editor))
{
	if (global.selected_entity == id)
	{
		if (tick == 1)
		{
			draw_set_colour(c_red);
			draw_rectangle(x, y, x + (16 * image_xscale), y + 8, false);
		}
		if (attribute == 0)
		{
			if (modestart == 1)
				draw_sprite(spr_modeindicators, 1, x + (image_xscale * 16), y);
			else
				draw_sprite(spr_modeindicators, 0, x + (image_xscale * 16), y);
		}
		else if (attribute == 1)
		{
			draw_sprite(spr_sizeindicators, (siz / 2) - 1, x + (image_xscale * 16), y);
		}
		else if (attribute == 2)
		{
			draw_sprite(spr_speedindicators, spd - 1, x + (image_xscale * 16), y);
		}
	}
}
