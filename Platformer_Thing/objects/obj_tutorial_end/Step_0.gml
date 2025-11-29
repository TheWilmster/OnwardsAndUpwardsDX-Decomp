if (collision_line(x, y, x, y + 160, obj_player, false, true))
{
	if (activado == 0)
	{
		if (global.tutorial_complete == 0)
		{
			global.controlstop = 2;
			activado = 1;
			alarm[0] = 30;
			audio_sound_gain(global.music, 0, 500);
		}
		else
		{
			activado = 1;
			instance_destroy(obj_fade);
			instance_create_depth(0, 0, -1, obj_fade);
			alarm[1] = 30;
		}
	}
}
