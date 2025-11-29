y += mode;
if (place_meeting(x, y, obj_reverse))
	mode *= -1;
if (place_meeting(x, y - 3, obj_player))
	obj_player.dead = 1;
if (place_meeting(x, y + 3, obj_player))
	obj_player.dead = 1;
if (place_meeting(x, y + 3, obj_grapple_up))
	obj_grapple_up.y += mode;
if (place_meeting(x + 3, y, obj_grapple_left))
	obj_grapple_left.y += mode;
if (place_meeting(x - 3, y, obj_grapple_right))
	obj_grapple_right.y += mode;
if (global.respawn_all_platforms == 1)
{
	x = xstart;
	y = ystart;
	mode = modestart;
}
