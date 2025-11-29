if (global.camera_stop == 1)
{
}
else if (instance_exists(obj_cannonlily))
{
	y -= 2;
	x += 2;
}
else if (instance_exists(obj_player))
{
	if (obj_player.xscl == 1)
		offset = 32;
	else
		offset = -32;
	if (current_offset > offset)
		current_offset -= 1;
	else if (offset > current_offset)
		current_offset += 1;
	x = obj_player.x + current_offset;
	if (current_yoffset > yoffset)
		current_yoffset -= 1;
	else if (yoffset > current_yoffset)
		current_yoffset += 1;
	y = obj_player.y + current_yoffset;
}
if (room == rm_level3)
{
	if (distance_to_object(obj_udplatform_spiketopbottom) < 160 && play_grind_sound == 0)
	{
		if (global.waugh == 0)
			audio_play_sound(sfx_grind, 0, 1);
		else
			audio_play_sound(sfx_waugh, 0, 1);
		play_grind_sound = 1;
	}
	else if (distance_to_object(obj_udplatform_spiketopbottom) > 160 && play_grind_sound == 1)
	{
		audio_stop_sound(sfx_grind);
		audio_stop_sound(sfx_waugh);
		play_grind_sound = 0;
	}
	else if (distance_to_object(obj_lrplatform_spiketop) < 160 && play_grind_sound == 0)
	{
		if (global.waugh == 0)
			audio_play_sound(sfx_grind, 0, 1);
		else
			audio_play_sound(sfx_waugh, 0, 1);
		play_grind_sound = 1;
	}
	else if (distance_to_object(obj_lrplatform_spiketop) > 160 && play_grind_sound == 1)
	{
		audio_stop_sound(sfx_grind);
		audio_stop_sound(sfx_waugh);
		play_grind_sound = 0;
	}
}
camera_set_view_size(view_camera[0], 160, 144);
