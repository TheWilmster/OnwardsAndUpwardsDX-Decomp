function return_controller_button_name(arg0)
{
	if (gamepad_is_connected(4))
	{
		if (arg0 == gp_face1)
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
		if (arg0 == gp_face2)
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
		if (arg0 == gp_face3)
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
		if (arg0 == gp_face4)
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
		if (arg0 == gp_shoulderl)
			return ">";
		if (arg0 == gp_shoulderr)
			return "@";
		if (arg0 == gp_shoulderlb)
			return "^";
		if (arg0 == gp_shoulderrb)
			return "_";
		if (arg0 == gp_start)
		{
			if (global.controller_config == "xbox")
				return "{";
			else if (global.controller_config == "nintendo")
				return "+";
			else if (global.controller_config == "playstation")
				return "OPTIONS";
		}
		if (arg0 == gp_select)
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
		if (arg0 == gp_face1)
			return "#";
		if (arg0 == gp_face2)
			return "$";
		if (arg0 == gp_face3)
			return "<";
		if (arg0 == gp_face4)
			return "=";
		if (arg0 == gp_shoulderl)
			return ">";
		if (arg0 == gp_shoulderr)
			return "@";
		if (arg0 == gp_shoulderlb)
			return "^";
		if (arg0 == gp_shoulderrb)
			return "_";
		if (arg0 == gp_start)
			return "{";
		if (arg0 == gp_select)
			return "}";
	}
}
