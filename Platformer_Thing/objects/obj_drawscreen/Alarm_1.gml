if (instance_exists(obj_player) && room != rm_demo && super_chaos_mode_init == 1)
{
	if (obj_player.pause == 0)
	{
		payload = irandom_range(0, 17);
		global.show_notification_message = 180;
		switch (payload)
		{
			case 0:
				global.jump_modifier = random_range(0.9, 3);
				global.notification_message = "Jump modifier x" + string(global.jump_modifier);
				break;
			case 1:
				global.speed_modifier = random_range(0.9, 3);
				global.notification_message = "Speed modifier x" + string(global.speed_modifier);
				break;
			case 2:
				global.grapple_modifier = random_range(0.9, 3);
				global.notification_message = "Grap. modifier x" + string(global.grapple_modifier);
				break;
			case 3:
				if (screen_burn == 0)
				{
					screen_burn = 1;
					global.notification_message = "Screen burn ON!";
				}
				else
				{
					screen_burn = 0;
					global.notification_message = "Screen burn OFF!";
				}
				break;
			case 4:
				if (global.money_magnet == 0)
				{
					global.money_magnet = 1;
					global.notification_message = "Money Magnet ON!";
				}
				else
				{
					global.money_magnet = 0;
					global.notification_message = "Money Magnet OFF!";
				}
				break;
			case 5:
				if (global.flip_screen == 0)
				{
					global.flip_screen = 1;
					global.notification_message = "Screen Flip ON!";
				}
				else
				{
					global.flip_screen = 0;
					global.notification_message = "Screen Flip OFF!";
				}
				break;
			case 6:
				take_snapshot = 1;
				show_snapshot = 1;
				global.notification_message = "Snap!";
				break;
			case 7:
				if (global.invisible_map == 0)
				{
					global.invisible_map = 1;
					global.notification_message = "Invisible Maps ON!";
				}
				else
				{
					global.invisible_map = 0;
					global.notification_message = "Invisible Maps OFF!";
					layer_set_visible(layer_get_id("Collision"), 1);
					layer_set_visible(layer_get_id("Decor"), 1);
				}
				break;
			case 8:
				if (global.invert_controls == 0)
				{
					global.invert_controls = 1;
					global.notification_message = "Invert Controls ON!";
				}
				else
				{
					global.invert_controls = 0;
					global.notification_message = "Invert Controls OFF!";
				}
				break;
			case 9:
				if (global.blind_spot == 0)
				{
					global.blind_spot = 1;
					global.notification_message = "Blind Spot ON!";
				}
				else
				{
					global.blind_spot = 0;
					global.notification_message = "Blind Spot OFF!";
				}
				break;
			case 10:
				if (global.waugh == 0)
				{
					global.waugh = 1;
					global.notification_message = "Wauuugh Mode ON!";
				}
				else
				{
					global.waugh = 0;
					global.notification_message = "Wauuugh Mode OFF!";
				}
				break;
			case 11:
				if (shrinking == 0 && dizzy_mode == 0 && you_are_an_idiot == 0)
				{
					shrinking = 1;
					shrink_offset = 0;
					global.notification_message = "QUICK BEAT THE LEVEL";
				}
				break;
			case 12:
				if (dizzy_mode == 0 && shrinking == 0)
				{
					dizzy_mode = 1;
					global.notification_message = "Screen Screw ON!";
				}
				else
				{
					dizzy_mode = 0;
					global.notification_message = "Screen Screw OFF!";
				}
				break;
			case 13:
				if (global.spin_screen == 0)
				{
					global.spin_screen = 1;
					global.notification_message = "Screen Spin ON!";
				}
				else
				{
					global.spin_screen = 0;
					global.notification_message = "Screen Spin OFF!";
				}
				break;
			case 14:
				if (you_are_an_idiot == 0 && shrinking == 0)
				{
					for (var i = 0; i < 5; i++)
					{
						screen_x[i] = irandom_range(0, 80);
						screen_y[i] = irandom_range(0, 72);
						screen_dir[i] = irandom_range(0, 3);
					}
					you_are_an_idiot = 1;
					global.notification_message = "Idiot mode ON!";
				}
				else
				{
					you_are_an_idiot = 0;
					global.notification_message = "Idiot mode OFF!";
				}
				break;
			case 15:
				if (rewind == 0)
				{
					global.grappled = 0;
					global.grappled_left = 0;
					global.grappled_right = 0;
					global.grappled_up = 0;
					instance_destroy(obj_grapple_left);
					instance_destroy(obj_grapple_right);
					instance_destroy(obj_grapple_up);
					rewind = array_length(lily_x) - 1;
					global.notification_message = "It's rewind time!";
					track_pos = audio_sound_get_track_position(global.music);
					switch (room)
					{
						case rm_level1:
							audio_stop_sound(global.music);
							global.music = audio_play_sound(bgm_level1r, 0, 1);
							break;
						case rm_level2:
							audio_stop_sound(global.music);
							global.music = audio_play_sound(bgm_level2r, 0, 1);
							break;
						case rm_level3:
							audio_stop_sound(global.music);
							global.music = audio_play_sound(bgm_level3r, 0, 1);
							break;
						case rm_level4:
							audio_stop_sound(global.music);
							global.music = audio_play_sound(bgm_level4r, 0, 1);
							break;
					}
					audio_sound_set_track_position(global.music, audio_sound_length(global.music) - track_pos);
				}
				else
				{
					global.show_notification_message = 0;
					global.notification_message = "";
				}
				break;
			case 16:
				if (obj_player.visible == 1)
				{
					obj_player.visible = 0;
					global.notification_message = "So long-eh Lily!";
				}
				else
				{
					obj_player.visible = 1;
					global.notification_message = "You're visible now!";
				}
				break;
			case 17:
				if (speed_ramping == 0)
				{
					speed_ramping = 1;
					global.notification_message = "Time has broken!";
				}
				else
				{
					speed_ramping = 0;
					game_set_speed(60, gamespeed_fps);
					audio_sound_pitch(bgm_level1, 1);
					audio_sound_pitch(bgm_level2, 1);
					audio_sound_pitch(bgm_level3, 1);
					audio_sound_pitch(bgm_level4, 1);
					global.notification_message = "Time has been fixed!";
				}
				break;
		}
	}
	if (room == rm_level1)
		alarm[1] = irandom_range(180, 900);
	else if (room == rm_level2)
		alarm[1] = irandom_range(120, 600);
	else if (room == rm_level3)
		alarm[1] = irandom_range(60, 300);
	else if (room == rm_level4)
		alarm[1] = irandom_range(30, 180);
}
