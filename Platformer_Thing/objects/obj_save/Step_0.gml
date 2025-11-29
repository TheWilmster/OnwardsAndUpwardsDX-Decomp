if (place_meeting(x, y, obj_player) && image_index == 0)
{
	global.check_id = my_id;
	global.check_x = x;
	global.check_y = y;
	global.check_room = room;
	image_index = 1;
	global.touched_save_points += 1;
	if (global.waugh == 0)
		audio_play_sound(sfx_yeah, 0, 0);
	else
		audio_play_sound(sfx_waugh, 0, 0);
	if (last_checkpoint == 1)
		global.last_checkpoint = 1;
}
if (global.respawn_all_platforms == 1)
	image_index = 0;
if (global.spin_objects == 1)
	image_angle += 1;
else
	image_angle = 0;
