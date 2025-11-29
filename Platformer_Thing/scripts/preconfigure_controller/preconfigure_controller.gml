function preconfigure_controller()
{
	if (string_char_at(global.controller_config, 1) == "1")
		global.jump_button = 32769;
	else if (string_char_at(global.controller_config, 1) == "2")
		global.jump_button = 32770;
	else if (string_char_at(global.controller_config, 1) == "3")
		global.jump_button = 32771;
	else if (string_char_at(global.controller_config, 1) == "4")
		global.jump_button = 32772;
	else if (string_char_at(global.controller_config, 1) == "5")
		global.jump_button = 32778;
	else if (string_char_at(global.controller_config, 1) == "6")
		global.jump_button = 32777;
	if (string_char_at(global.controller_config, 2) == "1")
		global.run_button = 32769;
	else if (string_char_at(global.controller_config, 2) == "2")
		global.run_button = 32770;
	else if (string_char_at(global.controller_config, 2) == "3")
		global.run_button = 32771;
	else if (string_char_at(global.controller_config, 2) == "4")
		global.run_button = 32772;
	else if (string_char_at(global.controller_config, 2) == "5")
		global.run_button = 32778;
	else if (string_char_at(global.controller_config, 2) == "6")
		global.run_button = 32777;
	if (string_char_at(global.controller_config, 3) == "1")
		global.pause_button = 32769;
	else if (string_char_at(global.controller_config, 3) == "2")
		global.pause_button = 32770;
	else if (string_char_at(global.controller_config, 3) == "3")
		global.pause_button = 32771;
	else if (string_char_at(global.controller_config, 3) == "4")
		global.pause_button = 32772;
	else if (string_char_at(global.controller_config, 3) == "5")
		global.pause_button = 32778;
	else if (string_char_at(global.controller_config, 3) == "6")
		global.pause_button = 32777;
	if (string_char_at(global.controller_config, 4) == "1")
		global.respawn_button = 32769;
	else if (string_char_at(global.controller_config, 4) == "2")
		global.respawn_button = 32770;
	else if (string_char_at(global.controller_config, 4) == "3")
		global.respawn_button = 32771;
	else if (string_char_at(global.controller_config, 4) == "4")
		global.respawn_button = 32772;
	else if (string_char_at(global.controller_config, 4) == "5")
		global.respawn_button = 32778;
	else if (string_char_at(global.controller_config, 4) == "6")
		global.respawn_button = 32777;
}
