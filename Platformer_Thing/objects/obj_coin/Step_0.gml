if (instance_exists(obj_player))
{
	if (x > 0 && global.money_magnet == 1)
	{
		if (distance_to_object(obj_player) < 70)
		{
			direction = point_direction(x, y, obj_player.x, obj_player.y);
			speed = distance_to_object(obj_player) / 5;
			if (speed < 0.5)
				speed = 0.5;
		}
		else
		{
			speed = 0;
		}
	}
	if (place_meeting(x, y, obj_player) && obj_drawscreen.rewind == 0)
	{
		global.coins += 1;
		if (global.waugh == 0)
			audio_play_sound(sfx_coin, 0, 0);
		else
			audio_play_sound(sfx_waugh, 0, 0);
		x = -500;
	}
}
if (global.respawn_all_platforms == 1)
{
	image_index = 0;
	x = xstart;
}
depth = 99;
if (instance_exists(obj_editor))
{
	if (obj_editor.show_menu == 0 && obj_editor.show_tiles == 0 && global.selected_entity == id)
	{
		if (mouse_wheel_down() || (input_check_pressed("down") && running_on_deck() == true))
		{
			if (siz == 1)
				siz = 0;
			else
				siz = 1;
		}
		else if (mouse_wheel_up() || (input_check_pressed("up") && running_on_deck() == true))
		{
			if (siz == 1)
				siz = 0;
			else
				siz = 1;
		}
	}
}
if (tick == 0)
	tick = 1;
else
	tick = 0;
if (global.c_realx > x && global.c_realx < (x + 8) && global.c_realy > y && global.c_realy < (y + 8) && input_check_pressed("face_a"))
{
	if (instance_exists(obj_editor))
	{
		if (obj_editor.show_menu == 0 && obj_editor.show_tiles == 0)
			global.selected_entity = id;
	}
}
if (global.spin_objects == 1)
	image_angle += 1;
else
	image_angle = 0;
