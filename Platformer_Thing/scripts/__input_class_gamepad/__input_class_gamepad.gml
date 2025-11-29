function __input_class_gamepad(arg0) constructor
{
	static __global = __input_global();
	
	static discover = function()
	{
		gamepad_set_axis_deadzone(index, 0);
		if (custom_mapping)
		{
			custom_mapping = false;
			__input_trace("Warning! Resetting Input's mapping for gamepad ", index);
			mapping_gm_to_raw = {};
			mapping_raw_to_gm = {};
			mapping_array = [];
		}
		button_count = gamepad_button_count(index);
		axis_count = gamepad_axis_count(index);
		hat_count = gamepad_hat_count(index);
		__input_gamepad_set_vid_pid();
		__input_gamepad_set_description();
		__input_gamepad_find_in_sdl2_database();
		__input_gamepad_set_type();
		__input_gamepad_set_blacklist();
		__input_gamepad_set_mapping();
		virtual_set();
		led_set();
		swap_ab();
		__vibration_initialize();
		__disconnection_frame = undefined;
		if (__global.__gamepad_motion_support)
			__motion = new __input_class_gamepad_motion(index);
		__input_trace("Gamepad ", index, " discovered, type = \"", simple_type, "\" (", raw_type, ", guessed=", guessed_type, "), description = \"", description, "\" (vendor=", vendor, ", product=", product, ")");
	};
	
	static __get_any_pressed = function()
	{
		if (get_pressed(32769) || get_pressed(32770) || get_pressed(32771) || get_pressed(32772) || get_pressed(32781) || get_pressed(32782) || get_pressed(32783) || get_pressed(32784) || get_pressed(32773) || get_pressed(32774) || get_pressed(32778) || get_pressed(32777) || get_pressed(32779) || get_pressed(32780) || (!is_axis(32775) && get_pressed(32775)) || (!is_axis(32776) && get_pressed(32776)))
			return true;
		if (get_pressed(32889) || get_pressed(32890) || get_pressed(32891) || get_pressed(32892) || get_pressed(32893) || get_pressed(32894) || get_pressed(32895))
			return true;
		return false;
	};
	
	static get_held = function(arg0)
	{
		if (!custom_mapping)
			return gamepad_button_check(index, arg0);
		var _mapping = variable_struct_get(mapping_gm_to_raw, arg0);
		if (_mapping == undefined)
			return false;
		return _mapping.held;
	};
	
	static get_pressed = function(arg0)
	{
		if (!custom_mapping)
			return gamepad_button_check_pressed(index, arg0);
		var _mapping = variable_struct_get(mapping_gm_to_raw, arg0);
		if (_mapping == undefined)
			return false;
		return _mapping.press;
	};
	
	static get_released = function(arg0)
	{
		if (!custom_mapping)
			return gamepad_button_check_released(index, arg0);
		var _mapping = variable_struct_get(mapping_gm_to_raw, arg0);
		if (_mapping == undefined)
			return false;
		return _mapping.release;
	};
	
	static get_value = function(arg0)
	{
		if (!custom_mapping)
		{
			if (arg0 == 32785 || arg0 == 32786 || arg0 == 32787 || arg0 == 32788)
				return clamp(gamepad_axis_value(index, arg0), -1, 1);
			else
				return gamepad_button_check(index, arg0);
		}
		var _mapping = variable_struct_get(mapping_gm_to_raw, arg0);
		if (_mapping == undefined)
			return 0;
		return _mapping.value;
	};
	
	static get_delta = function(arg0)
	{
		if (!custom_mapping)
			return get_value(arg0);
		var _mapping = variable_struct_get(mapping_gm_to_raw, arg0);
		if (_mapping == undefined)
			return 0;
		return _mapping.__value_delta;
	};
	
	static is_axis = function(arg0)
	{
		if (!custom_mapping)
		{
			if (arg0 == 32775 || arg0 == 32776)
				return !(os_type == os_switch || ((os_type == os_ios || os_type == os_tvos) && !(false || os_type == os_gxgames)));
			else
				return arg0 == 32785 || arg0 == 32786 || arg0 == 32787 || arg0 == 32788;
		}
		var _mapping = variable_struct_get(mapping_gm_to_raw, arg0);
		if (_mapping == undefined)
			return false;
		return _mapping.type == (1 << 0);
	};
	
	static set_mapping = function(arg0, arg1, arg2, arg3)
	{
		if (!custom_mapping)
		{
			custom_mapping = true;
			if (!(false || os_type == os_gxgames) && (__input_global().__on_desktop || os_type == os_android))
			{
				if (os_type == os_macosx)
				{
					if (gamepad_get_mapping(index) != "" && gamepad_get_mapping(index) != "no mapping")
					{
						__input_trace("Gamepad ", index, " has a custom mapping, clearing GameMaker's native mapping string");
						mac_cleared_mapping = true;
					}
					gamepad_test_mapping(index, gamepad_get_guid(index) + "," + gamepad_get_description(index) + ",");
				}
				else
				{
					__input_trace("Gamepad ", index, " has a custom mapping, clearing GameMaker's native mapping string");
					gamepad_remove_mapping(index);
				}
			}
			else if (!((os_type == os_xboxone || os_type == os_gdk) || (os_type == os_ps4 || os_type == os_ps5) || os_type == os_switch))
			{
				__input_trace("Gamepad ", index, " cannot remove GameMaker's native mapping string, this feature is not supported by Input on this platform");
			}
		}
		if (mac_cleared_mapping && os_type == os_macosx)
		{
			if (arg2 == (1 << 0))
				arg1 += 6;
			if (arg2 == (0 << 0))
				arg1 += 17;
		}
		var _mapping = new __input_class_gamepad_mapping(arg0, arg1, arg2, arg3);
		variable_struct_set(mapping_gm_to_raw, arg0, _mapping);
		if (arg1 != undefined)
			variable_struct_set(mapping_raw_to_gm, arg1, _mapping);
		array_push(mapping_array, _mapping);
		return _mapping;
	};
	
	static set_dpad_hat_mapping = function()
	{
		set_mapping(32781, 0, (2 << 0), "dpup").hat_mask = 1;
		set_mapping(32784, 0, (2 << 0), "dpright").hat_mask = 2;
		set_mapping(32782, 0, (2 << 0), "dpdown").hat_mask = 4;
		set_mapping(32783, 0, (2 << 0), "dpleft").hat_mask = 8;
	};
	
	static tick = function(arg0)
	{
		if (!arg0)
		{
			if (__disconnection_frame == undefined)
				__disconnection_frame = __global.__frame;
			if ((__global.__frame - __disconnection_frame) >= 5)
				return false;
		}
		else
		{
			__disconnection_frame = undefined;
			if (os_type == os_windows)
			{
				if (__xinput_trigger_range < 1)
				{
					var _trigger_max = max(gamepad_axis_value(index, 4106), gamepad_axis_value(index, 4107));
					if (_trigger_max > __xinput_trigger_range)
					{
						if (_trigger_max > 0.99609375)
						{
							__input_trace("Fully extending XInput trigger scale for gamepad ", index);
							__xinput_trigger_range = 1;
						}
						else
						{
							__input_trace("Partially extending XInput trigger scale for gamepad ", index);
							__xinput_trigger_range = 0.99609375;
						}
						variable_struct_get(mapping_gm_to_raw, 32775).scale = 1 / __xinput_trigger_range;
						variable_struct_get(mapping_gm_to_raw, 32776).scale = 1 / __xinput_trigger_range;
					}
				}
				if (__stadia_trigger_test && (gamepad_axis_value(index, 1) != gamepad_axis_value(index, 2) || gamepad_axis_value(index, 4) != gamepad_axis_value(index, 5)))
				{
					__input_trace("Setting Stadia controller to analogue trigger mapping for gamepad ", index);
					__stadia_trigger_test = false;
					set_mapping(32787, 2, (1 << 0), "rightx");
					set_mapping(32788, 3, (1 << 0), "righty");
					set_mapping(32776, 4, (1 << 0), "righttrigger").extended_range = true;
					set_mapping(32775, 5, (1 << 0), "lefttrigger").extended_range = true;
				}
			}
		}
		var _scan = current_time > __scan_start_time;
		var _gamepad = index;
		var _i = 0;
		repeat (array_length(mapping_array))
		{
			with (mapping_array[_i])
				tick(_gamepad, _scan);
			_i++;
		}
		if (__vibration_support)
		{
			if (arg0 && __vibration_received_this_frame && input_window_has_focus())
			{
				var _vibration_low = __vibration_scale * __vibration_left;
				var _vibration_high = __vibration_scale * __vibration_right;
				if (os_type == os_switch)
				{
					if (raw_type == "SwitchJoyConLeft" || raw_type == "SwitchJoyConRight")
					{
						switch_controller_vibrate_hd(index, 0, _vibration_high, 250, _vibration_low, 160);
					}
					else
					{
						switch_controller_vibrate_hd(index, 0, _vibration_high, 250, _vibration_low, 160);
						switch_controller_vibrate_hd(index, 1, _vibration_high, 250, _vibration_low, 160);
					}
				}
				else
				{
					gamepad_set_vibration(index, _vibration_low, _vibration_high);
				}
			}
			else
			{
				gamepad_set_vibration(index, 0, 0);
			}
			__vibration_received_this_frame = false;
		}
		return true;
	};
	
	static swap_ab = function()
	{
		if (__input_gamepad_type_swap_ab(simple_type) && is_struct(variable_struct_get(mapping_gm_to_raw, string(32769))) && is_struct(variable_struct_get(mapping_gm_to_raw, string(32770))))
		{
			var _a_mapping = variable_struct_get(mapping_gm_to_raw, string(32769)).raw;
			set_mapping(32769, variable_struct_get(mapping_gm_to_raw, string(32770)).raw, (0 << 0), "a");
			set_mapping(32770, _a_mapping, (0 << 0), "b");
		}
	};
	
	static virtual_set = function()
	{
		if (!__global.__using_steamworks)
			exit;
		var _gamepad_is_virtual = os_type == os_windows && xinput;
		var _slot = index;
		if (os_type == os_linux)
		{
			_gamepad_handle_index = -1;
			_gamepad_is_virtual = false;
			var _i = 0;
			repeat (index + 1)
			{
				if (gamepad_get_description(_i) == "Valve Streaming Gamepad" || __input_string_contains(gamepad_get_guid(_i), "03000000de280000fc11", "03000000de280000ff11"))
				{
					_gamepad_handle_index++;
					_gamepad_is_virtual = true;
				}
				_i++;
			}
			_slot = _gamepad_handle_index;
		}
		__steam_handle = steam_input_get_controller_for_gamepad_index(_slot);
		if (!(_gamepad_is_virtual && is_numeric(__steam_handle) && __steam_handle > 0))
		{
			__steam_handle = undefined;
		}
		else
		{
			__steam_handle_index = steam_input_get_gamepad_index_for_controller(__steam_handle);
			if (__steam_handle_index == -1)
				exit;
			var _handle_type = steam_input_get_input_type_for_handle(__steam_handle);
			if (!(is_numeric(_handle_type) && _handle_type >= 0))
				exit;
			var _description = variable_struct_get(__global.__steam_type_to_name, _handle_type);
			if (_description == undefined)
				exit;
			var _raw_type = variable_struct_get(__global.__steam_type_to_raw, _handle_type);
			if (_raw_type == undefined)
				exit;
			var _simple_type = variable_struct_get(__global.__simple_type_lookup, _raw_type);
			if (_simple_type == undefined)
				exit;
			description = _description;
			raw_type = _raw_type;
			simple_type = _simple_type;
		}
	};
	
	static led_set = function()
	{
		__led_pattern = undefined;
		if (!(os_type == os_ps5 || os_type == os_switch || (os_type == os_ios || os_type == os_tvos) || (os_type == os_windows && !(false || os_type == os_gxgames))) || (os_type == os_windows && !is_numeric(__steam_handle)))
			exit;
		var _led_offset = 0;
		var _led_layout = undefined;
		var _led_type = "xbox 360";
		if (!(false || os_type == os_gxgames) && ((os_type == os_ios || os_type == os_tvos) || os_type == os_switch))
		{
			if (index == 0)
				exit;
			_led_offset = -1;
		}
		if (raw_type == "AppleController" && (os_type == os_ios || os_type == os_tvos))
			_led_layout = "horizontal";
		switch (simple_type)
		{
			case "ps5":
				_led_layout = "horizontal";
				_led_type = "ps5";
				break;
			case "switch":
			case "switch joycon left":
			case "switch joycon right":
				if (raw_type == "SwitchJoyConPair" || (0 && simple_type != "switch"))
					_led_layout = "vertical";
				else
					_led_layout = "horizontal";
				if (!is_numeric(__steam_handle))
					_led_type = "switch";
				break;
			case "xbox 360":
				_led_layout = "radial";
				break;
		}
		if (_led_layout != undefined)
		{
			__led_pattern = 
			{
				value: index + _led_offset + 1,
				pattern: array_get(variable_struct_get(__global.__gamepad_led_pattern_dict, _led_type), index + _led_offset),
				layout: _led_layout
			};
		}
	};
	
	static __color_set = function(arg0)
	{
		if (__global.__using_steamworks)
		{
			var _led_flag = 0;
			if (arg0 == undefined)
			{
				arg0 = 0;
				_led_flag = 1;
			}
			if (is_numeric(__steam_handle))
				steam_input_set_led_color(__steam_handle, arg0, _led_flag);
			exit;
		}
		if (os_type == os_ps4 || os_type == os_ps5)
		{
			if (arg0 == undefined)
			{
				if (os_type == os_ps4)
					ps4_gamepad_reset_color(index);
				if (os_type == os_ps5)
					ps5_gamepad_reset_color(index);
				exit;
			}
			gamepad_set_color(index, arg0);
		}
	};
	
	static __vibration_initialize = function()
	{
		__vibration_support = __global.__vibration_allowed && (xinput || !(os_type == os_windows));
		if (__vibration_support)
		{
			if (os_type == os_ps5)
				ps5_gamepad_set_vibration_mode(index, 2);
			else if ((os_type == os_windows || os_type == os_switch) && __input_string_contains(raw_type, "JoyCon", "SwitchHandheld"))
				__vibration_scale = 0.4;
			else
				__vibration_scale = 1;
			gamepad_set_vibration(index, 0, 0);
		}
	};
	
	static __vibration_set = function(arg0, arg1)
	{
		__vibration_left = arg0;
		__vibration_right = arg1;
		__vibration_received_this_frame = true;
	};
	
	static __trigger_effect_apply = function(arg0, arg1, arg2)
	{
		var _trigger_index = 1;
		if (arg0 == 32775)
		{
			_trigger_index = 0;
		}
		else if (arg0 != 32776)
		{
			__input_error("Value ", arg0, " not a gamepad trigger");
			return false;
		}
		if (os_type == os_ps5)
			return arg1.__apply_ps5(index, arg0);
		if (__global.__using_steamworks && !__global.__on_wine && os_type == os_windows)
		{
			var _command_array = [
			{
				mode: 0,
				command_data: {}
			}, 
			{
				mode: 0,
				command_data: {}
			}];
			_command_array[_trigger_index].mode = variable_struct_get(__global.__steam_trigger_mode, arg1.__mode);
			variable_struct_set(_command_array[_trigger_index].command_data, string(arg1.__mode_name) + "_param", arg1.__params);
			if (variable_struct_get(arg1.__params, "strength") != undefined)
				arg1.__params.strength *= arg2;
			else if (variable_struct_get(arg1.__params, "amplitude") != undefined)
				arg1.__params.amplitude *= arg2;
			var _steam_trigger_params = 
			{
				command: _command_array,
				trigger_mask: 1
			};
			if (_trigger_index)
				_steam_trigger_params.trigger_mask = 2;
			if (!is_numeric(__steam_handle))
				return false;
			return steam_input_set_dualsense_trigger_effect(__steam_handle, _steam_trigger_params);
		}
		return false;
	};
	
	index = arg0;
	description = gamepad_get_description(arg0);
	guid = gamepad_get_guid(arg0);
	xinput = undefined;
	raw_type = undefined;
	simple_type = undefined;
	sdl2_definition = undefined;
	guessed_type = false;
	blacklisted = false;
	vendor = undefined;
	product = undefined;
	custom_mapping = false;
	mac_cleared_mapping = false;
	button_count = undefined;
	axis_count = undefined;
	hat_count = undefined;
	__xinput_trigger_range = 1;
	__stadia_trigger_test = false;
	__steam_handle_index = undefined;
	__steam_handle = undefined;
	__vibration_support = false;
	__vibration_scale = 1;
	__vibration_left = 0;
	__vibration_right = 0;
	__vibration_received_this_frame = false;
	__led_pattern = undefined;
	__motion = undefined;
	mapping_gm_to_raw = {};
	mapping_raw_to_gm = {};
	mapping_array = [];
	__connection_time = current_time;
	__scan_start_time = __connection_time + 250;
	__disconnection_frame = undefined;
	discover();
}
