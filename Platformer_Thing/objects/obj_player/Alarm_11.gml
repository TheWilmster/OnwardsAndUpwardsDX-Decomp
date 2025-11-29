dead = 0;
override_invincibility = 0;
respawning = 1;
input_vibrate_pulse(0.75, 0, 1, 20);
if (room != rm_test && room != rm_demo)
	global.deaths += 1;
global.controlstopall = 1;
instance_destroy(obj_grapple_up);
instance_destroy(obj_grapple_left);
instance_destroy(obj_grapple_right);
global.grappled = 0;
alarm[0] = 40;
hspd = 0;
vspd = 0;
vis = 0;
inst = instance_create_depth(x - 8, y - 8, depth, obj_player_death_effect);
inst.chunk = 0;
inst = instance_create_depth(x, y - 8, depth, obj_player_death_effect);
inst.chunk = 1;
inst = instance_create_depth(x - 8, y, depth, obj_player_death_effect);
inst.chunk = 2;
inst = instance_create_depth(x, y, depth, obj_player_death_effect);
inst.chunk = 3;
if (global.last_checkpoint == 1 && global.deaths == 0)
{
	if (!steam_get_achievement("ACH_SOCLOSE"))
		steam_set_achievement("ACH_SOCLOSE");
	give_achievement(2);
}
