// Feather disable all

//This script contains the default profiles, and hence the default bindings and verbs, for your game
//
//  Please edit this macro to meet the needs of your game!
//
//The struct return by this script contains the names of each default profile.
//Default profiles then contain the names of verbs. Each verb should be given a binding that is
//appropriate for the profile. You can create bindings by calling one of the input_binding_*()
//functions, such as input_binding_key() for keyboard keys and input_binding_mouse() for
//mouse buttons

function __input_config_verbs()
{
    return {
        keyboard_and_mouse: 
		{
			up: input_binding_key(vk_up),
			down: input_binding_key(vk_down),
			left: input_binding_key(vk_left),
			right: input_binding_key(vk_right),
			stick_up: input_binding_key("W"),
			stick_down: input_binding_key("S"),
			stick_left: input_binding_key("A"),
			stick_right: input_binding_key("D"),
			jump: input_binding_key("Z"),
			jumpmenu: input_binding_key(vk_space),
			grapple: input_binding_key("X"),
			cancel: input_binding_key(vk_escape),
			editor_z: input_binding_key("Z"),
			editor_x: input_binding_key("X"),
			editor_c: input_binding_key("C"),
			editor_v: input_binding_key("V"),
			editor_b: input_binding_key("B"),
			editor_return: input_binding_key(vk_return),
			pause: input_binding_key("P"),
			respawn: input_binding_key("R")
		},
		gamepad: 
		{
			up: input_binding_gamepad_button(gp_padu),
			down: input_binding_gamepad_button(gp_padd),
			left: input_binding_gamepad_button(gp_padl),
			right: input_binding_gamepad_button(gp_padr),
			stick_up: input_binding_gamepad_axis(gp_axislv, true),
			stick_down: input_binding_gamepad_axis(gp_axislv, false),
			stick_left: input_binding_gamepad_axis(gp_axislh, true),
			stick_right: input_binding_gamepad_axis(gp_axislh, false),
			r_stick_up: input_binding_gamepad_axis(gp_axisrv, true),
			r_stick_down: input_binding_gamepad_axis(gp_axisrv, false),
			r_stick_left: input_binding_gamepad_axis(gp_axisrh, true),
			r_stick_right: input_binding_gamepad_axis(gp_axisrh, false),
			grapple: input_binding_gamepad_button(gp_face2),
			jump: input_binding_gamepad_button(gp_face1),
			face_a: input_binding_gamepad_button(gp_face1),
			face_b: input_binding_gamepad_button(gp_face2),
			face_x: input_binding_gamepad_button(gp_face3),
			face_y: input_binding_gamepad_button(gp_face4),
			shoulder_l: input_binding_gamepad_button(gp_shoulderl),
			shoulder_r: input_binding_gamepad_button(gp_shoulderr),
			editor_2nd: [input_binding_gamepad_button(gp_shoulderlb), input_binding_gamepad_button(gp_shoulderrb)],
			pause: input_binding_gamepad_button(gp_start),
			respawn: input_binding_gamepad_button(gp_select),
			screenshot: input_binding_gamepad_button(gp_stickl),
			debug: input_binding_gamepad_button(gp_stickr)
		},
		
        /*touch:
        {
            up:    input_binding_virtual_button(),
            down:  input_binding_virtual_button(),
            left:  input_binding_virtual_button(),
            right: input_binding_virtual_button(),
            
            accept:  input_binding_virtual_button(),
            cancel:  input_binding_virtual_button(),
            action:  input_binding_virtual_button(),
            special: input_binding_virtual_button(),
            
            pause: input_binding_virtual_button(),
        }*/
    };
}