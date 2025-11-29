global.font = font_add_sprite(spr_font, 33, false, 0);
global.font_nintendo_joycon = font_add_sprite(spr_font2, 33, false, 0);
global.font_normal = font_add_sprite(spr_font_normal, 33, false, 0);
ini_open("controls.onuc");
global.zoom = ini_read_real("Option", "Zoom", 4);
game_set_speed(60, gamespeed_fps);
global.screen_fx = ini_read_real("Option", "ScreenFX", 1);
global.starting_tile_mode = ini_read_string("Option", "EditorDefaultMode", "rec");
global.music_volume = ini_read_real("Option", "MusicVolume", 100);
if (global.music_volume <= 1)
{
	global.music_volume *= 100;
	ini_write_real("Option", "MusicVolume", global.music_volume);
}
global.sound_fx = ini_read_real("Option", "SoundFX", 100);
if (global.sound_fx <= 1)
{
	global.sound_fx *= 100;
	ini_write_real("Option", "MusicVolume", global.sound_fx);
}
set_sound_volume();
ini_close();
ini_open("ignore.ini");
global.tutorial_complete = ini_read_real("Tutorial", "Valid", 0);
ini_close();
global.flip_screen = 0;
global.spin_screen = 0;
global.no_death_mode = 0;
global.invisible_map = 0;
global.invert_controls = 0;
global.blind_spot = 0;
global.chaos_mode = 0;
global.waugh = 0;
if (file_exists("controller.onuc"))
{
	buffer = buffer_load("controller.onuc");
	json = buffer_read(buffer, buffer_string);
	if (input_player_verify(json) == 0)
	{
		file_delete("controller.onuc");
		show_debug_message("controller.onuc is either malformed or from a previous version");
	}
	else
	{
		input_player_import(json);
	}
	buffer_delete(buffer);
}
global.super_chaos_mode = 0;
global.mega_chaos_mode = 0;
if (os_type == os_windows)
	global.user = environment_get_variable("username");
else
	global.user = environment_get_variable("HOME");
room_goto_next();
