audio_play_sound(sfx_tfs_intro, 0, 0);
global.coins = 0;
global.checkpoints = 0;
global.check_x = 0;
global.check_y = 0;
global.check_room = rm_init;
global.check_id = -1;
global.deaths = 0;
global.time_minutes = 0;
global.time_seconds = 0;
global.time_milliseconds = 0;
global.respawn_all_platforms = 0;
global.level_won = 0;
global.coin1 = 0;
global.coin2 = 0;
global.coin3 = 0;
global.low_gravity = 0;
global.preserve_flags = 1;
global.validating_now = 0;
global.objective = 0;
global.objective_value = 0;
global.touched_save_points = 0;
lives = 0;
global.bg_red = 0;
global.bg_green = 0;
global.bg_blue = 0;
global.invincible_invincibility = 0;
global.jump_modifier = 1;
global.speed_modifier = 1;
global.grapple_modifier = 1;
global.money_magnet = 0;
global.flight = 0;
global.vvvvvv_mode = 0;
global.flip_screen = 0;
global.spin_screen = 0;
global.no_death_mode = 0;
global.invisible_map = 0;
global.invert_controls = 0;
global.blind_spot = 0;
global.chaos_mode = 0;
global.super_chaos_mode = 0;
global.mega_chaos_mode = 0;
global.waugh = 0;
global.spin_objects = 0;
global.cheats = 0;
global.c_realx = -1000;
global.c_realy = -1000;
global.selectionmenu = -1;
global.camera_stop = 0;
if (steam_file_exists("perfect.onuc"))
{
	global.cloud_perfect = steam_file_read("perfect.onuc");
	global.cloud_perfect = real(global.cloud_perfect);
	global.perfect = 1;
}
else
{
	global.cloud_perfect = 0;
	ini_open("controls.onuc");
	perfect = ini_read_real("Perfect", "Perfect", 0);
	ini_close();
	global.perfect = perfect;
	steam_file_write("perfect.onuc", string(perfect), 1);
}
if (steam_file_exists("mystery.ini"))
{
	global.hardcore = 1;
}
else if (file_exists("mystery.ini"))
{
	global.hardcore = 1;
	steam_file_write("mystery.ini", string(global.hardcore), 1);
}
else
{
	global.hardcore = 0;
}
if (os_type == os_windows)
	range = 12;
else
	range = 32;
for (var i = 0; i < range; i++)
{
	input_source_set(__input_global().__source_gamepad[i], 0, 1);
	if (input_player_get_gamepad() != -1)
		break;
}
if (file_exists("achievement.onuc"))
{
	buffer = buffer_load("achievement.onuc");
	json = buffer_read(buffer, buffer_string);
	global.achievements = json_parse(json);
	show_debug_message(global.achievements);
}
else
{
	global.achievements = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
}
code = "";
if (file_exists("mystery.ini"))
{
	ini_open("mystery.ini");
	code = ini_read_string("¤¥©®¼µþ", "@", "");
	code = string_upper(code);
	ini_close();
}
if (code == "BRINGITON")
	global.mega_chaos_mode = 1;
window_set_caption("Onward and Upward! DX");
