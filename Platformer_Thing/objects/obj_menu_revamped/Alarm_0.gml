exiting = 0;
audio_stop_all();
if (object_to_create == rm_demo)
	audio_play_sound(bgm_intro, 0, 1);
room_goto(object_to_create);
