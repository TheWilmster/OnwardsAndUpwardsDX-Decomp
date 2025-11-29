function set_sound_volume()
{
	audio_sound_gain(bgm_ending, global.music_volume / 100, 0);
	audio_sound_gain(bgm_intro, global.music_volume / 100, 0);
	audio_sound_gain(bgm_level1, global.music_volume / 100, 0);
	audio_sound_gain(bgm_level2, global.music_volume / 100, 0);
	audio_sound_gain(bgm_level3, global.music_volume / 100, 0);
	audio_sound_gain(bgm_level4, global.music_volume / 100, 0);
	audio_sound_gain(bgm_level1r, global.music_volume / 100, 0);
	audio_sound_gain(bgm_level2r, global.music_volume / 100, 0);
	audio_sound_gain(bgm_level3r, global.music_volume / 100, 0);
	audio_sound_gain(bgm_level4r, global.music_volume / 100, 0);
	audio_sound_gain(bgm_runsettings, global.music_volume / 100, 0);
	audio_sound_gain(sfx_tfs_intro, global.music_volume / 100, 0);
	audio_sound_gain(sfx_cannon, global.sound_fx / 100, 0);
	audio_sound_gain(sfx_coin, global.sound_fx / 100, 0);
	audio_sound_gain(sfx_error, global.sound_fx / 100, 0);
	audio_sound_gain(sfx_flush, global.sound_fx / 100, 0);
	audio_sound_gain(sfx_grind, global.sound_fx / 100, 0);
	audio_sound_gain(sfx_jump, global.sound_fx / 100, 0);
	audio_sound_gain(sfx_land, global.sound_fx / 100, 0);
	audio_sound_gain(sfx_success, global.sound_fx / 100, 0);
	audio_sound_gain(sfx_waugh, global.sound_fx / 100, 0);
	audio_sound_gain(sfx_wedidit, global.sound_fx / 100, 0);
	audio_sound_gain(sfx_yeah, global.sound_fx / 100, 0);
}
