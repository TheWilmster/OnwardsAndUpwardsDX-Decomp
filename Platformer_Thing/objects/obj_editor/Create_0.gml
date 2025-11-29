depth = 98;
tm_collision = layer_tilemap_get_id("Collision");
tm_decor = layer_tilemap_get_id("Decor");
init_mouse_x = 0;
init_mouse_y = 0;
waiting = 0;
global.validated = 0;
global.preserve_flags = 1;
global.low_gravity = 0;
global.validating_now = 0;
global.level_name = "Untitled";
global.description = "";
global.objective = 0;
global.objective_value = 0;
ini_open("ignore.ini");
shown_tutorial = ini_read_real("Editor", "Valid", 0);
ini_close();
pressing_a = 0;
deck = 0;
click_valid = 0;
next_menu = 0;
cdirection = 0;
cspeed = 0;
cx = 80;
cy = 72;
global.c_realx = 1280;
global.c_realy = 768;
if (running_on_deck())
	deck = 1;
global.selected_entity = -4;
global.no_death_mode = 0;
global.invincible_invincibility = 0;
global.jump_modifier = 1;
global.speed_modifier = 1;
global.grapple_modifier = 1;
global.money_magnet = 0;
global.flight = 0;
global.vvvvvv_mode = 0;
global.chaos_mode = 0;
global.flip_screen = 0;
global.spin_screen = 0;
global.invisible_map = 0;
global.blind_spot = 0;
global.invert_controls = 0;
global.cheats = 0;
lives = 0;
fav_tiles = [];
fav_selected = 0;
rec_tiles = [];
rec_selected = 0;
array_push(rec_tiles, 41);
tile_mode = global.starting_tile_mode;
fav_tile_set = 0;
rec_tile_set = 0;
menu_selection = 0;
global.music_track = 0;
repeat (10)
{
	array_push(fav_tiles, 0);
	array_push(rec_tiles, 0);
}
if (room == rm_custom_level)
{
	path = global.level;
	success = load_level(path);
	if (success == 1)
	{
		window_set_caption("Onward and Upward! DX");
		audio_stop_all();
		layer_background_blend(layer_background_get_id(layer_get_id("Background")), make_colour_rgb(bg_red, bg_green, bg_blue));
		global.bg_red = bg_red;
		global.bg_green = bg_green;
		global.bg_blue = bg_blue;
		global.music_track = music_track;
		switch (music_track)
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
		if (!instance_exists(obj_goalflag))
		{
			global.missing = "goal";
			room_goto(rm_error);
		}
		if (instance_exists(obj_player_start))
		{
			instance_create_layer(obj_player_start.x, obj_player_start.y, "Player", obj_player);
			instance_create_layer(obj_player_start.x, obj_player_start.y, "Player", obj_camera);
			global.coins_to_collect = instance_number(obj_coin);
			instance_destroy();
		}
		else
		{
			global.missing = "start";
			room_goto(rm_error);
		}
	}
}
else if (room == rm_editor)
{
	show_tiles = 0;
	show_menu = 0;
	tool = 0;
	lyr = 0;
	entity = 0;
	tiles_y = 0;
	tile = 41;
	music_track = 0;
	show_colour_picker = 0;
	bg_red = 0;
	bg_green = 127;
	bg_blue = 255;
	selection = 0;
	x = 1280;
	y = 768;
	layer_background_blend(layer_background_get_id(layer_get_id("Background")), make_colour_rgb(bg_red, bg_green, bg_blue));
	if (global.level != "")
	{
		inst = instance_create_depth(0, 0, 0, obj_namer);
		inst.mode = 2;
	}
	accepting_input = 1;
	global.bg_red = bg_red;
	global.bg_green = bg_green;
	global.bg_blue = bg_blue;
	camera_set_view_size(view_camera[0], 640 / global.zoom, 576 / global.zoom);
}
