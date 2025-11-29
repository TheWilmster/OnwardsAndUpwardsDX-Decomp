function __input_gamepad_set_mapping()
{
	static _global = __input_global();
	
	if (os_type == os_switch)
	{
		if (raw_type != "SwitchJoyConLeft" && raw_type != "SwitchJoyConRight")
		{
			set_mapping(32781, 32781, (0 << 0), "dpup");
			set_mapping(32782, 32782, (0 << 0), "dpdown");
			set_mapping(32783, 32783, (0 << 0), "dpleft");
			set_mapping(32784, 32784, (0 << 0), "dpright");
		}
		if (raw_type == "SwitchJoyConLeft" || raw_type == "SwitchJoyConRight")
		{
			set_mapping(32773, 6, (0 << 0), "leftshoulder");
			set_mapping(32774, 7, (0 << 0), "rightshoulder");
		}
		else
		{
			set_mapping(32773, 6, (0 << 0), "leftshoulder");
			set_mapping(32774, 7, (0 << 0), "rightshoulder");
			set_mapping(32775, 8, (0 << 0), "lefttrigger");
			set_mapping(32776, 9, (0 << 0), "righttrigger");
		}
		set_mapping(32769, 1, (0 << 0), "a");
		set_mapping(32770, 0, (0 << 0), "b");
		set_mapping(32771, 3, (0 << 0), "x");
		set_mapping(32772, 2, (0 << 0), "y");
		set_mapping(32778, 10, (0 << 0), "start");
		if (raw_type != "SwitchJoyConLeft" && raw_type != "SwitchJoyConRight")
			set_mapping(32777, 11, (0 << 0), "back");
		set_mapping(32785, 0, (1 << 0), "leftx");
		set_mapping(32786, 1, (1 << 0), "lefty");
		set_mapping(32779, 4, (0 << 0), "leftstick");
		set_mapping(32787, 2, (1 << 0), "rightx");
		set_mapping(32788, 3, (1 << 0), "righty");
		set_mapping(32780, 5, (0 << 0), "rightstick");
		exit;
	}
	if ((os_type == os_ps4 || os_type == os_ps5) || (os_type == os_xboxone || os_type == os_gdk))
	{
		set_mapping(32781, 32781, (0 << 0), "dpup");
		set_mapping(32782, 32782, (0 << 0), "dpdown");
		set_mapping(32783, 32783, (0 << 0), "dpleft");
		set_mapping(32784, 32784, (0 << 0), "dpright");
		set_mapping(32778, 32778, (0 << 0), "start");
		set_mapping(32773, 32773, (0 << 0), "leftshoulder");
		set_mapping(32774, 32774, (0 << 0), "rightshoulder");
		set_mapping(32769, 32769, (0 << 0), "a");
		set_mapping(32770, 32770, (0 << 0), "b");
		set_mapping(32771, 32771, (0 << 0), "x");
		set_mapping(32772, 32772, (0 << 0), "y");
		set_mapping(32785, 32785, (1 << 0), "leftx");
		set_mapping(32786, 32786, (1 << 0), "lefty");
		set_mapping(32779, 32779, (0 << 0), "leftstick");
		set_mapping(32787, 32787, (1 << 0), "rightx");
		set_mapping(32788, 32788, (1 << 0), "righty");
		set_mapping(32780, 32780, (0 << 0), "rightstick");
		if (os_type == os_ps4 || os_type == os_ps5)
		{
			set_mapping(32775, 4, (1 << 0), "lefttrigger");
			set_mapping(32776, 5, (1 << 0), "righttrigger");
			set_mapping(32777, 32777, (0 << 0), "touchpad");
			exit;
		}
		set_mapping(32775, 32775, (1 << 0), "lefttrigger");
		set_mapping(32776, 32776, (1 << 0), "righttrigger");
		set_mapping(32777, 32777, (0 << 0), "back");
		exit;
	}
	if (blacklisted)
	{
		var _a = variable_struct_get_names(_global.__sdl2_look_up_table);
		var _i = 0;
		repeat (array_length(_a))
		{
			set_mapping(variable_struct_get(_global.__sdl2_look_up_table, array_get(_a, _i)), 0, undefined, _a[_i]);
			_i++;
		}
		exit;
	}
	if (os_type == os_gxgames)
	{
		set_mapping(32769, 0, (0 << 0), "a");
		set_mapping(32770, 1, (0 << 0), "b");
		set_mapping(32771, 12, (0 << 0), "x");
		set_mapping(32772, 13, (0 << 0), "y");
		set_mapping(32773, 6, (0 << 0), "leftshoulder");
		set_mapping(32774, 9, (0 << 0), "rightshoulder");
		set_mapping(32775, 14, (0 << 0), "lefttrigger");
		set_mapping(32776, 15, (0 << 0), "righttrigger");
		set_mapping(32777, 11, (0 << 0), "back");
		set_mapping(32778, 8, (0 << 0), "start");
		set_mapping(32779, 7, (0 << 0), "leftstick");
		set_mapping(32780, 10, (0 << 0), "rightstick");
		set_mapping(32781, 5, (0 << 0), "dpup");
		set_mapping(32782, 2, (0 << 0), "dpdown");
		set_mapping(32783, 3, (0 << 0), "dpleft");
		set_mapping(32784, 4, (0 << 0), "dpright");
		set_mapping(32785, 0, (1 << 0), "leftx");
		set_mapping(32786, 1, (1 << 0), "lefty");
		set_mapping(32787, 2, (1 << 0), "rightx");
		set_mapping(32788, 3, (1 << 0), "righty");
		exit;
	}
	if (false || os_type == os_gxgames)
	{
		set_mapping(32769, 0, (0 << 0), "a");
		set_mapping(32770, 1, (0 << 0), "b");
		set_mapping(32771, 2, (0 << 0), "x");
		set_mapping(32772, 3, (0 << 0), "y");
		set_mapping(32773, 4, (0 << 0), "leftshoulder");
		set_mapping(32774, 5, (0 << 0), "rightshoulder");
		set_mapping(32775, 6, (0 << 0), "lefttrigger");
		set_mapping(32776, 7, (0 << 0), "righttrigger");
		set_mapping(32777, 8, (0 << 0), "back");
		set_mapping(32778, 9, (0 << 0), "start");
		set_mapping(32779, 10, (0 << 0), "leftstick");
		set_mapping(32780, 11, (0 << 0), "rightstick");
		if (os_type == os_linux && false)
		{
			set_mapping(32784, 6, (1 << 0), "dpright").clamp_positive = true;
			set_mapping(32782, 7, (1 << 0), "dpdown").clamp_positive = true;
			var _mapping = set_mapping(32783, 6, (1 << 0), "dpleft");
			_mapping.clamp_negative = true;
			_mapping.reverse = true;
			_mapping = set_mapping(32781, 7, (1 << 0), "dpup");
			_mapping.clamp_negative = true;
			_mapping.reverse = true;
		}
		else
		{
			set_mapping(32781, 12, (0 << 0), "dpup");
			set_mapping(32782, 13, (0 << 0), "dpdown");
			set_mapping(32783, 14, (0 << 0), "dpleft");
			set_mapping(32784, 15, (0 << 0), "dpright");
		}
		set_mapping(32785, 0, (1 << 0), "leftx");
		set_mapping(32786, 1, (1 << 0), "lefty");
		set_mapping(32787, 2, (1 << 0), "rightx");
		set_mapping(32788, 3, (1 << 0), "righty");
		set_mapping(32889, 16, (0 << 0), "guide");
		if (simple_type == "ps4" || simple_type == "ps5")
			set_mapping(32891, 17, (0 << 0), "touchpad");
		else
			set_mapping(32890, 17, (0 << 0), "misc1");
		exit;
	}
	if (xinput)
	{
		set_mapping(32781, 0, (0 << 0), "dpup");
		set_mapping(32782, 1, (0 << 0), "dpdown");
		set_mapping(32783, 2, (0 << 0), "dpleft");
		set_mapping(32784, 3, (0 << 0), "dpright");
		set_mapping(32778, 4, (0 << 0), "start");
		set_mapping(32777, 5, (0 << 0), "back");
		set_mapping(32779, 6, (0 << 0), "leftstick");
		set_mapping(32780, 7, (0 << 0), "rightstick");
		set_mapping(32773, 8, (0 << 0), "leftshoulder");
		set_mapping(32774, 9, (0 << 0), "rightshoulder");
		set_mapping(32769, 12, (0 << 0), "a");
		set_mapping(32770, 13, (0 << 0), "b");
		set_mapping(32771, 14, (0 << 0), "x");
		set_mapping(32772, 15, (0 << 0), "y");
		set_mapping(32785, 0, (1 << 0), "leftx");
		set_mapping(32786, 1, (1 << 0), "lefty").reverse = true;
		set_mapping(32787, 2, (1 << 0), "rightx");
		set_mapping(32788, 3, (1 << 0), "righty").reverse = true;
		var _mapping_lt = set_mapping(32775, 4106, (1 << 0), "lefttrigger");
		var _mapping_rt = set_mapping(32776, 4107, (1 << 0), "righttrigger");
		if (is_numeric(__steam_handle))
			__xinput_trigger_range = 0.99609375;
		else
			__xinput_trigger_range = 0.24609375;
		_mapping_lt.scale = 1 / __xinput_trigger_range;
		_mapping_rt.scale = 1 / __xinput_trigger_range;
		exit;
	}
	if (os_type == os_windows && vendor == "5e04" && (product == "e002" || product == "fd02") && button_count == 17 && gamepad_axis_value(index, 1) == gamepad_axis_value(index, 2) && gamepad_axis_value(index, 4) == gamepad_axis_value(index, 5))
	{
		__input_trace("Setting Xbox One Wireless controller to alternate mapping. Trigger data unavailable.");
		set_mapping(32769, 0, (0 << 0), "a");
		set_mapping(32770, 1, (0 << 0), "b");
		set_mapping(32771, 3, (0 << 0), "x");
		set_mapping(32772, 4, (0 << 0), "y");
		set_mapping(32773, 6, (0 << 0), "leftshoulder");
		set_mapping(32774, 7, (0 << 0), "rightshoulder");
		set_mapping(32777, 15, (0 << 0), "back");
		set_mapping(32778, 11, (0 << 0), "start");
		set_mapping(32779, 13, (0 << 0), "leftstick");
		set_mapping(32780, 14, (0 << 0), "rightstick");
		set_mapping(32785, 0, (1 << 0), "leftx");
		set_mapping(32786, 1, (1 << 0), "lefty");
		set_mapping(32787, 3, (1 << 0), "rightx");
		set_mapping(32788, 4, (1 << 0), "righty");
		set_dpad_hat_mapping();
		set_mapping(32775, 0, undefined, "lefttrigger");
		set_mapping(32776, 0, undefined, "righttrigger");
		set_mapping(32889, 16, (0 << 0), "guide");
		exit;
	}
	if (raw_type == "CommunityStadia" && os_type == os_windows)
	{
		__input_trace("Setting default Stadia controller mapping");
		set_mapping(32769, 0, (0 << 0), "a");
		set_mapping(32770, 1, (0 << 0), "b");
		set_mapping(32771, 2, (0 << 0), "x");
		set_mapping(32772, 3, (0 << 0), "y");
		set_mapping(32773, 4, (0 << 0), "leftshoulder");
		set_mapping(32774, 5, (0 << 0), "rightshoulder");
		set_mapping(32779, 6, (0 << 0), "leftstick");
		set_mapping(32780, 7, (0 << 0), "rightstick");
		set_mapping(32777, 8, (0 << 0), "back");
		set_mapping(32778, 9, (0 << 0), "start");
		set_mapping(32889, 10, (0 << 0), "guide");
		set_mapping(32890, 14, (0 << 0), "misc1");
		set_dpad_hat_mapping();
		set_mapping(32785, 0, (1 << 0), "leftx");
		set_mapping(32786, 1, (1 << 0), "lefty");
		__stadia_trigger_test = true;
		set_mapping(32776, 11, (0 << 0), "righttrigger");
		set_mapping(32775, 12, (0 << 0), "lefttrigger");
		set_mapping(32787, 3, (1 << 0), "rightx");
		set_mapping(32788, 4, (1 << 0), "righty");
		exit;
	}
	if (raw_type == "CommunityGameCube" && vendor == "3412" && product == "adbe" && os_type == os_windows)
	{
		__input_trace("Setting GameCube adapter slot to alternate mapping");
		set_mapping(32769, 0, (0 << 0), "a");
		set_mapping(32771, 1, (0 << 0), "x");
		set_mapping(32770, 2, (0 << 0), "b");
		set_mapping(32772, 3, (0 << 0), "y");
		set_mapping(32774, 4, (0 << 0), "rightshoulder");
		set_mapping(32778, 7, (0 << 0), "start");
		set_mapping(32781, 8, (0 << 0), "dpup");
		set_mapping(32782, 9, (0 << 0), "dpdown");
		set_mapping(32783, 10, (0 << 0), "dpleft");
		set_mapping(32784, 11, (0 << 0), "dpright");
		set_mapping(32775, 2, (1 << 0), "lefttrigger").clamp_positive = true;
		set_mapping(32776, 5, (1 << 0), "righttrigger").clamp_positive = true;
		set_mapping(32785, 0, (1 << 0), "leftx");
		set_mapping(32786, 1, (1 << 0), "lefty");
		set_mapping(32787, 3, (1 << 0), "rightx");
		set_mapping(32788, 4, (1 << 0), "righty");
		exit;
	}
	if (raw_type == "AppleController" && guessed_type == false && os_type == os_windows)
	{
		__input_trace("Setting MFi controller mapping");
		set_mapping(32783, 0, (0 << 0), "dpleft");
		set_mapping(32782, 1, (0 << 0), "dpdown");
		set_mapping(32784, 2, (0 << 0), "dpright");
		set_mapping(32781, 3, (0 << 0), "dpup");
		set_mapping(32769, 4, (0 << 0), "a");
		set_mapping(32770, 5, (0 << 0), "b");
		set_mapping(32771, 6, (0 << 0), "x");
		set_mapping(32772, 7, (0 << 0), "y");
		set_mapping(32773, 8, (0 << 0), "leftshoulder");
		set_mapping(32774, 9, (0 << 0), "rightshoulder");
		set_mapping(32780, 10, (0 << 0), "rightstick");
		set_mapping(32779, 11, (0 << 0), "leftstick");
		set_mapping(32777, 13, (0 << 0), "back");
		set_mapping(32778, 14, (0 << 0), "start");
		set_mapping(32785, 0, (1 << 0), "leftx");
		set_mapping(32786, 1, (1 << 0), "lefty").reverse = true;
		set_mapping(32787, 2, (1 << 0), "rightx");
		set_mapping(32788, 3, (1 << 0), "righty").reverse = true;
		set_mapping(32775, 0, undefined, "lefttrigger");
		set_mapping(32776, 0, undefined, "righttrigger");
		set_mapping(32889, 12, (0 << 0), "guide");
		exit;
	}
	if (button_count == 22 && axis_count == 6 && hat_count == 0 && gamepad_get_mapping(index) == "no mapping" && os_type == os_macosx)
	{
		__input_trace("Overriding from \"no mapping\" on Mac");
		set_mapping(32769, 17, (0 << 0), "a");
		set_mapping(32770, 18, (0 << 0), "b");
		set_mapping(32771, 20, (0 << 0), "x");
		set_mapping(32772, 21, (0 << 0), "y");
		set_mapping(32779, 4, (0 << 0), "leftstick");
		set_mapping(32780, 5, (0 << 0), "rightstick");
		set_mapping(32776, 6, (0 << 0), "righttrigger");
		set_mapping(32775, 7, (0 << 0), "lefttrigger");
		set_mapping(32777, 8, (0 << 0), "back");
		set_mapping(32778, 10, (0 << 0), "start");
		set_mapping(32773, 13, (0 << 0), "leftshoulder");
		set_mapping(32774, 14, (0 << 0), "rightshoulder");
		set_mapping(32785, 0, (1 << 0), "leftx");
		set_mapping(32786, 1, (1 << 0), "lefty");
		set_mapping(32787, 2, (1 << 0), "rightx");
		set_mapping(32788, 3, (1 << 0), "righty");
		set_mapping(32889, 11, (0 << 0), "guide");
		set_mapping(32890, 16, (0 << 0), "misc1");
		exit;
	}
	if (vendor == "7e05" && product == "0920" && ((os_type == os_windows && button_count == 16 && axis_count == 4 && hat_count == 1) || (os_type == os_macosx && button_count == 24 && axis_count == 10 && hat_count == 1)))
	{
		__input_trace("Overriding mapping from Switch Pro to Joy-Con");
		set_mapping(32769, 0, (0 << 0), "a");
		set_mapping(32770, 1, (0 << 0), "b");
		set_mapping(32771, 2, (0 << 0), "x");
		set_mapping(32772, 3, (0 << 0), "y");
		set_mapping(32773, 4, (0 << 0), "leftshoulder");
		set_mapping(32774, 5, (0 << 0), "rightshoulder");
		set_mapping(32777, 8, (0 << 0), "back");
		set_mapping(32778, 9, (0 << 0), "start");
		set_mapping(32779, 10, (0 << 0), "leftstick");
		set_mapping(32780, 11, (0 << 0), "rightstick");
		set_mapping(32889, 12, (0 << 0), "guide");
		set_mapping(32890, 13, (0 << 0), "misc1");
		var _mapping = set_mapping(32785, 0, (3 << 0), "leftx");
		_mapping.raw_negative = 0;
		_mapping.raw_positive = 0;
		_mapping.hat_mask_negative = 8;
		_mapping.hat_mask_positive = 2;
		_mapping = set_mapping(32786, 0, (3 << 0), "lefty");
		_mapping.raw_negative = 0;
		_mapping.raw_positive = 0;
		_mapping.hat_mask_negative = 1;
		_mapping.hat_mask_positive = 4;
		exit;
	}
	if (raw_type == "CommunityAnnePro" && __input_global().__on_desktop)
	{
		if (!(os_type == os_macosx))
		{
			set_mapping(32775, 0, (1 << 0), "lefttrigger").extended_range = os_type == os_windows;
			set_mapping(32776, 1, (1 << 0), "righttrigger").extended_range = os_type == os_windows;
		}
		set_mapping(32785, 3, (1 << 0), "leftx");
		set_mapping(32773, 0, (0 << 0), "leftshoulder");
		set_mapping(32777, 1, (0 << 0), "back");
		set_mapping(32783, 2, (0 << 0), "dpleft");
		set_mapping(32781, 3, (0 << 0), "dpup");
		set_mapping(32782, 4, (0 << 0), "dpdown");
		set_mapping(32784, 5, (0 << 0), "dpright");
		set_mapping(32774, 6, (0 << 0), "rightshoulder");
		set_mapping(32778, 7, (0 << 0), "start");
		set_mapping(32770, 8, (0 << 0), "b");
		set_mapping(32772, 9, (0 << 0), "y");
		set_mapping(32769, 10, (0 << 0), "a");
		set_mapping(32771, 11, (0 << 0), "x");
		exit;
	}
	if (raw_type == "CommunityOuya" && os_type == os_macosx)
	{
		__input_trace("Setting Ouya controller mapping");
		set_mapping(32769, 1, (0 << 0), "a");
		set_mapping(32770, 6, (0 << 0), "b");
		set_mapping(32771, 3, (0 << 0), "x");
		set_mapping(32772, 5, (0 << 0), "y");
		set_mapping(32773, 7, (0 << 0), "leftshoulder");
		set_mapping(32774, 8, (0 << 0), "rightshoulder");
		set_mapping(32775, 15, (0 << 0), "lefttrigger");
		set_mapping(32776, 16, (0 << 0), "righttrigger");
		set_mapping(32779, 9, (0 << 0), "leftstick");
		set_mapping(32780, 10, (0 << 0), "rightstick");
		set_mapping(32781, 11, (0 << 0), "dpup");
		set_mapping(32784, 14, (0 << 0), "dpright");
		set_mapping(32782, 12, (0 << 0), "dpdown");
		set_mapping(32783, 13, (0 << 0), "dpleft");
		set_mapping(32889, 18, (0 << 0), "guide");
		set_mapping(32777, 0, undefined, "back");
		set_mapping(32778, 0, undefined, "start");
		set_mapping(32785, 0, undefined, "leftx");
		set_mapping(32786, 0, undefined, "lefty");
		set_mapping(32787, 0, undefined, "rightx");
		set_mapping(32788, 0, undefined, "righty");
		exit;
	}
	if (vendor == "8f0e" && product == "1330" && raw_type == "CommunityN64" && guessed_type == false && os_type == os_macosx)
	{
		__input_trace("Overriding mapping to N64");
		set_mapping(32769, 3, (0 << 0), "a");
		set_mapping(32770, 5, (0 << 0), "b");
		set_mapping(32773, 13, (0 << 0), "leftshoulder");
		set_mapping(32774, 15, (0 << 0), "rightshoulder");
		set_mapping(32775, 17, (0 << 0), "lefttrigger");
		set_mapping(32778, 19, (0 << 0), "start");
		set_mapping(32781, 25, (0 << 0), "dpup");
		set_mapping(32784, 27, (0 << 0), "dpright");
		set_mapping(32782, 29, (0 << 0), "dpdown");
		set_mapping(32783, 31, (0 << 0), "dpleft");
		set_mapping(32785, 1, (1 << 0), "leftx");
		set_mapping(32786, 3, (1 << 0), "lefty");
		set_mapping(32788, 5, (1 << 0), "righty");
		set_mapping(32787, 7, (1 << 0), "rightx").reverse = true;
		set_mapping(32776, 0, undefined, "righttrigger");
		set_mapping(32777, 0, undefined, "back");
		exit;
	}
	if (raw_type == "CommunityNeoGeoMini" && guessed_type == false && (os_type == os_linux || os_type == os_windows))
	{
		__input_trace("Overriding mapping to NeoGeo Mini");
		set_mapping(32769, 1, (0 << 0), "a");
		set_mapping(32770, 0, (0 << 0), "b");
		set_mapping(32771, 2, (0 << 0), "x");
		set_mapping(32772, 3, (0 << 0), "y");
		set_mapping(32777, 8, (0 << 0), "back");
		set_mapping(32778, 9, (0 << 0), "start");
		set_dpad_hat_mapping();
		exit;
	}
	if (vendor == "6325" && product == "7505" && raw_type == "CommunityN64" && guessed_type == false && (os_type == os_linux || os_type == os_windows))
	{
		__input_trace("Overriding mapping to N64");
		set_mapping(32769, 1, (0 << 0), "a");
		set_mapping(32770, 2, (0 << 0), "b");
		set_mapping(32778, 12, (0 << 0), "start");
		set_mapping(32773, 4, (0 << 0), "leftshoulder");
		set_mapping(32774, 5, (0 << 0), "rightshoulder");
		set_mapping(32775, 6, (0 << 0), "lefttrigger");
		set_mapping(32776, 7, (0 << 0), "righttrigger");
		set_dpad_hat_mapping();
		set_mapping(32785, 0, (1 << 0), "leftx").limited_range = os_type == os_linux;
		set_mapping(32786, 1, (1 << 0), "lefty").limited_range = os_type == os_linux;
		var _mapping = set_mapping(32787, undefined, (4 << 0), "rightx");
		_mapping.raw_negative = 3;
		_mapping.raw_positive = 8;
		_mapping = set_mapping(32788, undefined, (4 << 0), "righty");
		_mapping.raw_negative = 9;
		_mapping.raw_positive = 0;
		exit;
	}
	if (vendor == "7e05" && product == "1720" && raw_type == "CommunitySaturn" && guessed_type == false && os_type == os_linux)
	{
		if (__input_string_contains(description, "Genesis 3btn"))
		{
			__input_trace("Overriding mapping to Mega Drive 3b");
			set_mapping(32769, 1, (0 << 0), "a");
			set_mapping(32770, 0, (0 << 0), "b");
			set_mapping(32776, 5, (0 << 0), "righttrigger");
			set_mapping(32777, 7, (0 << 0), "back");
			set_mapping(32778, 9, (0 << 0), "start");
			set_dpad_hat_mapping();
			set_mapping(32889, 12, (0 << 0), "guide");
			exit;
		}
		else if (__input_string_contains(description, "Genesis 6btn"))
		{
			__input_trace("Overriding mapping to Mega Drive 6b");
			set_mapping(32769, 1, (0 << 0), "a");
			set_mapping(32770, 0, (0 << 0), "b");
			set_mapping(32771, 6, (0 << 0), "x");
			set_mapping(32772, 2, (0 << 0), "y");
			set_mapping(32774, 4, (0 << 0), "rightshoulder");
			set_mapping(32776, 5, (0 << 0), "righttrigger");
			set_mapping(32777, 7, (0 << 0), "back");
			set_mapping(32778, 9, (0 << 0), "start");
			set_dpad_hat_mapping();
			set_mapping(32889, 12, (0 << 0), "guide");
			exit;
		}
	}
	if (os_type == os_linux)
	{
		switch (raw_type)
		{
			case "HIDJoyConLeft":
				__input_trace("Overriding mapping to Joy-Con Left");
				set_mapping(32769, 9, (0 << 0), "a");
				set_mapping(32770, 8, (0 << 0), "b");
				set_mapping(32771, 7, (0 << 0), "x");
				set_mapping(32772, 10, (0 << 0), "y");
				set_mapping(32773, 2, (0 << 0), "leftshoulder");
				set_mapping(32774, 4, (0 << 0), "rightshoulder");
				set_mapping(32777, 5, (0 << 0), "back");
				set_mapping(32778, 0, (0 << 0), "start");
				set_mapping(32779, 6, (0 << 0), "leftstick");
				set_mapping(32785, 1, (1 << 0), "leftx").limited_range = true;
				var _mapping = set_mapping(32786, 0, (1 << 0), "lefty");
				_mapping.limited_range = true;
				_mapping.reverse = true;
				exit;
				break;
			case "HIDJoyConRight":
				__input_trace("Overriding mapping to Joy-Con Right");
				set_mapping(32769, 1, (0 << 0), "a");
				set_mapping(32770, 2, (0 << 0), "b");
				set_mapping(32771, 0, (0 << 0), "x");
				set_mapping(32772, 3, (0 << 0), "y");
				set_mapping(32777, 9, (0 << 0), "back");
				set_mapping(32778, 8, (0 << 0), "start");
				set_mapping(32773, 4, (0 << 0), "leftshoulder");
				set_mapping(32774, 6, (0 << 0), "rightshoulder");
				set_mapping(32779, 10, (0 << 0), "leftstick");
				var _mapping = set_mapping(32785, 1, (1 << 0), "leftx");
				_mapping.limited_range = true;
				_mapping.reverse = true;
				_mapping = set_mapping(32786, 0, (1 << 0), "lefty").limited_range == true;
				exit;
				break;
			case "HIDAtariVCSClassic":
				__input_trace("Overriding mapping to Atari VCS Classic");
				set_mapping(32769, 0, (0 << 0), "a");
				set_mapping(32770, 1, (0 << 0), "b");
				set_mapping(32777, 2, (0 << 0), "back");
				set_mapping(32778, 3, (0 << 0), "start");
				set_dpad_hat_mapping();
				set_mapping(32889, 4, (0 << 0), "guide");
				exit;
				break;
			case "HIDWiiRemote":
				__input_trace("Overriding mapping to Wii Remote");
				set_mapping(32783, 5, (0 << 0), "dpleft");
				set_mapping(32782, 6, (0 << 0), "dpdown");
				set_mapping(32781, 7, (0 << 0), "dpup");
				set_mapping(32784, 8, (0 << 0), "dpright");
				set_mapping(32769, 9, (0 << 0), "a");
				set_mapping(32770, 10, (0 << 0), "b");
				set_mapping(32773, 0, (0 << 0), "leftshoulder");
				set_mapping(32775, 1, (0 << 0), "lefttrigger");
				set_mapping(32777, 4, (0 << 0), "back");
				set_mapping(32778, 3, (0 << 0), "start");
				set_mapping(32889, 2, (0 << 0), "guide");
				exit;
				break;
			case "HIDWiiClassic":
				__input_trace("Overriding mapping to Wii Classic");
				set_mapping(32781, 11, (0 << 0), "dpup");
				set_mapping(32783, 12, (0 << 0), "dpleft");
				set_mapping(32782, 14, (0 << 0), "dpdown");
				set_mapping(32784, 13, (0 << 0), "dpright");
				set_mapping(32769, 1, (0 << 0), "a");
				set_mapping(32770, 0, (0 << 0), "b");
				set_mapping(32771, 3, (0 << 0), "x");
				set_mapping(32772, 2, (0 << 0), "y");
				set_mapping(32773, 4, (0 << 0), "leftshoulder");
				set_mapping(32774, 5, (0 << 0), "rightshoulder");
				set_mapping(32775, 6, (0 << 0), "lefttrigger");
				set_mapping(32776, 7, (0 << 0), "righttrigger");
				set_mapping(32777, 10, (0 << 0), "back");
				set_mapping(32778, 9, (0 << 0), "start");
				set_mapping(32889, 8, (0 << 0), "guide");
				exit;
				break;
		}
	}
	if (os_type == os_android)
	{
		switch (guid)
		{
			case "4e696e74656e646f2053776974636820":
				if (description == "Nintendo Switch Pro Controller")
				{
					set_mapping(32769, 0, (0 << 0), "a");
					set_mapping(32770, 1, (0 << 0), "b");
					set_mapping(32771, 2, (0 << 0), "x");
					set_mapping(32772, 3, (0 << 0), "y");
					set_mapping(32773, 9, (0 << 0), "leftshoulder");
					set_mapping(32774, 10, (0 << 0), "rightshoulder");
					set_mapping(32775, 17, (0 << 0), "lefttrigger");
					set_mapping(32776, 18, (0 << 0), "righttrigger");
					set_mapping(32779, 7, (0 << 0), "leftstick");
					set_mapping(32780, 8, (0 << 0), "rightstick");
					set_mapping(32777, 14, (0 << 0), "back");
					set_mapping(32778, 6, (0 << 0), "start");
					set_dpad_hat_mapping();
					set_mapping(32785, 0, (1 << 0), "leftx");
					set_mapping(32786, 1, (1 << 0), "lefty");
					set_mapping(32787, 2, (1 << 0), "rightx");
					set_mapping(32788, 3, (1 << 0), "righty");
					set_mapping(32890, 5, (0 << 0), "misc1");
					exit;
				}
				if (description == "Nintendo Switch Right Joy-Con")
				{
					set_mapping(32769, 1, (0 << 0), "a");
					set_mapping(32770, 2, (0 << 0), "b");
					set_mapping(32771, 0, (0 << 0), "x");
					set_mapping(32772, 3, (0 << 0), "y");
					set_mapping(32773, 9, (0 << 0), "leftshoulder");
					set_mapping(32774, 17, (0 << 0), "rightshoulder");
					set_mapping(32777, 5, (0 << 0), "back");
					set_mapping(32778, 6, (0 << 0), "start");
					set_mapping(32779, 8, (0 << 0), "leftstick");
					set_mapping(32785, 1, (1 << 0), "leftx").reverse = true;
					set_mapping(32786, 0, (1 << 0), "lefty");
					exit;
				}
				break;
			case "484a5a204d6179666c61736820576969":
				if (description == "HJZ Mayflash WiiU Pro Game Controller Adapter")
				{
					__input_trace("Setting WiiU Pro Adapter mapping");
					set_mapping(32771, 21, (0 << 0), "x");
					set_mapping(32769, 22, (0 << 0), "a");
					set_mapping(32770, 23, (0 << 0), "b");
					set_mapping(32772, 24, (0 << 0), "y");
					set_mapping(32773, 25, (0 << 0), "leftshoulder");
					set_mapping(32774, 26, (0 << 0), "rightshoulder");
					set_mapping(32775, 27, (0 << 0), "lefttrigger");
					set_mapping(32776, 28, (0 << 0), "righttrigger");
					set_mapping(32777, 29, (0 << 0), "back");
					set_mapping(32778, 30, (0 << 0), "start");
					set_mapping(32779, 31, (0 << 0), "leftstick");
					set_mapping(32780, 0, (0 << 0), "rightstick");
					set_dpad_hat_mapping();
					set_mapping(32785, 0, (1 << 0), "leftx");
					set_mapping(32786, 1, (1 << 0), "lefty");
					set_mapping(32787, 2, (1 << 0), "rightx");
					set_mapping(32788, 3, (1 << 0), "righty");
					exit;
				}
				if (description == "HJZ Mayflash Wiimote PC Adapter")
				{
					__input_trace("Setting DolphinBar mapping");
					set_mapping(32771, 21, (0 << 0), "x");
					set_mapping(32772, 22, (0 << 0), "y");
					set_mapping(32769, 23, (0 << 0), "a");
					set_mapping(32770, 24, (0 << 0), "b");
					set_mapping(32773, 25, (0 << 0), "leftshoulder");
					set_mapping(32774, 26, (0 << 0), "rightshoulder");
					set_mapping(32775, 27, (0 << 0), "lefttrigger");
					set_mapping(32776, 28, (0 << 0), "righttrigger");
					set_mapping(32777, 29, (0 << 0), "back");
					set_mapping(32778, 30, (0 << 0), "start");
					set_dpad_hat_mapping();
					set_mapping(32785, 0, (1 << 0), "leftx");
					set_mapping(32786, 1, (1 << 0), "lefty");
					set_mapping(32787, 2, (1 << 0), "rightx");
					set_mapping(32788, 3, (1 << 0), "righty");
					set_mapping(32889, 0, (0 << 0), "guide");
					exit;
				}
				break;
			case "64633735616665613536653363336132":
				if (description == "Retroid Pocket Controller")
				{
					__input_trace("Setting Retroid Pocket \"Retro mode\" mapping");
					set_mapping(32770, 0, (0 << 0), "b");
					set_mapping(32769, 1, (0 << 0), "a");
					set_mapping(32772, 2, (0 << 0), "y");
					set_mapping(32771, 3, (0 << 0), "x");
				}
				else
				{
					__input_trace("Setting Retroid Pocket \"Xbox mode\" mapping");
					set_mapping(32769, 0, (0 << 0), "a");
					set_mapping(32770, 1, (0 << 0), "b");
					set_mapping(32771, 2, (0 << 0), "x");
					set_mapping(32772, 3, (0 << 0), "y");
				}
				set_mapping(32778, 6, (0 << 0), "start");
				set_mapping(32779, 7, (0 << 0), "leftstick");
				set_mapping(32780, 8, (0 << 0), "rightstick");
				set_mapping(32773, 9, (0 << 0), "leftshoulder");
				set_mapping(32774, 10, (0 << 0), "rightshoulder");
				set_mapping(32777, 15, (0 << 0), "back");
				set_dpad_hat_mapping();
				set_mapping(32785, 0, (1 << 0), "leftx");
				set_mapping(32786, 1, (1 << 0), "lefty");
				set_mapping(32787, 2, (1 << 0), "rightx");
				set_mapping(32788, 3, (1 << 0), "righty");
				set_mapping(32775, 4, (1 << 0), "lefttrigger").extended_range = true;
				set_mapping(32776, 5, (1 << 0), "righttrigger").extended_range = true;
				set_mapping(32892, 19, (0 << 0), "paddle1");
				set_mapping(32893, 20, (0 << 0), "paddle2");
				exit;
				break;
			case "4a4a0000000000006d61743300000000":
			case "4a4a0000000000000000000000000000":
				__input_trace("Setting NeoGeo gamepad mapping");
				set_mapping(32769, 0, (0 << 0), "a");
				set_mapping(32770, 1, (0 << 0), "b");
				set_mapping(32771, 2, (0 << 0), "x");
				set_mapping(32772, 3, (0 << 0), "y");
				set_mapping(32773, 9, (0 << 0), "leftshoulder");
				set_mapping(32774, 10, (0 << 0), "rightshoulder");
				set_mapping(32777, 15, (0 << 0), "back");
				set_mapping(32778, 6, (0 << 0), "start");
				set_dpad_hat_mapping();
				exit;
				break;
		}
	}
	if (os_type == os_ios || os_type == os_tvos)
	{
		switch (raw_type)
		{
			case "SwitchJoyConPair":
			case "CommunityLikeSwitch":
				set_mapping(32769, 1, (0 << 0), "a");
				set_mapping(32770, 0, (0 << 0), "b");
				set_mapping(32771, 3, (0 << 0), "x");
				set_mapping(32772, 2, (0 << 0), "y");
				set_mapping(32773, 4, (0 << 0), "leftshoulder");
				set_mapping(32774, 5, (0 << 0), "rightshoulder");
				set_mapping(32775, 21, (0 << 0), "lefttrigger");
				set_mapping(32776, 22, (0 << 0), "righttrigger");
				set_mapping(32777, 25, (0 << 0), "back");
				set_mapping(32778, 6, (0 << 0), "start");
				set_mapping(32779, 24, (0 << 0), "leftstick");
				set_mapping(32780, 23, (0 << 0), "rightstick");
				set_mapping(32781, 7, (0 << 0), "dpup");
				set_mapping(32782, 8, (0 << 0), "dpdown");
				set_mapping(32783, 9, (0 << 0), "dpleft");
				set_mapping(32784, 10, (0 << 0), "dpright");
				set_mapping(32785, 0, (1 << 0), "leftx");
				set_mapping(32786, 1, (1 << 0), "lefty");
				set_mapping(32787, 2, (1 << 0), "rightx");
				set_mapping(32788, 3, (1 << 0), "righty");
				exit;
				break;
			case "SwitchJoyConLeft":
			case "SwitchJoyConRight":
				set_mapping(32769, 0, (0 << 0), "a");
				set_mapping(32770, 2, (0 << 0), "b");
				set_mapping(32771, 1, (0 << 0), "x");
				set_mapping(32772, 3, (0 << 0), "y");
				set_mapping(32773, 4, (0 << 0), "leftshoulder");
				set_mapping(32774, 5, (0 << 0), "rightshoulder");
				set_mapping(32777, 6, (0 << 0), "back");
				set_mapping(32778, 0, undefined, "start");
				var _mapping = set_mapping(32785, undefined, (4 << 0), "leftx");
				_mapping.raw_negative = 9;
				_mapping.raw_positive = 10;
				_mapping = set_mapping(32786, undefined, (4 << 0), "lefty");
				_mapping.raw_negative = 7;
				_mapping.raw_positive = 8;
				exit;
				break;
		}
	}
	if ((!(false || os_type == os_gxgames) && (__input_global().__on_desktop || os_type == os_android)) && true)
	{
		if (is_array(sdl2_definition))
		{
			var _i = 2;
			repeat (array_length(sdl2_definition) - 3)
			{
				var _entry = sdl2_definition[_i];
				var _pos = string_pos(":", _entry);
				var _entry_name = string_copy(_entry, 1, _pos - 1);
				var _entry_1 = string_delete(_entry, 1, _pos);
				var _output_negative = false;
				var _output_positive = false;
				if (string_char_at(_entry_name, 1) == "-")
				{
					_output_negative = true;
					_entry_name = string_delete(_entry_name, 1, 1);
				}
				else if (string_char_at(_entry_name, 1) == "+")
				{
					_output_positive = true;
					_entry_name = string_delete(_entry_name, 1, 1);
				}
				var _gm_constant = variable_struct_get(_global.__sdl2_look_up_table, _entry_name);
				if (_gm_constant == undefined)
				{
					__input_trace("Warning! Entry name \"", _entry_name, "\" not recognised (full string was \"", _entry, "\")");
				}
				else
				{
					var _input_invert = false;
					var _input_reverse = false;
					var _input_negative = false;
					var _input_positive = false;
					if (string_char_at(_entry_1, string_length(_entry_1)) == "~")
					{
						_entry_1 = string_delete(_entry_1, string_length(_entry_1), 1);
						if (_gm_constant == 32785 || _gm_constant == 32786 || _gm_constant == 32787 || _gm_constant == 32788)
							_input_reverse = true;
						else
							_input_invert = true;
					}
					var _raw_type = undefined;
					do
					{
						var _char = string_char_at(_entry_1, 1);
						_entry_1 = string_delete(_entry_1, 1, 1);
						switch (_char)
						{
							case "-":
								_input_negative = true;
								break;
							case "+":
								_input_positive = true;
								break;
							case "b":
								if (_output_negative || _output_positive)
									_raw_type = (4 << 0);
								else
									_raw_type = (0 << 0);
								break;
							case "a":
								if (_output_negative || _output_positive)
									_raw_type = (5 << 0);
								else
									_raw_type = (1 << 0);
								break;
							case "h":
								if (_output_negative || _output_positive)
									_raw_type = (3 << 0);
								else
									_raw_type = (2 << 0);
								break;
							default:
								__input_trace("Warning! Mapping entry could not be parsed (full string was \"", _entry, "\")");
								break;
						}
					}
					until (_raw_type != undefined);
					var _input_slot = floor(real(_entry_1));
					var _mapping = variable_struct_get(mapping_gm_to_raw, _gm_constant);
					if (_raw_type == (3 << 0))
					{
						if (_mapping == undefined)
							_mapping = set_mapping(_gm_constant, undefined, _raw_type, _entry_name);
						if (_output_negative)
							_mapping.raw_negative = _input_slot;
						else if (_output_positive)
							_mapping.raw_positive = _input_slot;
					}
					else if (_raw_type == (5 << 0))
					{
						if (_mapping == undefined)
							_mapping = set_mapping(_gm_constant, undefined, _raw_type, _entry_name);
						if (_output_negative)
						{
							_mapping.raw_negative = _input_slot;
							if (_input_negative)
								_mapping.negative_clamp_negative = true;
							if (_input_positive)
								_mapping.negative_clamp_positive = true;
						}
						else if (_output_positive)
						{
							_mapping.raw_positive = _input_slot;
							if (_input_negative)
								_mapping.positive_clamp_negative = true;
							if (_input_positive)
								_mapping.positive_clamp_positive = true;
						}
					}
					else if (_raw_type == (4 << 0))
					{
						if (_mapping == undefined)
							_mapping = set_mapping(_gm_constant, undefined, _raw_type, _entry_name);
						if (_output_negative)
							_mapping.raw_negative = _input_slot;
						else if (_output_positive)
							_mapping.raw_positive = _input_slot;
					}
					else
					{
						if (_mapping == undefined)
							_mapping = set_mapping(_gm_constant, _input_slot, _raw_type, _entry_name);
						else
							__input_trace("Warning! Mapping for \"", _entry, "\" is a redefinition of entry name \"", _entry_name, "\"");
						if (_input_invert)
							_mapping.invert = true;
						if (_input_reverse)
							_mapping.reverse = true;
						if (_input_negative)
							_mapping.clamp_negative = true;
						if (_input_positive)
							_mapping.clamp_positive = true;
					}
					if (_raw_type == (2 << 0) || _raw_type == (3 << 0))
					{
						var _hat_mask = floor(10 * abs(real(_entry_1) % 1));
						if (_raw_type == (2 << 0))
						{
							_mapping.hat_mask = _hat_mask;
						}
						else if (_raw_type == (3 << 0))
						{
							if (_output_negative)
								_mapping.hat_mask_negative = _hat_mask;
							else if (_output_positive)
								_mapping.hat_mask_positive = _hat_mask;
						}
					}
					if (_raw_type == (1 << 0) || _raw_type == (5 << 0))
					{
						var _is_directional = __input_axis_is_directional(_gm_constant);
						if (os_type == os_linux && _is_directional)
							_mapping.limited_range = true;
						else if (!(os_type == os_linux) && !_is_directional && gamepad_axis_count(index) >= _input_slot)
							_mapping.extended_range = true;
					}
				}
				_i++;
			}
			if (os_type == os_android && hat_count > 0 && (vendor + product) == "")
			{
				var _mapping = undefined;
				var _dpad_array = [32781, 32782, 32783, 32784];
				var _matched = 0;
				repeat (array_length(_dpad_array))
				{
					_mapping = variable_struct_get(mapping_gm_to_raw, array_get(_dpad_array, _matched));
					if (!is_struct(_mapping) || variable_struct_get(_mapping, "raw") != (11 + _matched))
						break;
					_matched++;
				}
				if (_matched == 4)
					set_dpad_hat_mapping();
			}
		}
		else
		{
			__input_trace("No SDL2 remapping available, falling back to GameMaker's mapping (", gamepad_get_mapping(index), ")");
		}
		if ((os_type == os_macosx || os_type == os_windows) && simple_type == "ps4" && raw_type != "XInputPS4Controller" && variable_struct_get(mapping_gm_to_raw, string(32891)) == undefined)
		{
			var _matched = 0;
			var _mapping = undefined;
			var _button_array = [32771, 32769, 32770, 32772];
			var _offset = (mac_cleared_mapping && os_type == os_macosx) ? 17 : 0;
			repeat (array_length(_button_array))
			{
				_mapping = variable_struct_get(mapping_gm_to_raw, string(_button_array[_matched]));
				if (!is_struct(_mapping) || variable_struct_get(_mapping, "raw") != (_matched + _offset))
					break;
				_matched++;
			}
			if (_matched == 4)
				set_mapping(32891, 13, (0 << 0), "touchpad");
		}
		if (raw_type == "CommunityOuya" && (os_type == os_windows || os_type == os_linux))
			set_mapping(32889, 15, (0 << 0), "guide");
		if (simple_type == "xbox one" && __input_string_contains(description, "Elite") && is_struct(variable_struct_get(mapping_gm_to_raw, string(32893))) && is_struct(variable_struct_get(mapping_gm_to_raw, string(32894))))
		{
			var _p2_mapping = variable_struct_get(mapping_gm_to_raw, string(32893)).raw;
			set_mapping(32893, variable_struct_get(mapping_gm_to_raw, string(32894)).raw, (0 << 0), "paddle2");
			set_mapping(32894, _p2_mapping, (0 << 0), "paddle3");
		}
	}
}
