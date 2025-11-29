draw_set_font(global.font_normal);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (show_tiles == 1)
{
	draw_set_colour(c_black);
	draw_rectangle(0, 0, 160, 144, false);
	draw_set_colour(c_white);
	draw_sprite(spr_custom_level_tileset, 0, 0, tiles_y + 8);
	draw_sprite(spr_tileborder, -1, floor(tile % 20) * 8, (floor(tile / 20) * 8) + 8 + tiles_y);
	for (var i = 0; i < 10; i++)
	{
		if (fav_tiles[i] != 0)
			draw_sprite(spr_tileborder2, -1, floor(fav_tiles[i] % 20) * 8, (floor(fav_tiles[i] / 20) * 8) + 8 + tiles_y);
	}
}
else
{
	if (tile_mode == "fav")
	{
		draw_set_colour(c_aqua);
		draw_rectangle(0 + (16 * fav_selected), 0, 16 + (16 * fav_selected), 16, false);
		draw_set_colour(c_white);
		for (var i = 0; i < 10; i++)
			draw_tile(ts_tileset2, fav_tiles[i], 0, 4 + (16 * i), 4);
		if (deck == 1 && input_check("editor_2nd"))
			draw_text_outline(8, 16, "              Erase", 0, 16777215);
		else
			draw_text_outline(8, 16, "          Favourite", 0, 16777215);
	}
	else
	{
		draw_set_colour(c_red);
		draw_rectangle(0 + (16 * rec_selected), 0, 16 + (16 * rec_selected), 16, false);
		draw_set_colour(c_white);
		for (var i = 0; i < 10; i++)
			draw_tile(ts_tileset2, rec_tiles[i], 0, 4 + (16 * i), 4);
		if (deck == 1 && input_check("editor_2nd"))
			draw_text_outline(8, 16, "              Erase", 0, 16777215);
		else
			draw_text_outline(8, 16, "             Recent", 0, 16777215);
	}
	draw_text_outline(8, 8, "1 2 3 4 5 6 7 8 9 0", 0, 16777215);
	draw_set_colour(c_black);
	if (global.vvvvvv_mode == 0)
	{
		if (deck == 0)
		{
			if (device_mouse_y_to_gui(0) > 136)
			{
				draw_set_alpha(1);
				draw_rectangle(0, 136, 160, 144, false);
				draw_set_colour(c_white);
				draw_text(76, 136, "^");
				draw_text(76, 140, "^");
			}
			else
			{
				draw_set_alpha(0.5);
				draw_rectangle(0, 140, 160, 144, false);
				draw_set_colour(c_white);
			}
		}
		else
		{
			draw_set_font(global.font);
			if (input_player_get_gamepad_type() == "switch joycon left" || input_player_get_gamepad_type() == "switch joycon right")
				draw_set_font(global.font_nintendo_joycon);
			draw_text_outline(0, 136, input_verb_get_icon("face_x") + " - Menu", 0, 16777215);
			draw_set_font(global.font_normal);
		}
	}
}
draw_set_alpha(1);
if (show_tiles == 0)
{
	if (tool == 0)
	{
		if (lyr == 0)
			draw_text_outline(0, 16, "Collision", 0, 16777215);
		else if (lyr == 1)
			draw_text_outline(0, 16, "Background", 0, 16777215);
		else
			draw_text_outline(0, 16, "Spikes", 0, 16777215);
	}
	else
	{
		draw_text_outline(0, 16, "Entity:", 0, 16777215);
		switch (entity)
		{
			case 0:
				draw_text_outline(0, 25, "Player Start", 0, 16777215);
				break;
			case 1:
				draw_text_outline(0, 25, "Save Point", 0, 16777215);
				break;
			case 2:
				draw_text_outline(0, 25, "Coin", 0, 16777215);
				break;
			case 3:
				draw_text_outline(0, 25, "Star (L/R)", 0, 16777215);
				break;
			case 4:
				draw_text_outline(0, 25, "Star (U/D)", 0, 16777215);
				break;
			case 5:
				draw_text_outline(0, 25, "Platform (L/R)", 0, 16777215);
				break;
			case 6:
				draw_text_outline(0, 25, "Platform (U/D)", 0, 16777215);
				break;
			case 7:
				draw_text_outline(0, 25, "Cloud (L/R)", 0, 16777215);
				break;
			case 8:
				draw_text_outline(0, 25, "Cloud (U/D)", 0, 16777215);
				break;
			case 9:
				draw_text_outline(0, 25, "Sideways Plat (U/D)", 0, 16777215);
				break;
			case 10:
				draw_text_outline(0, 25, "Plat+Spike Up (L/R)", 0, 16777215);
				break;
			case 11:
				draw_text_outline(0, 25, "Plat+Spike Up (U/D)", 0, 16777215);
				break;
			case 12:
				draw_text_outline(0, 25, "Plat+Spike Down(L/R)", 0, 16777215);
				break;
			case 13:
				draw_text_outline(0, 25, "Plat+Spike Down(U/D)", 0, 16777215);
				break;
			case 14:
				draw_text_outline(0, 25, "Reverser", 0, 16777215);
				break;
			case 15:
				draw_text_outline(0, 25, "Goal Flag", 0, 16777215);
				break;
			case 16:
				draw_text_outline(0, 25, "Extra Life", 0, 16777215);
				break;
		}
	}
}
else if (deck == 1)
{
	draw_set_font(global.font);
	if (input_player_get_gamepad_type() == "switch joycon left" || input_player_get_gamepad_type() == "switch joycon right")
		draw_set_font(global.font_nintendo_joycon);
	draw_text(0, 0, "Fav: hold ^, press " + input_verb_get_icon("face_a"));
	draw_set_font(global.font_normal);
}
else
{
	draw_text(0, 0, "Right click to fav.");
}
if (show_menu == 1)
{
	draw_set_colour(c_black);
	draw_rectangle(0, 0, 160, 144, false);
	draw_set_colour(c_white);
	draw_set_halign(fa_left);
	if (global.selectionmenu == 6)
	{
		if (global.validated == 0)
		{
			draw_set_colour(c_red);
			draw_text_ext(0, 4, "\n\n\nNot validated", 8, 160);
		}
		else
		{
			draw_set_colour(c_lime);
			draw_text_ext(0, 4, "\n\n\nValidated!", 8, 160);
		}
	}
}
else if (show_menu == 2)
{
	draw_set_colour(c_black);
	draw_rectangle(0, 0, 160, 144, false);
	draw_set_colour(c_white);
	draw_set_halign(fa_left);
	draw_set_font(global.font_normal);
	if (global.selectionmenu == 2)
	{
		if (global.lives == 0)
			draw_text_ext(0, 4, "\n\n\n\nCurrent setting: OFF", 8, 160);
		else
			draw_text_ext(0, 4, "\n\n\n\nCurrent setting: " + string(global.lives), 8, 160);
	}
}
else if (show_menu == 3)
{
	draw_set_colour(c_black);
	draw_rectangle(0, 0, 160, 144, false);
	draw_set_colour(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_ext(0, 4, "Ready to validate your level?\n\nYou must complete your level by collecting all goal flags and coins without dying.", 8, 160);
}
else if (show_menu == 4)
{
	draw_set_colour(c_black);
	draw_rectangle(0, 0, 160, 144, false);
	draw_set_colour(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_ext(0, 4, "Validation failed!\n\nYou must complete your level by collecting all goal flags and coins without dying.\n\nWant to retry?", 8, 160);
}
else if (show_menu == 5)
{
	draw_set_colour(c_black);
	draw_rectangle(0, 0, 160, 144, false);
	draw_set_colour(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_ext(0, 4, "Level validated!\n\nIf you wish to edit your level further, you'll need to re-validate.\n\nSave your level now!", 8, 160);
}
else if (show_menu == 6)
{
	draw_set_colour(c_black);
	draw_rectangle(0, 0, 160, 144, false);
	draw_set_colour(c_white);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_ext(0, 4, "Unable to validate your level as you are missing one of the following objects:\nPlayer Start\nGoal Flag", 8, 160);
}
else if (show_menu == 7)
{
	draw_set_colour(c_black);
	draw_rectangle(0, 0, 160, 144, false);
	draw_set_colour(c_white);
	draw_set_halign(fa_center);
}
else if (show_menu == 8)
{
	draw_set_colour(c_black);
	draw_rectangle(0, 0, 160, 144, false);
	draw_set_colour(c_white);
	draw_set_halign(fa_left);
	draw_set_font(global.font);
	switch (menu_selection)
	{
		case 0:
			if (deck == 1)
			{
				if (input_player_get_gamepad_type() == "switch joycon left" || input_player_get_gamepad_type() == "switch joycon right")
					draw_set_font(global.font_nintendo_joycon);
				draw_text_ext(0, 0, "Welcome to the editor. To start, try holding " + input_verb_get_icon("face_a") + " to place some tiles down. You can also hold " + input_verb_get_icon("face_a") + " while holding ^ or _ to remove tiles.\n\nUse the Right Stick to move around the room, and the Left Stick to move your cursor. Hold ^ or _ and press " + input_verb_get_icon("face_x") + " to see a map of your level.", 8, 160);
			}
			else
			{
				draw_text_ext(0, 0, "Welcome to the editor. To start, try left-clicking to place some tiles down. You can also right-click to remove tiles.\n\nUse the WASD keys or middle mouse button to move around the room. Press B to see a map of your level.", 8, 160);
			}
			break;
		case 1:
			if (deck == 1)
				draw_text_ext(0, 0, "The editor has three layers to work with: Collision, Background and Spikes. Collision will be the tiles that Lily will run into, while Background is just for decoration. Spikes can be placed over any background tile to make it deadly to the touch. Use UP and DOWN on the pad to switch layers.", 8, 160);
			else
				draw_text_ext(0, 0, "The editor has three layers to work with: Collision, Background and Spikes. Collision will be the tiles that Lily will run into, while Background is just for decoration. Spikes can be placed over any background tile to make it deadly to the touch. Press Z to switch layers.", 8, 160);
			break;
		case 2:
			if (deck == 1)
			{
				if (input_player_get_gamepad_type() == "switch joycon left" || input_player_get_gamepad_type() == "switch joycon right")
					draw_set_font(global.font_nintendo_joycon);
				draw_text_ext(0, 0, "Press " + input_verb_get_icon("face_b") + " to open the tile palette, from there, tap to select a new tile. It'll go into the recents toolbar. You can also favourite tiles by holding ^ or _ and tapping, then switching to the favourites toolbar by pressing " + input_verb_get_icon("face_y") + ". Press " + input_verb_get_icon("face_b") + " again to exit the palette.", 8, 160);
			}
			else
			{
				draw_text_ext(0, 0, "Press X to open the tile palette, from there, left-click to select a new tile. It'll go into the recents toolbar. You can also favourite tiles by right-clicking, then switching to the favourites toolbar by pressing \"-\". Press X again to exit the palette.", 8, 160);
			}
			break;
		case 3:
			if (deck == 1)
			{
				if (input_player_get_gamepad_type() == "switch joycon left" || input_player_get_gamepad_type() == "switch joycon right")
					draw_set_font(global.font_nintendo_joycon);
				draw_text_ext(0, 0, "Press RIGHT on the pad to enter the entity editor. Press " + input_verb_get_icon("face_a") + " to place entities, hold ^ or _ and press " + input_verb_get_icon("face_a") + " to delete entities, and use UP/DOWN on the pad to choose the entity type. Hover over an entity and press " + input_verb_get_icon("face_a") + ", then press UP/DOWN on the pad to modify its attributes. Press " + input_verb_get_icon("face_a") + " again to change the attribute.", 8, 160);
			}
			else
			{
				draw_text_ext(0, 0, "Press C to enter the entity editor. You can left-click to place entities, right-click to delete entities, and scroll to choose the entity type to place. You may notice bubbles above some entities, these are attributes. Click that entity to select it, and scroll to modify the attribute. Click to change the attribute to modify.", 8, 160);
			}
			break;
		case 4:
			if (deck == 1)
				draw_text_ext(0, 0, "You may playtest in two different ways. Press " + input_verb_get_icon("pause") + " to playtest from the position Lily is on the screen, or press " + input_verb_get_icon("pause") + " while holding ^ or _ to playtest from where the Player Start entity is. While playtesting, you may press " + input_verb_get_icon("pause") + " to go back to the editor at any time.", 8, 160);
			else
				draw_text_ext(0, 0, "You may playtest in two different ways. Press V to playtest from the position Lily is on the screen, or press ENTER to playtest from where the Player Start entity is. While playtesting, you may press ENTER to go back to the editor at any time.", 8, 160);
			break;
		case 5:
			draw_text_ext(0, 0, "To validate a level, you'll need a Player Start object and at least one Goal Flag. Then you'll be tasked with completing your level while collecting all coins without dying -- this is to ensure the player can achieve a perfect score on your level.", 8, 160);
			break;
		case 6:
			draw_set_font(global.font_normal);
			if (steam_utils_is_steam_running_on_steam_deck() == 1)
				draw_text_ext(0, 0, "You may share levels by uploading them to the Steam Workshop. Others will be able to subscribe to your level and download it onto their system, then play it.\n\nValidated levels are tagged as such so they can be found easily.", 8, 160);
			else if (os_type == os_windows)
				draw_text_ext(0, 0, "You may share levels in two ways. Either through Steam Workshop or by sharing the .ONUL file manually. Your locally stored levels are located at C:/Users/(name)/OnU/ Levels/. Ask the recipient to place the level file in this same folder, then they can play your level.", 8, 160);
			else
				draw_text_ext(0, 0, "You may share levels in two ways. Either through Steam Workshop or by sharing the .ONUL file manually. Your locally stored levels are located at ~/OnU/Levels/. Ask the recipient to place the level file in this same folder, then they can play your level.", 8, 160);
			break;
		case 7:
			draw_text_ext(0, 0, "...how'd you manage this?", 8, 160);
			break;
	}
	draw_set_halign(fa_left);
}
else if (show_menu == 9)
{
	draw_set_colour(c_black);
	draw_rectangle(0, 0, 160, 144, false);
	draw_set_colour(c_white);
	draw_set_halign(fa_left);
	draw_set_font(global.font_normal);
	switch (global.selectionmenu)
	{
		case 0:
			if (global.objective_value == 0)
				draw_text_ext(0, 4, "Require Lily to collect all coins to unlock the goal flag.", 8, 160);
			else
				draw_text_ext(0, 4, "Require Lily to collect " + string(global.objective_value) + " coin(s) to unlock the goal flag.", 8, 160);
			break;
		case 1:
			if (global.objective_value == 0)
				draw_text_ext(0, 4, "Require Lily to touch all save points to unlock the goal flag.", 8, 160);
			else
				draw_text_ext(0, 4, "Require Lily to touch " + string(global.objective_value) + " save point(s) to unlock the goal flag.", 8, 160);
			break;
		case 2:
			draw_text_ext(0, 4, "Forbid Lily from jumping.", 8, 160);
			break;
		case 3:
			draw_text_ext(0, 4, "Forbid Lily from landing after a fall.", 8, 160);
			break;
		case 4:
			draw_text_ext(0, 4, "Forbid Lily from gliding.", 8, 160);
			break;
		case 5:
			draw_text_ext(0, 4, "Forbid Lily from grappling.", 8, 160);
			break;
		case 6:
			draw_text_ext(0, 4, "Forbid Lily from touching any moving entity.", 8, 160);
			break;
		case 7:
			if (global.objective_value == 0)
				draw_text_ext(0, 4, "Enforce a 0:00 time limit.", 8, 160);
			else
				draw_text_ext(0, 4, "Enforce a " + get_time_limit(global.objective_value) + " time limit.", 8, 160);
			break;
		case 8:
			draw_text_ext(0, 4, "Remove the secondary objective.", 8, 160);
			break;
	}
}
if (show_colour_picker == 1)
{
	draw_set_colour(c_black);
	draw_rectangle(0, 0, 160, 144, false);
	draw_set_colour(c_white);
	if (deck == 1)
	{
		draw_set_font(global.font);
		draw_text(0, 0, "Use these bars to\nadjust the\nbackground colour.\n" + input_verb_get_icon("pause") + " when done.");
		draw_set_font(global.font_normal);
	}
	else
	{
		draw_text(0, 0, "Use these bars to\nadjust the\nbackground colour.\nENTER when done.");
	}
	draw_rectangle_colour(8, 32, 16, 96, c_red, c_red, c_black, c_black, false);
	draw_rectangle(7, 96 + (-bg_red / 4), 17, 96 + (-bg_red / 4) + 1, false);
	draw_rectangle_colour(24, 32, 32, 96, c_lime, c_lime, c_black, c_black, false);
	draw_rectangle(23, 96 + (-bg_green / 4), 33, 96 + (-bg_green / 4) + 1, false);
	draw_rectangle_colour(40, 32, 48, 96, c_blue, c_blue, c_black, c_black, false);
	draw_rectangle(39, 96 + (-bg_blue / 4), 49, 96 + (-bg_blue / 4) + 1, false);
	draw_set_colour(make_colour_rgb(bg_red, bg_green, bg_blue));
	draw_rectangle(80, 40, 120, 80, false);
}
if (shown_tutorial == 0)
{
	draw_set_colour(c_black);
	draw_rectangle(16, 32, 144, 112, false);
	draw_set_colour(c_white);
	draw_set_halign(fa_left);
	draw_set_font(global.font);
	if (deck == 1)
	{
		if (input_player_get_gamepad_type() == "switch joycon left" || input_player_get_gamepad_type() == "switch joycon right")
			draw_set_font(global.font_nintendo_joycon);
		draw_text_ext(16, 32, "Welcome to the editor! Is this your first time? You'll find help topics in the menu.\nPress " + input_verb_get_icon("face_x") + " to open it.", 8, 128);
	}
	else
	{
		draw_text_ext(16, 32, "Welcome to the editor! Is this your first time? You'll find help topics in the menu.\nHover over the bottom of the screen and click to open it.", 8, 128);
	}
	draw_set_halign(fa_center);
}
if ((show_menu == 0 && deck == 1 && show_map == 0) || (show_menu == 1 && show_colour_picker == 1 && deck == 1))
	draw_sprite(spr_cursor, 0, cx, cy);
if (show_map == 1)
{
	draw_set_font(global.font_normal);
	draw_set_colour(c_green);
	draw_rectangle(0, 0, 160, 144, false);
	draw_set_halign(fa_center);
	draw_text_outline(80, 8, global.level_name, 0, 16777215);
	draw_text_outline(80, 68, "Map lost!", 0, 16777215);
	if (deck == 1)
	{
		draw_set_font(global.font);
		if (input_player_get_gamepad_type() == "switch joycon left" || input_player_get_gamepad_type() == "switch joycon right")
			draw_set_font(global.font_nintendo_joycon);
		draw_text_outline(80, 128, "Press " + input_verb_get_icon("face_x") + " to exit", 0, 16777215);
	}
	else
	{
		draw_text_outline(80, 128, "Press B to exit", 0, 16777215);
	}
}
