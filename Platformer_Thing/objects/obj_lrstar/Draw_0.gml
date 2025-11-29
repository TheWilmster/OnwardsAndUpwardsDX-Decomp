draw_set_alpha(0.2);
draw_sprite(spr_star, 0, yprevious4, y);
draw_set_alpha(0.4);
draw_sprite(spr_star, 0, yprevious3, y);
draw_set_alpha(0.6);
draw_sprite(spr_star, 0, yprevious2, y);
draw_set_alpha(0.8);
draw_sprite(spr_star, 0, xprevious, y);
draw_set_alpha(1);
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
		if (attribute == 0)
		{
			if (modestart == 1)
				draw_sprite(spr_modeindicators, 1, x + 8, y);
			else
				draw_sprite(spr_modeindicators, 0, x + 8, y);
		}
		else if (attribute == 1)
		{
			draw_sprite(spr_speedindicators, spd - 1, x + 8, y);
		}
	}
}
