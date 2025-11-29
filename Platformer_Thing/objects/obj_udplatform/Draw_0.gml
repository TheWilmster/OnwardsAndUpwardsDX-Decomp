draw_self();
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
				draw_sprite(spr_modeindicators, 3, x + (image_xscale * 16), y);
			else
				draw_sprite(spr_modeindicators, 2, x + (image_xscale * 16), y);
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
