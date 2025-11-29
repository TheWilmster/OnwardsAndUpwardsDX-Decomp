if (instance_exists(obj_player))
{
	if (mode < 2)
	{
		x = obj_player.x;
		y = obj_player.y;
	}
	else
	{
		if (global.objective == 7)
			obj_player.objective_failed = 1;
		obj_player.x = x;
		obj_player.y = y;
	}
	if (mode == 0)
	{
		image_yscale += 1;
		if (image_yscale == (10 * global.grapple_modifier))
			mode = 1;
	}
	else if (mode == 1)
	{
		image_yscale -= 1;
		if (image_yscale == 1)
			instance_destroy();
	}
	else if (mode == 2)
	{
		image_yscale -= 0.5;
		y -= 4;
		if (image_yscale < 1.1)
			mode = 3;
	}
	if (place_meeting(x, y, obj_collide_bottom))
	{
		inst = instance_place(x, y, obj_collide_bottom);
		if (mode == 0)
		{
			if (x < (inst.x + 0.5) || x > ((inst.x + (32 * inst.image_xscale)) - 0.5))
			{
				global.grappled = 0;
				global.grappled_right = 0;
				instance_destroy();
			}
			else
			{
				while (place_meeting(x, y, obj_collide_bottom))
					y += 1;
				y -= 1;
				global.grappled = 1;
				global.grappled_up = 1;
				mode = 2;
				obj_player.x = x;
				obj_player.y = y;
			}
		}
	}
	else if (tilemap_get_at_pixel(tilemap, x, y - (image_yscale * 8)))
	{
		if (mode == 0)
		{
			while (tilemap_get_at_pixel(tilemap, x, y - (image_yscale * 8)))
			{
				y += 1;
				image_yscale -= 0.125;
			}
			global.grappled = 1;
			global.grappled_up = 1;
			mode = 2;
			obj_player.x = x;
			obj_player.y = y;
		}
	}
	else if (mode == 2)
	{
		mode = 0;
		for (var i = 0; i < 16; i++)
		{
			y -= 1;
			image_yscale += 0.25;
			if (place_meeting(x, y - 2, obj_collide_bottom))
			{
				mode = 2;
				break;
			}
			else if (tilemap_get_at_pixel(tilemap, x, y - (image_yscale * 8)))
			{
				mode = 2;
				break;
			}
		}
		if (mode == 0)
		{
			show_debug_message("grapple destroyed");
			global.grappled = 0;
			global.grappled_up = 0;
			instance_destroy();
		}
	}
	if (global.grappled_up == 1 && mode == 3)
	{
		t1 = tilemap_get_at_pixel(tilemap, x + 8, y);
		t2 = tilemap_get_at_pixel(tilemap, x - 8, y);
		t3 = tilemap_get_at_pixel(tilemap, x, y - 8);
		if (place_meeting(x + 2, y + 8, obj_collide_all_around) || place_meeting(x - 2, y + 8, obj_collide_all_around) || t1 != 0 || t2 != 0)
		{
			global.grappled = 0;
			global.grappled_up = 0;
			instance_destroy();
		}
	}
}
