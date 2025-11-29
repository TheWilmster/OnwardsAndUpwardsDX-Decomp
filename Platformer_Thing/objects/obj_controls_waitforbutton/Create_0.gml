arg = obj_menu_revamped.pass_argument;
show_debug_message(obj_menu_revamped.pass_argument);
instance_deactivate_object(obj_menu_revamped);
timeout = 10;
accepting = 0;
alarm[0] = 1;
key = 0;
keyboard_lastchar = "";
input_binding_scan_params_set([], [gp_face1, gp_face2, gp_face3, gp_face4, gp_shoulderl, gp_shoulderr], __input_global().__source_gamepad);
input_binding_scan_start(function(arg0)
{
	if (arg == 0)
		input_binding_set("jump", arg0, 0, 0, "gamepad");
	else if (arg == 1)
		input_binding_set("grapple", arg0, 0, 0, "gamepad");
	audio_play_sound(sfx_success, 0, 0);
	instance_activate_object(obj_menu_revamped);
	instance_destroy();
}, function(arg0)
{
	instance_activate_object(obj_menu_revamped);
	instance_destroy();
});
