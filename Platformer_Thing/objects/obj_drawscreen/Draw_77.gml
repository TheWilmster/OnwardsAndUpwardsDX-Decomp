if (global.flip_screen == 1)
{
	application_surface_draw_enable(0);
	if (surface_exists(flip_surf))
	{
		surface_copy(flip_surf, 0, 0, application_surface);
		if (shrinking > 0)
			draw_surface_ext(flip_surf, 640 - shrink_offset, shrink_offset, -shrinking, shrinking, 0, c_white, 1);
		else
			draw_surface_ext(flip_surf, 640, 0, -1, 1, 0, c_white, 1);
	}
	else
	{
		flip_surf = surface_create(640, 576);
	}
}
else if (shrinking > 0)
{
	if (surface_exists(shrink_surf))
	{
		application_surface_draw_enable(0);
		surface_copy(shrink_surf, 0, 0, application_surface);
		draw_surface_ext(shrink_surf, shrink_offset, shrink_offset, shrinking, shrinking, 0, c_white, 1);
	}
	else
	{
		shrink_surf = surface_create(640, 576);
		draw_surface_ext(shrink_surf, shrink_offset, shrink_offset, shrinking, shrinking, 0, c_white, 1);
	}
}
else
{
	application_surface_draw_enable(1);
}
if (dizzy_mode == 1 || you_are_an_idiot == 1 || vhold == 1)
{
	if (surface_exists(screen_surf))
	{
		surface_copy(screen_surf, 0, 0, application_surface);
	}
	else
	{
		screen_surf = surface_create(640, 576);
		surface_copy(screen_surf, 0, 0, application_surface);
	}
	if (sprite_exists(spr_screen))
		sprite_delete(spr_screen);
	if (shrinking > 0)
		spr_screen = sprite_create_from_surface(screen_surf, shrink_offset, shrink_offset, 640 * shrinking, 576 * shrinking, false, false, 320, 288);
	else
		spr_screen = sprite_create_from_surface(screen_surf, 0, 0, 640, 576, false, false, 0, 0);
}
