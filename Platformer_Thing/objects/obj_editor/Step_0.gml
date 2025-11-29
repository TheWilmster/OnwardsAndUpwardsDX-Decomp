global.respawn_all_platforms = 1;
if (global.zoom == 4 || global.zoom == 1)
{
	global.c_realx = (x + (cx * abs(global.zoom - 5))) - (320 / global.zoom);
	global.c_realy = (y + (cy * abs(global.zoom - 5))) - (288 / global.zoom);
}
else if (global.zoom == 2)
{
	global.c_realx = (x + (cx * 2)) - 160;
	global.c_realy = (y + (cy * 2)) - 144;
}
else if (global.zoom == 3)
{
	global.c_realx = (x + (cx * 1.35)) - 108;
	global.c_realy = (y + (cy * 1.35)) - 97.2;
}
camera_set_view_size(view_camera[0], 640 / global.zoom, 576 / global.zoom);
show_map = instance_exists(obj_editor_map);
deck = running_on_deck();
cx += lengthdir_x(cspeed, cdirection);
cy += lengthdir_y(cspeed, cdirection);
cdirection = input_direction(0, "stick_left", "stick_right", "stick_up", "stick_down");
cspeed = input_distance("stick_left", "stick_right", "stick_up", "stick_down") * 2;
if (input_check_pressed("cancel") && show_menu == 0 && show_tiles == 0)
{
	instance_create_depth(0, 0, depth, obj_quitconfirmation);
	instance_deactivate_object(obj_editor);
}
else if (input_check_pressed("respawn") && show_menu == 0 && show_tiles == 0 && deck == 1)
{
	instance_create_depth(0, 0, depth, obj_quitconfirmation);
	instance_deactivate_object(obj_editor);
}
if (show_menu == 0)
{
	shader_reset();
	if (lyr == 0)
	{
		layer_shader(layer_get_id("Collision"), -1);
		layer_shader(layer_get_id("Decor"), sdr_transparency);
	}
	else if (lyr == 1)
	{
		layer_shader(layer_get_id("Decor"), -1);
		layer_shader(layer_get_id("Collision"), sdr_transparency);
	}
	else if (lyr == 2)
	{
		layer_shader(layer_get_id("Collision"), -1);
		layer_shader(layer_get_id("Decor"), -1);
	}
	if (tile_mode == "fav")
	{
		for (var i = 0; i < 10; i++)
		{
			if (i == 0)
			{
				if (keyboard_check_pressed(ord(string(i))))
				{
					tile = fav_tiles[9];
					fav_selected = 9;
				}
			}
			else if (keyboard_check_pressed(ord(string(i))))
			{
				tile = fav_tiles[i - 1];
				fav_selected = i - 1;
			}
		}
		if (input_check_pressed("shoulder_l"))
		{
			if (fav_selected > 0)
			{
				tile = fav_tiles[fav_selected - 1];
				fav_selected -= 1;
			}
			else
			{
				tile = fav_tiles[9];
				fav_selected = 9;
			}
		}
		if (input_check_pressed("shoulder_r"))
		{
			if (fav_selected < 9)
			{
				tile = fav_tiles[fav_selected + 1];
				fav_selected += 1;
			}
			else
			{
				tile = fav_tiles[0];
				fav_selected = 0;
			}
		}
	}
	else
	{
		for (var i = 0; i < 10; i++)
		{
			if (i == 0)
			{
				if (keyboard_check_pressed(ord(string(i))))
				{
					tile = rec_tiles[9];
					rec_selected = 9;
				}
			}
			else if (keyboard_check_pressed(ord(string(i))))
			{
				tile = rec_tiles[i - 1];
				rec_selected = i - 1;
			}
		}
		if (input_check_pressed("shoulder_l"))
		{
			if (rec_selected > 0)
			{
				tile = rec_tiles[rec_selected - 1];
				rec_selected -= 1;
			}
			else
			{
				tile = rec_tiles[9];
				rec_selected = 9;
			}
		}
		if (input_check_pressed("shoulder_r"))
		{
			if (rec_selected < 9)
			{
				tile = rec_tiles[rec_selected + 1];
				rec_selected += 1;
			}
			else
			{
				tile = rec_tiles[0];
				rec_selected = 0;
			}
		}
	}
	if ((keyboard_check_pressed(189) && shown_tutorial == 1) || (input_check_pressed("face_y") && shown_tutorial == 1 && deck == 1))
	{
		if (tile_mode == "fav")
			tile_mode = "rec";
		else
			tile_mode = "fav";
	}
	if (show_map == 0)
	{
		if (input_check_pressed("editor_z") && tool == 0 && shown_tutorial == 1 && global.selected_entity == -4 && deck == 0)
		{
			if (lyr == 0)
				lyr = 1;
			else if (lyr == 1)
				lyr = 2;
			else
				lyr = 0;
		}
		else if (input_check_pressed("up") && tool == 0 && shown_tutorial == 1 && deck == 1 && global.selected_entity == -4 && !input_check("editor_2nd"))
		{
			if (lyr == 0)
				lyr = 2;
			else if (lyr == 1)
				lyr = 0;
			else
				lyr = 1;
		}
		else if (input_check_pressed("down") && tool == 0 && shown_tutorial == 1 && deck == 1 && global.selected_entity == -4 && !input_check("editor_2nd"))
		{
			if (lyr == 0)
				lyr = 1;
			else if (lyr == 1)
				lyr = 2;
			else
				lyr = 0;
		}
		if (input_check_pressed("up") && shown_tutorial == 1 && deck == 1 && input_check("editor_2nd"))
		{
			if (global.zoom < 4)
			{
				global.zoom += 1;
				show_debug_message(abs(global.zoom - 5));
			}
			else
			{
				global.show_error_message = 300;
				global.error_message = "Zoom is at maximum!";
				audio_play_sound(sfx_error, 0, 0);
			}
		}
		else if (input_check_pressed("down") && shown_tutorial == 1 && deck == 1 && input_check("editor_2nd"))
		{
			if (global.zoom > 1)
			{
				global.zoom -= 1;
				show_debug_message(abs(global.zoom - 5));
			}
			else
			{
				global.show_error_message = 300;
				global.error_message = "Zoom is at minimum!";
				audio_play_sound(sfx_error, 0, 0);
			}
		}
		if (input_check_pressed("up") && shown_tutorial == 1 && deck == 0)
		{
			if (global.zoom < 4)
			{
				global.zoom += 1;
				show_debug_message(abs(global.zoom - 5));
			}
			else
			{
				global.show_error_message = 300;
				global.error_message = "Zoom is at maximum!";
				audio_play_sound(sfx_error, 0, 0);
			}
		}
		else if (input_check_pressed("down") && shown_tutorial == 1 && deck == 0)
		{
			if (global.zoom > 1)
			{
				global.zoom -= 1;
				show_debug_message(abs(global.zoom - 5));
			}
			else
			{
				global.show_error_message = 300;
				global.error_message = "Zoom is at minimum!";
				audio_play_sound(sfx_error, 0, 0);
			}
		}
		if ((input_check_pressed("editor_x") && shown_tutorial == 1) || (input_check_pressed("face_b") && shown_tutorial == 1))
		{
			if (tool == 0 && global.selected_entity == -4)
			{
				if (show_tiles == 0)
					show_tiles = 1;
				else
					show_tiles = 0;
			}
		}
		if (input_check_pressed("editor_c") && shown_tutorial == 1 && deck == 0)
		{
			if (tool == 0)
			{
				tool = 1;
				show_tiles = 0;
			}
			else
			{
				tool = 0;
			}
		}
		else if (input_check_pressed("right") && tool == 0 && shown_tutorial == 1 && deck == 1)
		{
			tool = 1;
			show_tiles = 0;
		}
		else if (input_check_pressed("left") && tool == 1 && shown_tutorial == 1 && deck == 1)
		{
			tool = 0;
		}
	}
	if ((input_check_pressed("editor_v") && shown_tutorial == 1 && deck == 0) || (input_check_pressed("pause") && !input_check("editor_2nd") && shown_tutorial == 1 && deck == 1 && accepting_input == 1))
	{
		if (show_map == 0)
		{
			accepting_input = 0;
			alarm[0] = 2;
			global.time_milliseconds = 0;
			global.time_minutes = 0;
			global.time_seconds = 0;
			global.check_x = x;
			global.check_y = y;
			layer_shader(layer_get_id("Collision"), -1);
			layer_shader(layer_get_id("Decor"), -1);
			instance_create_layer(x, y, "Player", obj_player);
			instance_create_layer(x, y, "Player", obj_camera);
			layer_set_visible(layer_get_id("Grid"), 0);
			instance_deactivate_object(obj_editor);
		}
	}
	if (input_check_pressed("jumpmenu") || (input_check_pressed("face_x") && deck == 1 && !input_check("editor_2nd")))
	{
		if (global.vvvvvv_mode == 0)
		{
			if (show_map == 0)
			{
				if (shown_tutorial == 0)
				{
					allowed_to_place_tiles = 0;
					ini_open("ignore.ini");
					ini_write_real("Editor", "Valid", 1);
					ini_close();
					shown_tutorial = 1;
				}
				alarm[2] = 1;
				menu_selection = 0;
				next_menu = 1;
			}
		}
	}
	if (input_check_pressed("editor_b") || (input_check_pressed("face_x") && input_check("editor_2nd") && deck == 1))
	{
		if (show_map == 0 && show_menu == 0 && show_tiles == 0 && shown_tutorial == 1)
			instance_create_depth(0, 0, -1, obj_editor_map);
	}
	if ((input_check_pressed("editor_return") && accepting_input == 1 && deck == 0) || (input_check_pressed("pause") && input_check("editor_2nd") && deck == 1 && accepting_input == 1))
	{
		if (instance_exists(obj_player_start))
		{
			if (show_map == 0)
			{
				accepting_input = 0;
				alarm[0] = 2;
				global.time_milliseconds = 0;
				global.time_minutes = 0;
				global.time_seconds = 0;
				global.check_x = obj_player_start.x;
				global.check_y = obj_player_start.y;
				layer_shader(layer_get_id("Collision"), -1);
				layer_shader(layer_get_id("Decor"), -1);
				instance_create_layer(obj_player_start.x, obj_player_start.y, "Player", obj_player);
				instance_create_layer(obj_player_start.x, obj_player_start.y, "Player", obj_camera);
				layer_set_visible(layer_get_id("Grid"), 0);
				instance_deactivate_object(obj_editor);
			}
		}
		else
		{
			global.show_error_message = 300;
			global.error_message = "No Player Start!";
			audio_play_sound(sfx_error, 0, 0);
		}
	}
}
if (instance_exists(obj_menu_revamped))
{
	if (obj_menu_revamped.exiting == 1 && waiting == 0)
	{
		menu_selection = global.selectionmenu;
		alarm[2] = 30;
		waiting = 1;
	}
}
if (show_menu == 8)
{
	if (input_check_pressed("jump") || input_check_pressed("jumpmenu"))
	{
		next_menu = 7;
		alarm[2] = 1;
	}
}
if (music_track != global.music_track)
{
	music_track = global.music_track;
	audio_stop_all();
	switch (global.music_track)
	{
		case 1:
			audio_play_sound(bgm_intro, 0, 1);
			break;
		case 2:
			audio_play_sound(bgm_level1, 0, 1);
			break;
		case 3:
			audio_play_sound(bgm_level2, 0, 1);
			break;
		case 4:
			audio_play_sound(bgm_level3, 0, 1);
			break;
		case 5:
			audio_play_sound(bgm_level4, 0, 1);
			break;
		case 6:
			audio_play_sound(bgm_ending, 0, 1);
			break;
		case 7:
			audio_play_sound(bgm_runsettings, 0, 1);
			break;
	}
}
if (show_colour_picker == 1)
{
	if (input_check_pressed("pause") || keyboard_check_pressed(vk_enter))
	{
		show_colour_picker = 0;
		audio_play_sound(sfx_success, 0, 0);
		next_menu = 1;
		show_menu = 0;
		alarm[2] = 1;
	}
}
if (mouse_wheel_up() && tool == 1 && entity > 0 && global.selected_entity == -4)
	entity -= 1;
if (mouse_wheel_down() && tool == 1 && entity < 16 && global.selected_entity == -4)
	entity += 1;
if (input_check_pressed("up") && tool == 1 && entity > 0 && global.selected_entity == -4 && deck == 1)
	entity -= 1;
if (input_check_pressed("down") && tool == 1 && entity < 16 && global.selected_entity == -4 && deck == 1)
	entity += 1;
if (show_menu == 0 && show_tiles == 0)
{
	if (deck == 1)
	{
		direction = input_direction(0, "r_stick_left", "r_stick_right", "r_stick_up", "r_stick_down");
		speed = input_distance("r_stick_left", "r_stick_right", "r_stick_up", "r_stick_down") * 4;
	}
	else
	{
		if (input_check("stick_down") && y < 1536)
			y += 4;
		if (input_check("stick_up") && y > 0)
			y -= 4;
		if (input_check("stick_right") && x < 2560)
			x += 4;
		if (input_check("stick_left") && x > 0)
			x -= 4;
	}
	if (mouse_check_button_pressed(mb_middle))
	{
		init_mouse_x = mouse_x;
		init_mouse_y = mouse_y;
	}
	if (mouse_check_button(mb_middle))
	{
		x += (init_mouse_x - mouse_x);
		y += (init_mouse_y - mouse_y);
	}
}
if (x < 0)
	x = 0;
else if (x > 2560)
	x = 2560;
if (y < 0)
	y = 0;
else if (y > 1536)
	y = 1536;
if (cx < 0)
	cx = 0;
else if (cx > 160)
	cx = 160;
if (cy < 0)
	cy = 0;
else if (cy > 144)
	cy = 144;
camera_set_view_pos(view_camera[0], x - (640 / global.zoom / 2), y - (576 / global.zoom / 2));
if (show_map == 0)
{
	if (mouse_check_button_pressed(mb_left) || (input_check_pressed("face_a") && !input_check("editor_2nd")))
	{
		if (show_tiles == 1 && show_menu == 0)
		{
			click_valid = 0;
			if (deck == 1)
				tile = (((floor(cy / 8) - 1) * 20) - ((tiles_y / 8) * 20)) + floor(cx / 8);
			else
				tile = (((floor(device_mouse_y_to_gui(0) / 8) - 1) * 20) - ((tiles_y / 8) * 20)) + floor(device_mouse_x_to_gui(0) / 8);
			if (array_contains(fav_tiles, tile))
			{
				show_debug_message("tile's in the favourite array");
				fav_tile_set = 0;
				for (var i = 0; i < 10; i++)
				{
					if (fav_tile_set == 0)
					{
						if (fav_tiles[i] == tile)
						{
							show_debug_message("found it!");
							fav_selected = i;
							fav_tile_set = 1;
							break;
						}
					}
				}
				if (fav_tile_set == 0)
					fav_selected = -2;
			}
			if (array_contains(rec_tiles, tile))
			{
				rec_tile_set = 0;
				for (var i = 0; i < 10; i++)
				{
					if (rec_tile_set == 0)
					{
						if (rec_tiles[i] == tile)
						{
							rec_selected = 0;
							rec_tiles[i] = 0;
							rec_tile_set = 1;
							break;
						}
					}
				}
				if (rec_tile_set == 0)
					rec_selected = -2;
			}
			move_rec_tiles_down(tile);
			if (tile < 0)
				tile = 0;
			if (tile > 999)
				tile = 999;
		}
		else if (device_mouse_y_to_gui(0) > 136 && show_menu == 0 && global.vvvvvv_mode == 0)
		{
			click_valid = 0;
			if (shown_tutorial == 0)
			{
				allowed_to_place_tiles = 0;
				ini_open("ignore.ini");
				ini_write_real("Editor", "Valid", 1);
				ini_close();
				shown_tutorial = 1;
			}
			menu_selection = 0;
			alarm[2] = 1;
			next_menu = 1;
		}
		else if (tool == 1 && show_menu == 0 && !instance_position(mouse_or_cursor_x(), mouse_or_cursor_y(), all) && global.selected_entity == -4 && shown_tutorial == 1 && pressing_a == 0)
		{
			global.selected_entity = -4;
			global.validated = 0;
			click_valid = 0;
			switch (entity)
			{
				case 0:
					if (!instance_exists(obj_player_start))
					{
						instance_create_layer(floor(mouse_or_cursor_x() / 8) * 8, floor(mouse_or_cursor_y() / 8) * 8, "Instances", obj_player_start);
					}
					else
					{
						global.show_error_message = 300;
						global.error_message = "Only one is allowed!";
						audio_play_sound(sfx_error, 0, 0);
					}
					break;
				case 1:
					instance_create_layer(floor(mouse_or_cursor_x() / 8) * 8, floor(mouse_or_cursor_y() / 8) * 8, "Instances", obj_save);
					break;
				case 2:
					instance_create_layer(floor(mouse_or_cursor_x() / 8) * 8, floor(mouse_or_cursor_y() / 8) * 8, "Instances", obj_coin);
					break;
				case 3:
					instance_create_layer(floor(mouse_or_cursor_x() / 8) * 8, floor(mouse_or_cursor_y() / 8) * 8, "Instances", obj_lrstar);
					break;
				case 4:
					instance_create_layer(floor(mouse_or_cursor_x() / 8) * 8, floor(mouse_or_cursor_y() / 8) * 8, "Instances", obj_udstar);
					break;
				case 5:
					inst = instance_create_layer(floor(mouse_or_cursor_x() / 8) * 8, floor(mouse_or_cursor_y() / 8) * 8, "Instances", obj_lrplatform);
					inst.image_xscale = 2;
					break;
				case 6:
					inst = instance_create_layer(floor(mouse_or_cursor_x() / 8) * 8, floor(mouse_or_cursor_y() / 8) * 8, "Instances", obj_udplatform);
					inst.image_xscale = 2;
					break;
				case 7:
					instance_create_layer(floor(mouse_or_cursor_x() / 8) * 8, floor(mouse_or_cursor_y() / 8) * 8, "Instances", obj_lrcrusher);
					break;
				case 8:
					instance_create_layer(floor(mouse_or_cursor_x() / 8) * 8, floor(mouse_or_cursor_y() / 8) * 8, "Instances", obj_udcrusher);
					break;
				case 9:
					inst = instance_create_layer(floor(mouse_or_cursor_x() / 8) * 8, floor(mouse_or_cursor_y() / 8) * 8, "Instances", obj_udcrusher);
					inst.image_xscale = 0.25;
					break;
				case 10:
					inst = instance_create_layer(floor(mouse_or_cursor_x() / 8) * 8, floor(mouse_or_cursor_y() / 8) * 8, "Instances", obj_lrplatform_spiketop);
					inst.image_xscale = 2;
					break;
				case 11:
					inst = instance_create_layer(floor(mouse_or_cursor_x() / 8) * 8, floor(mouse_or_cursor_y() / 8) * 8, "Instances", obj_udplatform_spiketop);
					inst.image_xscale = 2;
					break;
				case 12:
					inst = instance_create_layer(floor(mouse_or_cursor_x() / 8) * 8, floor(mouse_or_cursor_y() / 8) * 8, "Instances", obj_lrplatform_spikebottom);
					inst.image_xscale = 2;
					break;
				case 13:
					inst = instance_create_layer(floor(mouse_or_cursor_x() / 8) * 8, floor(mouse_or_cursor_y() / 8) * 8, "Instances", obj_udplatform_spikebottom);
					inst.image_xscale = 2;
					break;
				case 14:
					instance_create_layer(floor(mouse_or_cursor_x() / 8) * 8, floor(mouse_or_cursor_y() / 8) * 8, "Instances", obj_reverse);
					break;
				case 15:
					instance_create_layer(floor(mouse_or_cursor_x() / 8) * 8, floor(mouse_or_cursor_y() / 8) * 8, "Instances", obj_goalflag);
					break;
				case 16:
					if (lives > 0)
					{
						instance_create_layer(floor(mouse_or_cursor_x() / 8) * 8, floor(mouse_or_cursor_y() / 8) * 8, "Instances", obj_life);
					}
					else
					{
						global.show_error_message = 300;
						global.error_message = "Lives are disabled!";
						audio_play_sound(sfx_error, 0, 0);
					}
					break;
			}
		}
		else if (show_menu == 0 && !instance_position(mouse_or_cursor_x(), mouse_or_cursor_y(), all))
		{
			click_valid = 1;
			global.selected_entity = -4;
		}
	}
	if ((mouse_check_button(mb_left) && shown_tutorial == 1) || (input_check("face_a") && shown_tutorial == 1 && !input_check("editor_2nd")))
	{
		show_debug_message(click_valid);
		if (show_tiles == 0 && tool == 0 && show_menu == 0 && click_valid == 1 && pressing_a == 0)
		{
			global.validated = 0;
			if (lyr == 0)
			{
				if (!instance_position(mouse_or_cursor_x(), mouse_or_cursor_y(), obj_level_entity))
				{
					tilemap_set(tm_collision, tile, floor(mouse_or_cursor_x() / 8), floor(mouse_or_cursor_y() / 8));
					if (instance_position(mouse_or_cursor_x(), mouse_or_cursor_y(), obj_die))
					{
						inst = instance_position(mouse_or_cursor_x(), mouse_or_cursor_y(), obj_die);
						instance_destroy(inst);
					}
				}
			}
			else if (lyr == 1)
			{
				if (!instance_position(mouse_or_cursor_x(), mouse_or_cursor_y(), obj_level_entity))
					tilemap_set(tm_decor, tile, floor(mouse_or_cursor_x() / 8), floor(mouse_or_cursor_y() / 8));
			}
			else if (lyr == 2)
			{
				if (!instance_position(mouse_or_cursor_x(), mouse_or_cursor_y(), obj_level_entity))
					instance_create_layer(floor(mouse_or_cursor_x() / 8) * 8, floor(mouse_or_cursor_y() / 8) * 8, "Instances", obj_die);
			}
		}
		else if (show_colour_picker == 1)
		{
			if (deck == 1)
			{
				if (cy > 32 && cy < 96)
				{
					if (cx > 7 && cx < 17)
						bg_red = (cy - 96) * 4 * -1;
					if (cx > 23 && cx < 33)
						bg_green = (cy - 96) * 4 * -1;
					if (cx > 39 && cx < 49)
						bg_blue = (cy - 96) * 4 * -1;
				}
			}
			else if (device_mouse_y_to_gui(0) > 32 && device_mouse_y_to_gui(0) < 96)
			{
				if (device_mouse_x_to_gui(0) > 7 && device_mouse_x_to_gui(0) < 17)
					bg_red = (device_mouse_y_to_gui(0) - 96) * 4 * -1;
				if (device_mouse_x_to_gui(0) > 23 && device_mouse_x_to_gui(0) < 33)
					bg_green = (device_mouse_y_to_gui(0) - 96) * 4 * -1;
				if (device_mouse_x_to_gui(0) > 39 && device_mouse_x_to_gui(0) < 49)
					bg_blue = (device_mouse_y_to_gui(0) - 96) * 4 * -1;
			}
		}
	}
	if (mouse_check_button_pressed(mb_right) || (input_check_pressed("face_a") && input_check("editor_2nd")))
	{
		if (show_tiles == 1 && show_menu == 0)
		{
			if (deck == 1)
			{
				favtile = (((floor(cy / 8) - 1) * 20) - ((tiles_y / 8) * 20)) + floor(cx / 8);
				if (favtile > 0 && favtile < 999)
					set_fav_tile(favtile);
			}
			else
			{
				favtile = (((floor(device_mouse_y_to_gui(0) / 8) - 1) * 20) - ((tiles_y / 8) * 20)) + floor(device_mouse_x_to_gui(0) / 8);
				if (favtile > 0 && favtile < 999)
					set_fav_tile(favtile);
			}
		}
		else
		{
			click_valid = 1;
		}
	}
	if ((mouse_check_button(mb_right) && shown_tutorial == 1) || (input_check("face_a") && input_check("editor_2nd") && shown_tutorial == 1))
	{
		if (show_tiles == 0 && tool == 0 && show_menu == 0 && click_valid == 1 && pressing_a == 0)
		{
			global.validated = 0;
			if (lyr == 0)
			{
				tilemap_set(tm_collision, 0, floor(mouse_or_cursor_x() / 8), floor(mouse_or_cursor_y() / 8));
			}
			else if (lyr == 1)
			{
				tilemap_set(tm_decor, 0, floor(mouse_or_cursor_x() / 8), floor(mouse_or_cursor_y() / 8));
			}
			else if (lyr == 2)
			{
				if (instance_position(mouse_or_cursor_x(), mouse_or_cursor_y(), obj_die))
				{
					inst = instance_position(mouse_or_cursor_x(), mouse_or_cursor_y(), obj_die);
					instance_destroy(inst);
				}
			}
		}
		else if (tool == 1 && show_tiles == 0 && show_menu == 0 && click_valid == 1 && pressing_a == 0)
		{
			global.validated = 0;
			if (instance_position(mouse_or_cursor_x(), mouse_or_cursor_y(), all))
			{
				inst = instance_position(mouse_or_cursor_x(), mouse_or_cursor_y(), all);
				if (inst.object_index != obj_editor && inst.object_index != obj_die)
				{
					instance_destroy(inst);
					global.selected_entity = -4;
				}
			}
		}
	}
}
if (pressing_a == 1 && !input_check("face_a"))
	pressing_a = 0;
