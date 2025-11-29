draw_set_alpha(1);
if (vis == 1)
{
	if (parasol_glide == 1)
	{
		if (xscl == 1)
			draw_sprite(spr_parasol, 0, x - 5, y);
		else
			draw_sprite(spr_parasol, 0, x + 4, y);
	}
	if (action == 1)
		draw_sprite_ext(spr_lily_walk, image_index, x, ceil(y), xscl, sign(grav), image_angle, -1, 1);
	else if (action == 2)
		draw_sprite_ext(spr_lily_walk, 0, x, ceil(y), xscl, sign(grav), image_angle, -1, 1);
	else if (action == 3)
		draw_sprite_ext(spr_lily_jump, image_index, x, y, xscl, sign(grav), image_angle, -1, 1);
	else if (action == 4)
		draw_sprite_ext(spr_lily_jump, image_index, x, y, xscl, sign(grav), image_angle, -1, 1);
	else if (action == 5)
		draw_sprite_ext(spr_lily_walk_push, image_index, x, ceil(y), xscl, sign(grav), image_angle, -1, 1);
	else if (action == 6)
		draw_sprite_ext(spr_lily_walk, 1, x, ceil(y), xscl, sign(grav), image_angle, -1, 1);
}
if (global.objective != 2)
{
	draw_sprite(spr_coin, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + 9);
	draw_set_font(global.font);
	draw_set_halign(fa_left);
	draw_text_outline(camera_get_view_x(view_camera[0]) + 8, camera_get_view_y(view_camera[0]) + 9, global.coins, 16777215, 0);
	if (global.objective == 1)
		draw_text_outline(camera_get_view_x(view_camera[0]) + 32, camera_get_view_y(view_camera[0]) + 9, "/" + string(global.objective_value), 16777215, 0);
}
else if (global.objective == 2)
{
	draw_sprite(spr_coinpink, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + 9);
	draw_set_font(global.font);
	draw_set_halign(fa_left);
	draw_text_outline(camera_get_view_x(view_camera[0]) + 8, camera_get_view_y(view_camera[0]) + 9, global.touched_save_points, 16777215, 0);
	draw_text_outline(camera_get_view_x(view_camera[0]) + 24, camera_get_view_y(view_camera[0]) + 9, "/" + string(global.objective_value), 16777215, 0);
}
if (took_too_long == 1)
{
	draw_text_outline(camera_get_view_x(view_camera[0]) + 1, camera_get_view_y(view_camera[0]) + 1, "Time: TOO LONG", 16777215, 0);
}
else
{
	if (global.time_seconds < 10)
		draw_text_outline(camera_get_view_x(view_camera[0]) + 1, camera_get_view_y(view_camera[0]) + 1, "Time: " + string(global.time_minutes) + ":0" + string(global.time_seconds), 16777215, 0);
	else
		draw_text_outline(camera_get_view_x(view_camera[0]) + 1, camera_get_view_y(view_camera[0]) + 1, "Time: " + string(global.time_minutes) + ":" + string(global.time_seconds), 16777215, 0);
	if (global.objective == 8)
	{
		draw_text_outline(camera_get_view_x(view_camera[0]) + 81, camera_get_view_y(view_camera[0]) + 1, "/" + get_time_limit(global.objective_value), 16777215, 0);
	}
	else if (global.time_minutes < 10)
	{
		if (global.time_milliseconds < 10)
			draw_text_outline(camera_get_view_x(view_camera[0]) + 81, camera_get_view_y(view_camera[0]) + 1, ".0" + string(round(global.time_milliseconds)), 16777215, 0);
		else
			draw_text_outline(camera_get_view_x(view_camera[0]) + 81, camera_get_view_y(view_camera[0]) + 1, "." + string(round(global.time_milliseconds)), 16777215, 0);
	}
	else if (global.time_milliseconds < 10)
	{
		draw_text_outline(camera_get_view_x(view_camera[0]) + 89, camera_get_view_y(view_camera[0]) + 1, ".0" + string(round(global.time_milliseconds)), 16777215, 0);
	}
	else
	{
		draw_text_outline(camera_get_view_x(view_camera[0]) + 89, camera_get_view_y(view_camera[0]) + 1, "." + string(round(global.time_milliseconds)), 16777215, 0);
	}
}
if (lives > 0)
{
	draw_sprite(spr_lily_walk, 0, camera_get_view_x(view_camera[0]) + 9, camera_get_view_y(view_camera[0]) + 136);
	draw_text_outline(camera_get_view_x(view_camera[0]) + 1, camera_get_view_y(view_camera[0]) + 135, "  x" + string(lives), 16777215, 0);
}
if (show_height == 1)
{
	if (room == rm_editor)
	{
		draw_set_halign(fa_center);
		if (running_on_deck() == 1)
		{
			draw_text_outline(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 68, "{ to stop", 16777215, 0);
			draw_text_outline(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 68, "{        ", 0, 16777215);
		}
		else
		{
			draw_text_outline(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 68, "ENTER to stop", 16777215, 0);
		}
	}
	else if (global.goal_flags == 1)
	{
		if (global.objective > 0)
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_text_outline(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 72, "Get the goal flag\nAND\n" + get_objective(global.objective), 16777215, 0);
			draw_set_valign(fa_top);
		}
		else
		{
			draw_set_halign(fa_center);
			draw_text_outline(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 68, "Get the goal flag", 16777215, 0);
		}
	}
	else if (global.goal_flags > 1)
	{
		if (global.objective > 0)
		{
			draw_set_halign(fa_center);
			draw_set_valign(fa_middle);
			draw_text_outline(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 72, "Get " + string(global.goal_flags) + " goal flags\nAND\n" + get_objective(global.objective), 16777215, 0);
			draw_set_valign(fa_top);
		}
		else
		{
			draw_set_halign(fa_center);
			draw_text_outline(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 68, "Get " + string(global.goal_flags) + " goal flags", 16777215, 0);
		}
	}
	else if (room != rm_custom_level)
	{
		draw_set_halign(fa_center);
		draw_text_outline(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 68, global.height, 16777215, 0);
	}
}
if (show_big_coins > 0)
{
	if (global.coin1 == 1)
		draw_sprite(spr_bigcoin, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + 128);
	if (global.coin2 == 1)
		draw_sprite(spr_bigcoin, 0, camera_get_view_x(view_camera[0]) + 17, camera_get_view_y(view_camera[0]) + 128);
	if (global.coin3 == 1)
		draw_sprite(spr_bigcoin, 0, camera_get_view_x(view_camera[0]) + 33, camera_get_view_y(view_camera[0]) + 128);
}
if (pause == 1)
{
	draw_set_colour(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0, 0, 2560, 1536, false);
	draw_set_colour(c_white);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	if (global.objective == 0)
	{
		draw_text(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 68, "Paused");
	}
	else
	{
		draw_set_valign(fa_middle);
		draw_text(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 72, "Paused\n\nSecondary\nobjective:\n\n" + get_objective(global.objective));
		draw_set_valign(fa_top);
	}
}
if (show_failed_objective == 1)
{
	draw_set_colour(c_red);
	draw_set_alpha(0.5);
	draw_rectangle(0, 0, 2560, 1536, false);
	draw_set_colour(c_white);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 72, "Secondary\nobjective\nfailed!\n\n" + get_objective(global.objective) + "\n\nPress any button\nto retry.");
	draw_set_valign(fa_top);
}
