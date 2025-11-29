if (take_snapshot == 1)
{
	screen_save("screen.png");
	sprite_replace(spr_perfect, "screen.png", 1, 0, 0, 0, 0);
	file_delete("screen.png");
	take_snapshot = 0;
}
if (show_snapshot > 0)
{
	draw_sprite_ext(spr_perfect, 0, 0, 0, 0.25, 0.25, 0, c_white, show_snapshot);
	show_snapshot -= 0.01;
}
if (frozen_trick > 0)
	draw_sprite_ext(spr_perfect, 0, 0, 0, 0.25, 0.25, 0, c_white, 1);
if (screen_burn == 1)
	draw_sprite_ext(spr_burnfx, 0, 0, 0, 0.25, 0.25, 0, c_white, 0.25);
