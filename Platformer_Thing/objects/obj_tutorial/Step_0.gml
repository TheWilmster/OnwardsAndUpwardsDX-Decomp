if (instance_exists(obj_player))
{
	if (distance_to_object(obj_player) < 32)
		visible = 1;
	else
		visible = 0;
}
