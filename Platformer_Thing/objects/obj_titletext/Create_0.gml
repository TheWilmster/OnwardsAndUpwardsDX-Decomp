y = 160;
mode = 0;
transition = 0;
y_threshold = -330;
if (global.time_minutes == 99 && global.time_seconds == 59 && global.time_milliseconds == 99)
	took_too_long = 1;
else
	took_too_long = 0;
if (global.time_seconds < 10)
	global.time_seconds = "0" + string(global.time_seconds);
if (global.time_milliseconds < 10)
	global.time_milliseconds = "0" + string(round(global.time_milliseconds));
else
	global.time_milliseconds = round(global.time_milliseconds);
if (!steam_get_achievement("ACH_BEATGAME") && global.cheats == 0)
	steam_set_achievement("ACH_BEATGAME");
if (global.time_minutes < 10 && !steam_get_achievement("ACH_FAST") && global.cheats == 0)
	steam_set_achievement("ACH_FAST");
if (global.speed_modifier < 1 || global.jump_modifier < 1 || global.grapple_modifier < 1)
{
	if (global.invincible_invincibility == 0)
	{
		if (!steam_get_achievement("ACH_HARDMODE"))
			steam_set_achievement("ACH_HARDMODE");
	}
}
if (global.chaos_mode == 1 && global.invincible_invincibility == 0)
{
	if (!steam_get_achievement("ACH_CHAOSMODE"))
		steam_set_achievement("ACH_CHAOSMODE");
}
give_achievement(0);
if (global.time_minutes < 10 && global.cheats == 0)
	give_achievement(5);
if (global.speed_modifier < 1 || global.jump_modifier < 1 || global.grapple_modifier < 1)
{
	if (global.invincible_invincibility == 0)
		give_achievement(4);
}
if (global.chaos_mode == 1 && global.invincible_invincibility == 0)
	give_achievement(8);
if (global.deaths == 0 && global.coins == 329 && global.coin1 == 1 && global.coin2 == 1 && global.coin3 == 1 && global.cheats == 0 && took_too_long == 0)
{
	if (global.chaos_mode == 1)
	{
		ini_open("mystery.ini");
		ini_write_string("¤¥©®¼µþ", "@", "");
		ini_close();
		if (!steam_get_achievement("ACH_CHAOSPERFECT"))
			steam_set_achievement("ACH_CHAOSPERFECT");
		give_achievement(9);
	}
	else
	{
		ini_open("controls.onuc");
		ini_write_real("Perfect", "Perfect", 1);
		ini_close();
		if (!steam_get_achievement("ACH_PERFECT"))
			steam_set_achievement("ACH_PERFECT");
		give_achievement(1);
	}
}
txt = "Lily has made it to the moon, but what about that urban legend? She takes a handful of the powder and tastes it. Turns out, it is in fact parmesan cheese. Lily sets up a business on the moon to harvest it of its parmesan. The only question that remains is... How is she going to get back to Earth?\n\n\n\n\n\n\nLevel Designer:\n  PureKnix\n\nComposer:\n  KraftPunk\n\nPixel Art:\n  Blu\n\nProgrammer:\n  Blu\n\nLinux Playtester\n/ Debugger:\n  Dav999\n\nInput Library:\n  Juju Adams\n  Alynne Keith\n  and friends\n\nAll assets are copyright to their respective owners.";
