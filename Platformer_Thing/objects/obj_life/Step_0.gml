if (place_meeting(x, y, obj_player))
{
	lives += 1;
	audio_play_sound(sfx_success, 0, 0);
	x = -500;
}
if (global.respawn_all_platforms == 1)
	x = xstart;
