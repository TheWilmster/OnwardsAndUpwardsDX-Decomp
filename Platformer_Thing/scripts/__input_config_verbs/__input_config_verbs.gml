function __input_config_verbs()
{
	return 
	{
		keyboard_and_mouse: 
		{
			up: input_binding_key(38),
			down: input_binding_key(40),
			left: input_binding_key(37),
			right: input_binding_key(39),
			stick_up: input_binding_key("W"),
			stick_down: input_binding_key("S"),
			stick_left: input_binding_key("A"),
			stick_right: input_binding_key("D"),
			jump: input_binding_key("Z"),
			jumpmenu: input_binding_key(32),
			grapple: input_binding_key("X"),
			cancel: input_binding_key(27),
			editor_z: input_binding_key("Z"),
			editor_x: input_binding_key("X"),
			editor_c: input_binding_key("C"),
			editor_v: input_binding_key("V"),
			editor_b: input_binding_key("B"),
			editor_return: input_binding_key(13),
			pause: input_binding_key("P"),
			respawn: input_binding_key("R")
		},
		gamepad: 
		{
			up: input_binding_gamepad_button(32781),
			down: input_binding_gamepad_button(32782),
			left: input_binding_gamepad_button(32783),
			right: input_binding_gamepad_button(32784),
			stick_up: input_binding_gamepad_axis(32786, true),
			stick_down: input_binding_gamepad_axis(32786, false),
			stick_left: input_binding_gamepad_axis(32785, true),
			stick_right: input_binding_gamepad_axis(32785, false),
			r_stick_up: input_binding_gamepad_axis(32788, true),
			r_stick_down: input_binding_gamepad_axis(32788, false),
			r_stick_left: input_binding_gamepad_axis(32787, true),
			r_stick_right: input_binding_gamepad_axis(32787, false),
			grapple: input_binding_gamepad_button(32770),
			jump: input_binding_gamepad_button(32769),
			face_a: input_binding_gamepad_button(32769),
			face_b: input_binding_gamepad_button(32770),
			face_x: input_binding_gamepad_button(32771),
			face_y: input_binding_gamepad_button(32772),
			shoulder_l: input_binding_gamepad_button(32773),
			shoulder_r: input_binding_gamepad_button(32774),
			editor_2nd: [input_binding_gamepad_button(32775), input_binding_gamepad_button(32776)],
			pause: input_binding_gamepad_button(32778),
			respawn: input_binding_gamepad_button(32777),
			screenshot: input_binding_gamepad_button(32779),
			debug: input_binding_gamepad_button(32780)
		}
	};
}
