if (collision_line(x, y, x, y + 16, obj_player, false, true))
{
	if (activado == 0)
	{
		if (obj_player.xscl == -1 && obj_player.grounded == 1)
		{
			instance_create_depth(x - 72, y - 16, 0, obj_cannonblock);
			global.controlstop = 3;
			obj_player.depth = 450;
			alarm[0] = 20;
			activado = 1;
		}
	}
}
if (activado == 1)
	tick += 1;
