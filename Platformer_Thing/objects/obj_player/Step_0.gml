if (global.controlstopall == 0)
{
	if (show_big_coins > 0)
		show_big_coins -= 1;
	if (allowed_to_exit_playtest_mode > 0)
		allowed_to_exit_playtest_mode -= 1;
	try
	{
		if (timer_running == 1)
		{
			global.time_milliseconds += 1.6666666666666667;
			if (global.time_milliseconds >= 100)
			{
				global.time_milliseconds = 0;
				global.time_seconds += 1;
				secs += 1;
				if (global.time_seconds == 60)
				{
					global.time_seconds = 0;
					global.time_minutes += 1;
					if (global.time_minutes > 99)
					{
						timer_running = 0;
						took_too_long = 1;
						global.time_minutes = 99;
						global.time_seconds = 59;
						global.time_milliseconds = 99;
					}
				}
			}
		}
	}
	catch (exception)
	{
		show_debug_message("CONGLATURATION !!! YOU GET EXCEPTION !!!");
		global.missing = "generic";
		global.exception = exception.longMessage;
		global.stack = exception.stacktrace;
		global.whatfailed = exception.message;
		room_goto(rm_error);
	}
	if (respawning == 0)
	{
		if ((x - xprevious) > 16 || (x - xprevious) < -16)
		{
			show_debug_message("Lily moved by " + string(x - xprevious) + " pixels horizontally, greater than the allowed threshold.");
			x = xprevious;
		}
		if ((y - yprevious) > 16 || (y - yprevious) < -16)
		{
			show_debug_message("Lily moved by " + string(y - yprevious) + " pixels vertically, greater than the allowed threshold.");
			y = yprevious;
		}
	}
	if (global.controlstop == 0)
	{
		if (global.invert_controls == 1)
		{
			key_right = input_check("left") || input_check("stick_left");
			key_left = input_check("right") || input_check("stick_right");
			key_up = input_check("down") || input_check("stick_down");
			key_up_pressed = input_check_pressed("down") || input_check_pressed("stick_down");
			key_down = input_check("up") || input_check("stick_up");
		}
		else
		{
			key_right = input_check("right") || input_check("stick_right");
			key_left = input_check("left") || input_check("stick_left");
			key_up = input_check("up") || input_check("stick_up");
			key_up_pressed = input_check_pressed("up") || input_check_pressed("stick_up");
			key_down = input_check("down") || input_check("stick_down");
		}
		key_run = input_check("grapple");
		key_run_pressed = input_check_pressed("grapple");
		key_run_released = input_check_released("grapple") || run_key_released_while_paused;
		key_jump = input_check("jump") || input_check("jumpmenu");
		key_jump_pressed = input_check_pressed("jump") || input_check_pressed("jumpmenu");
		key_respawn_pressed = input_check_pressed("respawn");
	}
	else if (global.controlstop == 2)
	{
		key_right = 1;
		key_left = 0;
		key_up = 0;
		key_up_pressed = 0;
		key_down = 0;
		key_run = 0;
		key_run_pressed = 0;
		key_run_released = 0;
		key_jump = 0;
		key_jump_pressed = 0;
		key_respawn_pressed = 0;
	}
	else if (global.controlstop == 3)
	{
		key_right = 0;
		key_left = 1;
		key_up = 0;
		key_up_pressed = 0;
		key_down = 0;
		key_run = 0;
		key_run_pressed = 0;
		key_run_released = 0;
		key_jump = 0;
		key_jump_pressed = 0;
		key_respawn_pressed = 0;
	}
	else if (recording == 2)
	{
		try
		{
			key_right = real(string_char_at(data_right, tick));
			key_left = real(string_char_at(data_left, tick));
			key_up = real(string_char_at(data_up, tick));
			key_up_pressed = 0;
			key_down = 0;
			key_run = real(string_char_at(data_run, tick));
			key_run_pressed = real(string_char_at(data_run_pressed, tick));
			key_run_released = real(string_char_at(data_run_released, tick));
			key_jump = real(string_char_at(data_jump, tick));
			key_jump_pressed = real(string_char_at(data_jump_pressed, tick));
			tick += 1;
		}
		catch (exception)
		{
			show_debug_message("CONGLATURATION !!! YOU GET EXCEPTION !!!");
			global.missing = "generic";
			global.exception = exception.longMessage;
			global.stack = exception.stacktrace;
			global.whatfailed = exception.message;
			room_goto(rm_error);
		}
	}
	else
	{
		key_right = 0;
		key_left = 0;
		key_up = 0;
		key_up_pressed = 0;
		key_down = 0;
		key_run = 0;
		key_run_pressed = 0;
		key_run_released = 0;
		key_jump = 0;
		key_jump_pressed = 0;
	}
	if (distance_to_object(obj_cannon) < 100)
		show_big_coins = 1;
	move = key_right - key_left;
	if (key_left && xscl == -1 && place_meeting(x + 2, y, obj_collide_all_around) && !place_meeting(x - 2, y, obj_collide_all_around) && !global.grappled)
	{
		while (place_meeting(x + 2, y, obj_collide_all_around))
			x -= 2;
	}
	if (key_right && xscl == 1 && place_meeting(x - 2, y, obj_collide_all_around) && !place_meeting(x + 2, y, obj_collide_all_around) && !global.grappled)
	{
		while (place_meeting(x - 2, y, obj_collide_all_around))
			x += 2;
		x += 2;
	}
	if (key_run)
		maxhspd = 2 * global.speed_modifier;
	else
		maxhspd = 2 * global.speed_modifier;
	if (key_run_pressed)
	{
		if (global.objective == 6)
			objective_failed = 1;
		if (key_up)
		{
			if (!instance_exists(obj_grapple_up))
				instance_create_depth(x, y, depth, obj_grapple_up);
		}
		else if (xscl == 1 && !tilemap_get_at_pixel(tilemap, x + 9, y) && !tilemap_get_at_pixel(tilemap, x + 9, y + 6) && !tilemap_get_at_pixel(tilemap, x + 9, y - 6) && !place_meeting(x + 2, y, obj_collide_all_around))
		{
			if (!instance_exists(obj_grapple_right))
				instance_create_depth(x, y, depth, obj_grapple_right);
		}
		else if (xscl == -1 && !tilemap_get_at_pixel(tilemap, x - 9, y) && !tilemap_get_at_pixel(tilemap, x - 9, y + 6) && !tilemap_get_at_pixel(tilemap, x - 9, y - 6) && !place_meeting(x - 2, y, obj_collide_all_around))
		{
			if (!instance_exists(obj_grapple_left))
				instance_create_depth(x, y, depth, obj_grapple_left);
		}
	}
	if (key_run_released)
	{
		if (instance_exists(obj_grapple_up))
		{
			collided = 0;
			while (place_meeting(x, y, obj_udcrusher) || place_meeting(x, y, obj_lrcrusher))
			{
				collided = 1;
				show_debug_message("collided");
				y += 1;
			}
			if (collided == 1)
			{
				show_debug_message("done colliding");
				y += 1;
			}
		}
		instance_destroy(obj_grapple_up);
		if (instance_exists(obj_grapple_right))
		{
			collided = 0;
			while (place_meeting(x, y, obj_udcrusher) || place_meeting(x, y, obj_lrcrusher))
			{
				collided = 1;
				x -= 1;
			}
			if (collided == 1)
				x -= 1;
		}
		instance_destroy(obj_grapple_right);
		if (instance_exists(obj_grapple_left))
		{
			collided = 0;
			while (place_meeting(x, y, obj_udcrusher) || place_meeting(x, y, obj_lrcrusher))
			{
				collided = 1;
				x += 1;
			}
			if (collided == 1)
				x += 1;
		}
		instance_destroy(obj_grapple_left);
		global.grappled = 0;
	}
	if (global.grappled == 1)
	{
		vspd = 0;
		hspd = 0;
	}
	if (vspd < maxvspd && global.grappled == 0)
		vspd += grav;
	if (hspd <= 0.0625 && hspd >= -0.0625 && !key_left && !key_right)
		hspd = 0;
	if (parasol_glide == 1)
	{
		if (key_right == 1)
		{
			if (hspd < maxhspd)
				hspd += 0.0625;
			if (hspd > maxhspd)
				hspd -= 0.0625;
		}
		else if (hspd > 0)
		{
			hspd -= 0.0625;
		}
		if (key_left == 1)
		{
			if (hspd > -maxhspd)
				hspd -= 0.0625;
			if (hspd < -maxhspd)
				hspd += 0.0625;
		}
		else if (hspd < 0)
		{
			hspd += 0.0625;
		}
	}
	else
	{
		if (key_right == 1)
		{
			if (hspd < maxhspd)
				hspd += 0.125;
			if (hspd > maxhspd)
				hspd -= 0.125;
		}
		else if (hspd > 0)
		{
			hspd -= 0.125;
		}
		if (key_left == 1)
		{
			if (hspd > -maxhspd)
				hspd -= 0.125;
			if (hspd < -maxhspd)
				hspd += 0.125;
		}
		else if (hspd < 0)
		{
			hspd += 0.125;
		}
	}
	if (key_jump && jumpkey > 0 && vspd < 0)
	{
		vspd -= 0.15;
		jumpkey -= 1;
	}
	if (!key_jump && jumpkey > 0)
		jumpkey = 0;
	if (tilemap_get_at_pixel(tilemap, x, y + 8) && key_jump_pressed && vspd > 0.1)
		jumpkey = 15;
	else if (coyote < 4 && vspd > 0 && key_jump_pressed)
		jumpkey = 15;
	if (key_jump_pressed && coyote > 5 && parasol_glide == 0)
	{
		parasol_glide = 1;
		if (global.objective == 5)
			objective_failed = 1;
	}
	if (parasol_glide == 1)
	{
		if (key_jump)
		{
			fall = 0;
			maxvspd = 1;
			if (vspd > 1)
				vspd = 1;
		}
		else
		{
			parasol_glide = 2;
			maxvspd = 4;
		}
	}
	else
	{
		maxvspd = 4;
	}
	if (!instance_place(x, y - 1, obj_collide_bottom))
	{
		if (tilemap_get_at_pixel(tilemap, x, y + 9))
		{
			if (key_jump_pressed)
			{
				if (global.waugh == 0)
					audio_play_sound(sfx_jump, 0, 0);
				else
					audio_play_sound(sfx_waugh, 0, 0);
				if (global.objective == 3)
					objective_failed = 1;
				vspd = key_jump_pressed * (-jspd * global.jump_modifier);
			}
		}
		else if (coyote < 4 && vspd > 0)
		{
			if (key_jump_pressed)
			{
				if (global.waugh == 0)
					audio_play_sound(sfx_jump, 0, 0);
				else
					audio_play_sound(sfx_waugh, 0, 0);
				if (global.objective == 3)
					objective_failed = 1;
				vspd = key_jump_pressed * (-jspd * global.jump_modifier);
			}
		}
		else if (global.grappled == 1)
		{
			fall = 0;
			if (key_jump_pressed && !instance_exists(obj_grapple_up))
			{
				if (global.waugh == 0)
					audio_play_sound(sfx_jump, 0, 0);
				else
					audio_play_sound(sfx_waugh, 0, 0);
				if (global.objective == 3)
					objective_failed = 1;
				jumpkey = 0;
				coyote = 0;
				parasol_glide = 0;
				vspd = key_jump_pressed * -jspd;
				global.grappled = 0;
				instance_destroy(obj_grapple_right);
				instance_destroy(obj_grapple_left);
			}
		}
	}
	if (!instance_exists(obj_grapple_up) && !instance_exists(obj_grapple_left) && !instance_exists(obj_grapple_right))
	{
		global.grappled = 0;
		global.grappled_left = 0;
		global.grappled_right = 0;
		global.grappled_up = 0;
	}
	if (instance_position(x + 9, y, obj_collide_all_around) && instance_position(x - 9, y, obj_collide_all_around) && global.grappled_up == 0)
	{
		show_debug_message("got stuck between a cloud and a cloud");
		dead = 1;
	}
	y += vspd;
	if (global.grappled == 0)
		fall += 1;
	if ((global.grappled_left && place_meeting(x - 2, y, obj_lrcrusher)) || (global.grappled_right && place_meeting(x + 2, y, obj_lrcrusher)))
	{
	}
	else
	{
		t1 = tilemap_get_at_pixel(tilemap, x + 4, y + 8);
		t2 = tilemap_get_at_pixel(tilemap, x - 4, y + 8);
		t3 = tilemap_get_at_pixel(tilemap, x, y + 8);
		if (t1 != 0 || t2 != 0 || t3 != 0)
		{
			if (coyote > 0)
			{
				if (global.waugh == 0)
					audio_play_sound(sfx_land, 0, 0);
				else
					audio_play_sound(sfx_waugh, 0, 0);
				if (global.objective == 4)
					objective_failed = 1;
			}
			fall = 0;
			parasol_glide = 0;
			y = floor(y / 8) * 8;
			vspd = 0;
			if (place_meeting(x, y - 2, obj_udcrusher))
			{
				show_debug_message("there was a cloud above you and ground underneath");
				dead = 1;
			}
			else
			{
				t1 = tilemap_get_at_pixel(tilemap, x + 4, y - 8);
				t2 = tilemap_get_at_pixel(tilemap, x - 4, y - 8);
				t3 = tilemap_get_at_pixel(tilemap, x, y - 8);
				if (t1 != 0 || t2 != 0 || t3 != 0)
				{
					show_debug_message("there was ground above and below you");
					dead = 1;
				}
			}
		}
		else if (instance_place(x, y + 1, obj_collide_bottom))
		{
			if (coyote > 0 && vspd > 0 && position_meeting(x, y + 12, obj_collide_bottom))
			{
				if (global.waugh == 0)
					audio_play_sound(sfx_land, 0, 0);
				else
					audio_play_sound(sfx_waugh, 0, 0);
				if (global.objective == 4)
					objective_failed = 1;
				if (global.objective == 7)
					objective_failed = 1;
			}
			fall = 0;
			parasol_glide = 0;
			inst = instance_place(x, y + 1, obj_collide_bottom);
			if (inst.y > y)
			{
				while (place_meeting(x, y + 1, obj_collide_bottom))
					y -= 0.1;
				y += 0.1;
				vspd = 0;
				if (instance_place(x, y - 2, obj_collide_bottom) && global.grappled == 0)
				{
					dead = 1;
					show_debug_message("there was a cloud above you and a cloud below you");
				}
				else
				{
					t1 = tilemap_get_at_pixel(tilemap, x + 4, y - 8);
					t2 = tilemap_get_at_pixel(tilemap, x - 4, y - 8);
					t3 = tilemap_get_at_pixel(tilemap, x, y - 8);
					if (t1 != 0 || t2 != 0 || t3 != 0)
					{
						show_debug_message("there was a cloud below you and ground above you");
						dead = 1;
					}
				}
			}
		}
		else
		{
			t1 = tilemap_get_at_pixel(tilemap, x + 4, y - 8);
			t2 = tilemap_get_at_pixel(tilemap, x - 4, y - 8);
			t3 = tilemap_get_at_pixel(tilemap, x, y - 8);
			if (t1 != 0 || t2 != 0 || t3 != 0)
			{
				y = ceil(y / 8) * 8;
				vspd = 0;
			}
			else if (instance_place(x, y - 3, obj_collide_all_around))
			{
				if (!instance_exists(obj_grapple_up))
				{
					while (place_meeting(x, y - 3, obj_collide_all_around))
						y += 0.1;
					if (global.objective == 7)
						objective_failed = 1;
					y += 2;
					vspd = 0;
				}
			}
		}
	}
	x += hspd;
	t1 = tilemap_get_at_pixel(tilemap, x + 8, y + 4);
	t2 = tilemap_get_at_pixel(tilemap, x + 8, y - 4);
	t3 = tilemap_get_at_pixel(tilemap, x + 8, y);
	if (t1 != 0 || t2 != 0 || t3 != 0)
	{
		x = floor(x / 8) * 8;
		hspd = 0;
	}
	else
	{
		t1 = tilemap_get_at_pixel(tilemap, x - 8, y + 4);
		t2 = tilemap_get_at_pixel(tilemap, x - 8, y - 4);
		t3 = tilemap_get_at_pixel(tilemap, x - 8, y);
		if (t1 != 0 || t2 != 0 || t3 != 0)
		{
			x = ceil(x / 8) * 8;
			hspd = 0;
		}
	}
	touched_right = 0;
	if (!key_left || key_right)
	{
		var i = 0.125;
		while (i < 3)
		{
			if (instance_place(x + i, y, obj_collide_all_around) && global.grappled == 0)
			{
				inst = instance_place(x + i, y, obj_collide_all_around);
				if (inst.x > x)
				{
					while (place_meeting(x + i, y, inst))
						x -= i;
					touched_right = 1;
					hspd = 0;
					if (global.objective == 7)
						objective_failed = 1;
					show_debug_message("zoom (left)");
				}
			}
			i += 0.125;
		}
	}
	if (!key_right || key_left)
	{
		if (touched_right == 0)
		{
			var i = 0.125;
			while (i < 3)
			{
				if (instance_place(x - i, y, obj_collide_all_around) && global.grappled == 0)
				{
					inst = instance_place(x - i, y, obj_collide_all_around);
					if (inst.x < x)
					{
						while (place_meeting(x - i, y, inst))
							x += i;
						hspd = 0;
						if (global.objective == 7)
							objective_failed = 1;
						show_debug_message("zoom (right)");
					}
				}
				i += 0.125;
			}
		}
	}
	t1 = tilemap_get_at_pixel(tilemap, x + 8, y);
	t2 = tilemap_get_at_pixel(tilemap, x - 8, y);
	if ((instance_place(x + 2, y, obj_collide_all_around) && t2 != 0) || (instance_place(x - 2, y, obj_collide_all_around) && t1 != 0))
	{
		dead = 1;
		show_debug_message("got stuck between a cloud and wall");
	}
	t1 = tilemap_get_at_pixel(tilemap, x + 4, y + 8);
	t2 = tilemap_get_at_pixel(tilemap, x - 4, y + 8);
	t3 = tilemap_get_at_pixel(tilemap, x, y + 8);
	if (t1 != 0 || t2 != 0 || t3 != 0)
	{
		coyote = 0;
	}
	else if (instance_place(x, y + 1, obj_collide_bottom))
	{
		if (global.objective == 7)
			objective_failed = 1;
		inst = instance_place(x, y + 1, obj_collide_bottom);
		if (inst.y > y)
			coyote = 0;
	}
	else
	{
		coyote += 1;
	}
	if (move != 0)
		xscl = move;
	if (coyote == 0)
	{
		if (hspd == 0)
		{
			if (!key_left && !key_right)
				action = 2;
			else
				action = 5;
		}
		else
		{
			action = 1;
		}
	}
	else if (vspd > 0)
	{
		action = 4;
	}
	else
	{
		action = 3;
	}
	if (place_meeting(x, y, obj_die))
	{
		dead = 1;
		show_debug_message("touched spikes");
	}
	if (key_respawn_pressed)
	{
		dead = 1;
		override_invincibility = 1;
		show_debug_message("respawn key pressed");
	}
	if (dead == 1)
	{
		dead = 0;
		if (global.invincible_invincibility == 0)
			event_perform(ev_alarm, 11);
		else if (override_invincibility == 1)
			event_perform(ev_alarm, 11);
	}
	if (invincible > 0)
	{
		invincible -= 1;
		if (show_player == 0)
			show_player = 1;
		else
			show_player = 0;
	}
	else
	{
		show_player = 1;
	}
	if (respawning == 0)
	{
		if ((x - xprevious) > 16 || (x - xprevious) < -16)
		{
			show_debug_message("Lily moved by " + string(x - xprevious) + " pixels horizontally, greater than the allowed threshold.");
			x = xprevious;
		}
		if ((y - yprevious) > 16 || (y - yprevious) < -16)
		{
			show_debug_message("Lily moved by " + string(y - yprevious) + " pixels vertically, greater than the allowed threshold.");
			y = yprevious;
		}
	}
	if (key_up && global.flight == 1)
	{
		y -= 1;
		vspd = -1;
	}
	if (global.objective == 8 && secs >= (global.objective_value * 10))
		objective_failed = 1;
	if (place_meeting(x, y, obj_udstar) || place_meeting(x, y, obj_lrstar))
	{
		if (global.objective == 7)
			objective_failed = 1;
	}
	if (objective_failed == 1)
	{
		audio_play_sound(sfx_error, 0, 0);
		show_failed_objective = 1;
		global.controlstopall = 1;
	}
}
else if (show_failed_objective == 1)
{
	if (keyboard_check_pressed(vk_space) || input_check_pressed("face_a") || input_check_pressed("face_b") || input_check_pressed("face_x") || input_check_pressed("face_y"))
	{
		if (room == rm_custom_level)
		{
			global.time_milliseconds = 0;
			global.time_seconds = 0;
			global.time_minutes = 0;
			global.deaths = 0;
			global.coins = 0;
			room_restart();
		}
		else
		{
			global.validating_now = -1;
			instance_activate_object(obj_editor);
			instance_destroy(obj_camera);
			instance_destroy(obj_grapple_up);
			instance_destroy(obj_grapple_left);
			instance_destroy(obj_grapple_right);
			layer_set_visible(layer_get_id("Grid"), 1);
			instance_destroy();
		}
	}
}
t1 = tilemap_get_at_pixel(tilemap, x + 4, y + 8);
t2 = tilemap_get_at_pixel(tilemap, x - 4, y + 8);
t3 = tilemap_get_at_pixel(tilemap, x, y + 8);
if (t1 != 0 || t2 != 0 || t3 != 0 || instance_place(x, y + 1, obj_collide_bottom))
	grounded = 1;
else
	grounded = 0;
