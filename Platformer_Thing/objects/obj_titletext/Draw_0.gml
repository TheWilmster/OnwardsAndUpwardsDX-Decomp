draw_set_font(global.font_normal);
draw_set_colour(c_white);
if (mode == 0)
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_ext(0, y, txt, 9, 160);
	draw_sprite(spr_introimages, 0, 0, 0);
}
else
{
	if (input_player_get_gamepad_type() == "switch joycon left" || input_player_get_gamepad_type() == "switch joycon right")
		draw_set_font(global.font_nintendo_joycon);
	else
		draw_set_font(global.font);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	if (global.super_chaos_mode == 1 && global.invincible_invincibility == 0)
	{
		draw_text_ext(80, 72, "YOU BEAT INSANITY MODE?!?!\n\nI'm in disbelief! Literally nothing can stop you at this point!! All hail the God of gaming!", 8, 160);
	}
	else if (global.cheats == 0)
	{
		if (global.deaths == 0 && global.coins == 329 && global.coin1 == 1 && global.coin2 == 1 && global.coin3 == 1 && took_too_long == 0)
		{
			if (global.chaos_mode == 1)
				draw_text_ext(80, 72, "NO WAY!!\n\nYou completed a perfect run of CHAOS MODE?! I didn't even know that was possible!!\n\nSomewhere lies a secret file...!\n\nYou are the master of the universe!!", 8, 160);
			else
				draw_text_ext(80, 72, "WOW!\n\nYou just completed a perfect run of this game!\n\nCheck the main menu for your prize! You are an amazing player!!\n\nTime: " + string(global.time_minutes) + ":" + string(global.time_seconds) + "." + string(global.time_milliseconds), 8, 160);
		}
		else if (took_too_long == 1)
		{
			if (input_player_get_gamepad() != -1)
				draw_text_ext(80, 72, "Deaths: " + string(global.deaths) + "\nCoins: " + string(global.coins) + "\nTime: TOO LONG\n\nPress " + input_verb_get_icon("jump") + ".", 8, 160);
			else
				draw_text_ext(80, 72, "Deaths: " + string(global.deaths) + "\nCoins: " + string(global.coins) + "\nTime: TOO LONG\n\nPress SPACEBAR.", 8, 160);
		}
		else if (input_player_get_gamepad() != -1)
		{
			draw_text_ext(80, 72, "Deaths: " + string(global.deaths) + "\nCoins: " + string(global.coins) + "\nTime: " + string(global.time_minutes) + ":" + string(global.time_seconds) + "." + string(global.time_milliseconds) + "\n\nPress " + input_verb_get_icon("jump") + ".", 8, 160);
		}
		else
		{
			draw_text_ext(80, 72, "Deaths: " + string(global.deaths) + "\nCoins: " + string(global.coins) + "\nTime: " + string(global.time_minutes) + ":" + string(global.time_seconds) + "." + string(global.time_milliseconds) + "\n\nPress " + input_verb_get_icon("jump") + ".", 8, 160);
		}
	}
	else
	{
		draw_text_ext(80, 72, "Cheats were on...\nNo dice for you.", 8, 160);
	}
	if (global.coin1 == 1)
		draw_sprite(spr_bigcoin, 0, camera_get_view_x(view_camera[0]) + 48, camera_get_view_y(view_camera[0]) + 96);
	if (global.coin2 == 1)
		draw_sprite(spr_bigcoin, 0, camera_get_view_x(view_camera[0]) + 72, camera_get_view_y(view_camera[0]) + 96);
	if (global.coin3 == 1)
		draw_sprite(spr_bigcoin, 0, camera_get_view_x(view_camera[0]) + 96, camera_get_view_y(view_camera[0]) + 96);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}
