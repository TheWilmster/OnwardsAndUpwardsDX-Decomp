if (!place_meeting(x, y + 2, obj_collide_bottom) && !tilemap_get_at_pixel(tilemap, x, y + 33))
	y += 2;
