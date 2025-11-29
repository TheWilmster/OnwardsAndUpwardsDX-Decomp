if (hue == 255)
	hue = 0;
else
	hue += 0.1;
if (input_check_pressed("left"))
{
	if (xselection > 0)
		xselection -= 1;
}
if (input_check_pressed("right"))
{
	if (xselection < 9)
		xselection += 1;
}
if (input_check_pressed("up"))
{
	if (yselection > 0)
		yselection -= 1;
}
if (input_check_pressed("down"))
{
	if (yselection < 3)
		yselection += 1;
}
if (input_check_pressed("face_a"))
{
	switch (xselection)
	{
		case 0:
			switch (yselection)
			{
				case 0:
					if (shift == 1)
						my_string += "!";
					else
						my_string += "1";
					break;
				case 1:
					if (shift == 1)
						my_string += "Q";
					else
						my_string += "q";
					break;
				case 2:
					if (shift == 1)
						my_string += "A";
					else
						my_string += "a";
					break;
				case 3:
					if (shift == 1)
						my_string += "Z";
					else
						my_string += "z";
					break;
			}
			break;
		case 1:
			switch (yselection)
			{
				case 0:
					if (shift == 1)
						my_string += "@";
					else
						my_string += "2";
					break;
				case 1:
					if (shift == 1)
						my_string += "W";
					else
						my_string += "w";
					break;
				case 2:
					if (shift == 1)
						my_string += "S";
					else
						my_string += "s";
					break;
				case 3:
					if (shift == 1)
						my_string += "X";
					else
						my_string += "x";
					break;
			}
			break;
		case 2:
			switch (yselection)
			{
				case 0:
					if (shift == 1)
						my_string += "#";
					else
						my_string += "3";
					break;
				case 1:
					if (shift == 1)
						my_string += "E";
					else
						my_string += "e";
					break;
				case 2:
					if (shift == 1)
						my_string += "D";
					else
						my_string += "d";
					break;
				case 3:
					if (shift == 1)
						my_string += "C";
					else
						my_string += "c";
					break;
			}
			break;
		case 3:
			switch (yselection)
			{
				case 0:
					if (shift == 1)
						my_string += "$";
					else
						my_string += "4";
					break;
				case 1:
					if (shift == 1)
						my_string += "R";
					else
						my_string += "r";
					break;
				case 2:
					if (shift == 1)
						my_string += "F";
					else
						my_string += "f";
					break;
				case 3:
					if (shift == 1)
						my_string += "V";
					else
						my_string += "v";
					break;
			}
			break;
		case 4:
			switch (yselection)
			{
				case 0:
					if (shift == 1)
						my_string += "%";
					else
						my_string += "5";
					break;
				case 1:
					if (shift == 1)
						my_string += "T";
					else
						my_string += "t";
					break;
				case 2:
					if (shift == 1)
						my_string += "G";
					else
						my_string += "g";
					break;
				case 3:
					if (shift == 1)
						my_string += "B";
					else
						my_string += "b";
					break;
			}
			break;
		case 5:
			switch (yselection)
			{
				case 0:
					if (shift == 1)
						my_string += "^";
					else
						my_string += "6";
					break;
				case 1:
					if (shift == 1)
						my_string += "Y";
					else
						my_string += "y";
					break;
				case 2:
					if (shift == 1)
						my_string += "H";
					else
						my_string += "h";
					break;
				case 3:
					if (shift == 1)
						my_string += "N";
					else
						my_string += "n";
					break;
			}
			break;
		case 6:
			switch (yselection)
			{
				case 0:
					if (shift == 1)
						my_string += "&";
					else
						my_string += "7";
					break;
				case 1:
					if (shift == 1)
						my_string += "U";
					else
						my_string += "u";
					break;
				case 2:
					if (shift == 1)
						my_string += "J";
					else
						my_string += "j";
					break;
				case 3:
					if (shift == 1)
						my_string += "M";
					else
						my_string += "m";
					break;
			}
			break;
		case 7:
			switch (yselection)
			{
				case 0:
					if (shift == 1)
						my_string += "'";
					else
						my_string += "8";
					break;
				case 1:
					if (shift == 1)
						my_string += "I";
					else
						my_string += "i";
					break;
				case 2:
					if (shift == 1)
						my_string += "K";
					else
						my_string += "k";
					break;
				case 3:
					if (shift == 1)
						my_string += "-";
					else
						my_string += ".";
					break;
			}
			break;
		case 8:
			switch (yselection)
			{
				case 0:
					if (shift == 1)
						my_string += "(";
					else
						my_string += "9";
					break;
				case 1:
					if (shift == 1)
						my_string += "O";
					else
						my_string += "o";
					break;
				case 2:
					if (shift == 1)
						my_string += "L";
					else
						my_string += "l";
					break;
				case 3:
					if (shift == 1)
					{
						if (obj_namer.mode != 3)
						{
							if (os_type != os_windows)
							{
								my_string += ":";
							}
							else
							{
								audio_play_sound(sfx_error, 0, 0);
								global.show_error_message = 300;
								global.error_message = "Using Windows!";
							}
						}
						else
						{
							my_string += ":";
						}
					}
					else
					{
						my_string += "_";
					}
					break;
			}
			break;
		case 9:
			switch (yselection)
			{
				case 0:
					if (shift == 1)
						my_string += ")";
					else
						my_string += "0";
					break;
				case 1:
					if (shift == 1)
						my_string += "P";
					else
						my_string += "p";
					break;
				case 2:
					if (shift == 1)
						shift = 0;
					else
						shift = 1;
					break;
				case 3:
					if (shift == 1)
					{
						my_string += ";";
					}
					else if (obj_namer.mode != 3)
					{
						if (os_type != os_windows)
						{
							my_string += "?";
						}
						else
						{
							audio_play_sound(sfx_error, 0, 0);
							global.show_error_message = 300;
							global.error_message = "Using Windows!";
						}
					}
					else
					{
						my_string += "?";
					}
					break;
			}
			break;
	}
}
if (input_check_pressed("face_b"))
{
	if (string_length(my_string) == 0)
		cancel = 1;
	else
		my_string = string_copy(my_string, 1, string_length(my_string) - 1);
}
if (input_check_pressed("face_y"))
	my_string += " ";
if (input_check_pressed("face_x"))
{
	if (shift == 1)
		shift = 0;
	else
		shift = 1;
}
if (input_check_pressed("pause"))
	done = 1;
if (input_check_pressed("respawn"))
	cancel = 1;
