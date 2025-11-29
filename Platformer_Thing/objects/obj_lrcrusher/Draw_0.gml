draw_self();
if (instance_exists(obj_editor))
{
	if (global.selected_entity == id)
	{
		if (tick == 1)
		{
			draw_set_colour(c_red);
			draw_rectangle(x, y, x + 32, y + 32, false);
		}
		if (attribute == 0)
		{
			if (modestart == 1)
				draw_sprite(spr_modeindicators, 1, x + 32, y);
			else
				draw_sprite(spr_modeindicators, 0, x + 32, y);
		}
		else if (attribute == 1)
		{
			draw_sprite(spr_speedindicators, spd - 1, x + 32, y);
		}
	}
}
