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
		image_xscale += 1;
		if (image_xscale == (10 * global.grapple_modifier))
			mode = 1;
	}
	else if (mode == 1)
	{
		image_xscale -= 1;
		if (image_xscale == 1)
			instance_destroy();
	}
	else if (mode == 2)
	{
		image_xscale -= 0.5;
		x += 4;
		if (image_xscale < 1.1)
			mode = 3;
	}
	if (instance_place(x, y, obj_collide_all_around))
	{
		inst = instance_place(x, y, obj_collide_all_around);
		if (mode == 0)
		{
			if (y < (inst.y + 0.5) || y > (inst.y + 31.5))
			{
				global.grappled = 0;
				global.grappled_right = 0;
				instance_destroy();
			}
			else
			{
				while (place_meeting(x, y, obj_collide_all_around))
					x -= 1;
				x += 1;
				global.grappled = 1;
				global.grappled_right = 1;
				mode = 2;
				obj_player.x = x;
				obj_player.y = y;
			}
		}
	}
	else if (tilemap_get_at_pixel(tilemap, x + (image_xscale * 8), y))
	{
		if (mode == 0)
		{
			while (tilemap_get_at_pixel(tilemap, x + (image_xscale * 8), y))
				x -= 1;
			x += 1;
			global.grappled = 1;
			global.grappled_right = 1;
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
			x += 1;
			if (place_meeting(x + 2, y, obj_collide_all_around))
			{
				mode = 2;
				break;
			}
			else if (place_meeting(x + 2, y - 2, obj_collide_all_around))
			{
				mode = 2;
				y -= 2;
				break;
			}
			else if (place_meeting(x + 2, y + 2, obj_collide_all_around))
			{
				mode = 2;
				y += 2;
				break;
			}
			else if (tilemap_get_at_pixel(tilemap, x + (image_xscale * 8), y))
			{
				mode = 2;
				break;
			}
		}
		if (mode == 0)
		{
			global.grappled = 0;
			global.grappled_right = 0;
			instance_destroy();
		}
	}
	if (global.grappled_right == 1 && mode == 3)
	{
		t1 = tilemap_get_at_pixel(tilemap, x + 8, y);
		t2 = tilemap_get_at_pixel(tilemap, x - 8, y);
		t3 = tilemap_get_at_pixel(tilemap, x, y - 8);
		if (place_meeting(x - 8, y - 2, obj_collide_all_around) || t3 != 0)
		{
			global.grappled_right = 0;
			global.grappled = 0;
			instance_destroy();
		}
		else if (place_meeting(x + 2, y, obj_collide_all_around) && t1 != 0)
		{
			global.grappled_right = 0;
			global.grappled = 0;
			instance_destroy();
		}
	}
}
if (image_xscale > 10)
	show_debug_message("RIGHT grapple went too far (Threshold is 10 vs. " + string(image_xscale) + ")");
