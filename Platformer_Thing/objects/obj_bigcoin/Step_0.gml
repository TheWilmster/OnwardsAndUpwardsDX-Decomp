if (place_meeting(x, y, obj_player))
{
	if (room == rm_level2)
		global.coin1 = 1;
	else if (room == rm_level3)
		global.coin2 = 1;
	else
		global.coin3 = 1;
	if (global.waugh == 0)
		audio_play_sound(sfx_success, 0, 0);
	else
		audio_play_sound(sfx_waugh, 0, 0);
	x = -100;
	obj_player.show_big_coins = 180;
}
if (global.respawn_all_platforms == 1)
{
	image_index = 0;
	x = xstart;
}
if (global.spin_objects == 1)
	image_angle += 1;
else
	image_angle = 0;
