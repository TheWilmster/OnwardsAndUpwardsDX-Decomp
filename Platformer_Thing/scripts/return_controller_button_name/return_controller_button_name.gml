function return_controller_button_name(_gamepad_button)
{
	if (gamepad_is_connected(4))
	{
		if (_gamepad_button == gp_face1)
		{
			if (global.controller_config == "xbox")
				return "#";
			else if (global.controller_config == "nintendo")
				return "$";
			else if (global.controller_config == "playstation")
				return "<";
			else if (global.jump_button == gp_face1)
				return "JUMP";
			else if (global.run_button == gp_face1)
				return "GRAPPLE";
			else if (global.pause_button == gp_face1)
				return "PAUSE";
			else if (global.respawn_button == gp_face1)
				return "RESPAWN";
		}
		if (_gamepad_button == gp_face2)
		{
			if (global.controller_config == "xbox")
				return "$";
			else if (global.controller_config == "nintendo")
				return "#";
			else if (global.controller_config == "playstation")
				return "%";
			else if (global.jump_button == gp_face2)
				return "JUMP";
			else if (global.run_button == gp_face2)
				return "GRAPPLE";
			else if (global.pause_button == gp_face2)
				return "PAUSE";
			else if (global.respawn_button == gp_face2)
				return "RESPAWN";
		}
		if (_gamepad_button == gp_face3)
		{
			if (global.controller_config == "xbox")
				return "<";
			else if (global.controller_config == "nintendo")
				return "=";
			else if (global.controller_config == "playstation")
				return "*";
			else if (global.jump_button == gp_face3)
				return "JUMP";
			else if (global.run_button == gp_face3)
				return "GRAPPLE";
			else if (global.pause_button == gp_face3)
				return "PAUSE";
			else if (global.respawn_button == gp_face3)
				return "RESPAWN";
		}
		if (_gamepad_button == gp_face4)
		{
			if (global.controller_config == "xbox")
				return "=";
			else if (global.controller_config == "nintendo")
				return "<";
			else if (global.controller_config == "playstation")
				return "\\";
			else if (global.jump_button == gp_face4)
				return "JUMP";
			else if (global.run_button == gp_face4)
				return "GRAPPLE";
			else if (global.pause_button == gp_face4)
				return "PAUSE";
			else if (global.respawn_button == gp_face4)
				return "RESPAWN";
		}
		if (_gamepad_button == gp_shoulderl)
			return ">";
		if (_gamepad_button == gp_shoulderr)
			return "@";
		if (_gamepad_button == gp_shoulderlb)
			return "^";
		if (_gamepad_button == gp_shoulderrb)
			return "_";
		if (_gamepad_button == gp_start)
		{
			if (global.controller_config == "xbox")
				return "{";
			else if (global.controller_config == "nintendo")
				return "+";
			else if (global.controller_config == "playstation")
				return "OPTIONS";
		}
		if (_gamepad_button == gp_select)
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
		if (_gamepad_button == gp_face1)
			return "#";
		if (_gamepad_button == gp_face2)
			return "$";
		if (_gamepad_button == gp_face3)
			return "<";
		if (_gamepad_button == gp_face4)
			return "=";
		if (_gamepad_button == gp_shoulderl)
			return ">";
		if (_gamepad_button == gp_shoulderr)
			return "@";
		if (_gamepad_button == gp_shoulderlb)
			return "^";
		if (_gamepad_button == gp_shoulderrb)
			return "_";
		if (_gamepad_button == gp_start)
			return "{";
		if (_gamepad_button == gp_select)
			return "}";
	}
}
