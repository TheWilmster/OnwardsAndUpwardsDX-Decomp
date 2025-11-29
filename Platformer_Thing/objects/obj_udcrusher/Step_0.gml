y += (mode * spd);
if (place_meeting(x, y, obj_reverse))
{
	mode *= -1;
	if (place_meeting(x, y - 3, obj_player))
		obj_player.y -= mode * spd;
}
if (place_meeting(x, y - 3, obj_player))
	obj_player.y += mode * spd;
if (place_meeting(x - 3, y, obj_grapple_right))
	obj_grapple_right.y += mode * spd;
if (place_meeting(x + 3, y, obj_grapple_left))
	obj_grapple_left.y += mode * spd;
if (place_meeting(x, y + 3, obj_grapple_up))
	obj_grapple_up.y += mode * spd;
if (global.respawn_all_platforms == 1)
{
	x = xstart;
	y = ystart;
	mode = modestart;
}
if (image_xscale == 0.25)
	sprite_index = spr_brick2;
if (instance_exists(obj_editor))
{
	if (obj_editor.show_menu == 0 && obj_editor.show_tiles == 0 && global.selected_entity == id)
	{
		if (mouse_wheel_down() || (input_check_pressed("down") && running_on_deck() == 1))
		{
			global.validated = 0;
			if (attribute == 0)
			{
				if (modestart == 1)
					modestart = -1;
				else
					modestart = 1;
			}
			else if (attribute == 1)
			{
				if (spd == 1)
					spd = 2;
				else if (spd == 2)
					spd = 4;
				else
					spd = 1;
			}
		}
		else if (mouse_wheel_up() || (input_check_pressed("up") && running_on_deck() == 1))
		{
			global.validated = 0;
			if (attribute == 0)
			{
				if (modestart == 1)
					modestart = -1;
				else
					modestart = 1;
			}
			else if (attribute == 1)
			{
				if (spd == 1)
					spd = 4;
				else if (spd == 2)
					spd = 1;
				else
					spd = 2;
			}
		}
	}
}
if (tick == 0)
	tick = 1;
else
	tick = 0;
if (global.c_realx > x && global.c_realx < (x + 32) && global.c_realy > y && global.c_realy < (y + 32) && input_check_pressed("face_a"))
{
	if (instance_exists(obj_editor))
	{
		if (obj_editor.show_menu == 0 && obj_editor.show_tiles == 0)
		{
			if (global.selected_entity == id)
			{
				attribute += 1;
				if (attribute == 2)
					attribute = 0;
			}
			else
			{
				global.selected_entity = id;
			}
		}
	}
}
if (global.spin_objects == 1)
	image_angle += 1;
else
	image_angle = 0;
