if (instance_exists(obj_editor))
	visible = 1;
else
	visible = 0;
if (place_meeting(x, y, obj_player))
{
	if (skinofyourteeth == 1)
		skinofyourteeth = 0;
	if (obscure == 1)
	{
		if (!steam_get_achievement("ACH_OBSCUREDEATH"))
			steam_set_achievement("ACH_OBSCUREDEATH");
		give_achievement(3);
	}
}
if (instance_exists(obj_player))
{
	if (distance_to_object(obj_player) < 2 && skinofyourteeth == 0 && obj_player.vis == 1)
	{
		skinofyourteeth = 1;
	}
	else if (distance_to_object(obj_player) > 1 && skinofyourteeth == 1 && obj_player.vis == 1)
	{
		if (counts == 1)
		{
			skinofyourteeth = 2;
			if (!steam_get_achievement("ACH_CLOSESPIKE"))
				steam_set_achievement("ACH_CLOSESPIKE");
			give_achievement(10);
		}
	}
}
