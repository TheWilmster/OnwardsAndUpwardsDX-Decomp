function return_controller_button_name(arg0)
{
	if (gamepad_is_connected(4))
	{
		if (arg0 == 32769)
		{
			if (global.controller_config == "xbox")
				return "#";
			else if (global.controller_config == "nintendo")
				return "$";
			else if (global.controller_config == "playstation")
				return "<";
			else if (global.jump_button == 32769)
				return "JUMP";
			else if (global.run_button == 32769)
				return "GRAPPLE";
			else if (global.pause_button == 32769)
				return "PAUSE";
			else if (global.respawn_button == 32769)
				return "RESPAWN";
		}
		if (arg0 == 32770)
		{
			if (global.controller_config == "xbox")
				return "$";
			else if (global.controller_config == "nintendo")
				return "#";
			else if (global.controller_config == "playstation")
				return "%";
			else if (global.jump_button == 32770)
				return "JUMP";
			else if (global.run_button == 32770)
				return "GRAPPLE";
			else if (global.pause_button == 32770)
				return "PAUSE";
			else if (global.respawn_button == 32770)
				return "RESPAWN";
		}
		if (arg0 == 32771)
		{
			if (global.controller_config == "xbox")
				return "<";
			else if (global.controller_config == "nintendo")
				return "=";
			else if (global.controller_config == "playstation")
				return "*";
			else if (global.jump_button == 32771)
				return "JUMP";
			else if (global.run_button == 32771)
				return "GRAPPLE";
			else if (global.pause_button == 32771)
				return "PAUSE";
			else if (global.respawn_button == 32771)
				return "RESPAWN";
		}
		if (arg0 == 32772)
		{
			if (global.controller_config == "xbox")
				return "=";
			else if (global.controller_config == "nintendo")
				return "<";
			else if (global.controller_config == "playstation")
				return "\\";
			else if (global.jump_button == 32772)
				return "JUMP";
			else if (global.run_button == 32772)
				return "GRAPPLE";
			else if (global.pause_button == 32772)
				return "PAUSE";
			else if (global.respawn_button == 32772)
				return "RESPAWN";
		}
		if (arg0 == 32773)
			return ">";
		if (arg0 == 32774)
			return "@";
		if (arg0 == 32775)
			return "^";
		if (arg0 == 32776)
			return "_";
		if (arg0 == 32778)
		{
			if (global.controller_config == "xbox")
				return "{";
			else if (global.controller_config == "nintendo")
				return "+";
			else if (global.controller_config == "playstation")
				return "OPTIONS";
		}
		if (arg0 == 32777)
		{
			if (global.controller_config == "xbox")
				return "}";
			else if (global.controller_config == "nintendo")
				return "-";
			else if (global.controller_config == "playstation")
				return "}";
		}
	}
	else
	{
		if (arg0 == 32769)
			return "#";
		if (arg0 == 32770)
			return "$";
		if (arg0 == 32771)
			return "<";
		if (arg0 == 32772)
			return "=";
		if (arg0 == 32773)
			return ">";
		if (arg0 == 32774)
			return "@";
		if (arg0 == 32775)
			return "^";
		if (arg0 == 32776)
			return "_";
		if (arg0 == 32778)
			return "{";
		if (arg0 == 32777)
			return "}";
	}
}
