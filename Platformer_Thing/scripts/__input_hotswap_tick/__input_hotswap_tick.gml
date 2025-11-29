function __input_hotswap_tick()
{
	static _global = __input_global();
	
	with (_global.__players[0])
	{
		if (__ghost)
		{
			__input_trace("Warning! Cannot hotswap because player 0 is a ghost");
			return false;
		}
		if (!__active)
			return false;
		if (_global.__game_input_allowed && (__last_input_time < 0 || (_global.__current_time - __last_input_time) > 33) && (__rebind_state <= 0 || !is_array(__rebind_source_filter) || array_length(__rebind_source_filter) <= 0))
		{
			var _new_source = __input_hotswap_tick_input();
			if (_new_source != undefined && !__source_contains(_new_source))
			{
				input_source_set(_new_source, 0, true);
				if (is_method(_global.__hotswap_callback))
					_global.__hotswap_callback();
				else if (is_numeric(_global.__hotswap_callback) && script_exists(_global.__hotswap_callback))
					script_execute(_global.__hotswap_callback);
				else if (_global.__hotswap_callback != undefined)
					__input_error("Hotswap callback set to an illegal value (typeof=", typeof(_global.__hotswap_callback), ")");
			}
		}
	}
}

function __input_hotswap_tick_input()
{
	static _global = __input_global();
	static _sort_order = (!(false || os_type == os_gxgames) && (os_type == os_macosx || (!_global.__using_steamworks && os_type == os_windows) || (_global.__using_steamworks && os_type == os_linux))) ? -1 : 1;
	
	if (_global.__any_gamepad_binding_defined)
	{
		var _player = _global.__players[0];
		var _active_gamepad_index = _player.__source_get_gamepad();
		if (gamepad_is_connected(_active_gamepad_index))
		{
			var _gamepad = _global.__gamepads[_active_gamepad_index];
			if (is_struct(_gamepad) && (_gamepad.__get_any_pressed() || __input_hotswap_axis_delta(_gamepad)))
			{
				_player.__last_input_time = _global.__current_time;
				return __input_global().__source_gamepad[_active_gamepad_index];
			}
		}
		var _gamepad_count = array_length(__input_global().__source_gamepad);
		if (!((_global.__frame - _global.__window_focus_frame) < 2))
		{
			var _gamepad_index = 0;
			if (_sort_order == -1)
				_gamepad_index = _gamepad_count - 1;
			repeat (_gamepad_count)
			{
				if (_gamepad_index != _active_gamepad_index && gamepad_is_connected(_gamepad_index))
				{
					var _gamepad = _global.__gamepads[_gamepad_index];
					if (is_struct(_gamepad) && _gamepad.__disconnection_frame == undefined)
					{
						if (_gamepad.__get_any_pressed())
						{
							__input_trace("Hotswapping on gamepad ", __input_global().__source_gamepad[_gamepad_index], " \"", _global.__gamepads[_gamepad_index].description, "\" button press");
							_player.__last_input_time = _global.__current_time;
							return __input_global().__source_gamepad[_gamepad_index];
						}
						if (__input_hotswap_axis_delta(_gamepad))
						{
							__input_trace("Hotswapping on gamepad ", __input_global().__source_gamepad[_gamepad_index], " \"", _global.__gamepads[_gamepad_index].description, "\" axis press");
							_player.__last_input_time = _global.__current_time;
							return __input_global().__source_gamepad[_gamepad_index];
						}
					}
				}
				_gamepad_index += _sort_order;
			}
		}
	}
	if (_global.__keyboard_allowed && _global.__any_keyboard_binding_defined && input_source_is_available(__input_global().__source_keyboard) && keyboard_check_pressed(vk_anykey) && __input_keyboard_key() > 0 && !__input_key_is_ignored(__input_keyboard_key()))
	{
		__input_trace("Hotswapping on keyboard press");
		return __input_global().__source_keyboard;
	}
	if (_global.__touch_allowed)
	{
		if (input_source_is_available(__input_global().__source_touch) && device_mouse_check_button(_global.__pointer_index, mb_left))
		{
			__input_trace("Hotswapping on touch");
			return __input_global().__source_touch;
		}
	}
	else if (_global.__mouse_allowed && input_source_is_available(__input_global().__source_mouse))
	{
		if (false && _global.__pointer_moved)
		{
			__input_trace("Hotswapping on mouse pointer movement");
			return __input_global().__source_mouse;
		}
	}
	return undefined;
}

function __input_hotswap_axis_delta(arg0)
{
	static _global = __input_global();
	
	if (!(!(false || os_type == os_gxgames) && (__input_global().__on_desktop || os_type == os_android)) || arg0.custom_mapping)
	{
		var _player = _global.__players[0];
		if ((abs(arg0.get_value(32775)) > _player.__axis_threshold_get(32775).mini && abs(arg0.get_delta(32775)) > 0.1) || (abs(arg0.get_value(32776)) > _player.__axis_threshold_get(32776).mini && abs(arg0.get_delta(32776)) > 0.1) || (abs(arg0.get_value(32786)) > _player.__axis_threshold_get(32786).mini && abs(arg0.get_delta(32786)) > 0.1) || (abs(arg0.get_value(32785)) > _player.__axis_threshold_get(32785).mini && abs(arg0.get_delta(32785)) > 0.1) || (abs(arg0.get_value(32786)) > _player.__axis_threshold_get(32786).mini && abs(arg0.get_delta(32786)) > 0.1) || (abs(arg0.get_value(32787)) > _player.__axis_threshold_get(32787).mini && abs(arg0.get_delta(32787)) > 0.1) || (abs(arg0.get_value(32788)) > _player.__axis_threshold_get(32788).mini && abs(arg0.get_delta(32788)) > 0.1))
			return true;
	}
	return false;
}
