if (obj_menu_revamped.exiting == 1)
{
	ini_open("controls.onuc");
	ini_write_real("Option", "MusicVolume", global.music_volume);
	ini_write_real("Option", "SoundFX", global.sound_fx);
	ini_close();
	instance_destroy();
}
set_sound_volume();
