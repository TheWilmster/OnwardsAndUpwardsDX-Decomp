if (place_meeting(x, y, obj_player) && activated == 0)
{
	if (obj_player.xscl == 1)
	{
		obj_player.depth = depth + 1;
		global.controlstop = 2;
		activated = 1;
		image_speed = 1;
		instance_destroy(obj_grapple_up);
		instance_destroy(obj_grapple_left);
		instance_destroy(obj_grapple_right);
		global.grappled = 0;
		global.grappled_up = 0;
		global.grappled_left = 0;
		global.grappled_right = 0;
	}
}
if (image_index > 4 && activated == 1)
{
	if (global.waugh == 0)
		audio_play_sound(sfx_cannon, 0, 0);
	else
		audio_play_sound(sfx_waugh, 0, 0);
	if (global.screen_fx == 1)
	{
		layer_set_visible("Shake", true);
		instance_create_depth(0, 0, depth - 1, obj_fade);
	}
	instance_create_depth(x + 32, y + 24, depth + 1, obj_cannonlily);
	activated = 2;
	image_speed = 0;
	alarm[0] = 30;
}
if (global.spin_objects == 1)
	image_angle += 1;
else
	image_angle = 0;
