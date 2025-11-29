draw_set_font(global.font);
draw_set_colour(c_white);
if (starting_menu != -1)
{
	menu_ypos = 144 - (menu_options * 12);
	for (var i = 0; i < menu_options; i++)
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		if ((menu_function[i] == "togglerequirement" && variable_global_get(menu_var_req[i]) != 1) || (menu_function[i] == "redirectrequirement" && variable_global_get(menu_var_req[i]) != 1) || (menu_function[i] == "roomrequirement" && variable_global_get(menu_var_req[i]) != 1))
		{
			if (selection == i)
			{
				draw_sprite_ext(spr_menu_selection, 0, x + 56, menu_ypos + (12 * i), 1, 1, 0, c_ltgray, 1);
				draw_set_colour(c_white);
				draw_text(x + 64, menu_ypos + (12 * i), menu_label[i]);
				draw_text_ext(0, 4, menu_description_locked[i], 8, 160);
			}
			else
			{
				draw_sprite_ext(spr_menu_selection, 1, x + 56, menu_ypos + (12 * i), 1, 1, 0, c_dkgray, 1);
				draw_set_colour(c_white);
				draw_text(x + 72, menu_ypos + (12 * i), menu_label[i]);
			}
		}
		else if (selection == i)
		{
			draw_sprite_ext(spr_menu_selection, 0, x + 56, menu_ypos + (12 * i), 1, 1, 0, c_blue, 1);
			draw_set_colour(c_white);
			draw_text(x + 64, menu_ypos + (12 * i), menu_label[i]);
			if (variable_global_get(menu_variable[i]) != undefined)
			{
				if (menu_function[i] == "toggle" || menu_function[i] == "togglerequirement")
				{
					if (variable_global_get(menu_variable[i]) == 1)
						draw_text_ext(0, 4, menu_description[i] + string(menu_toggle_true[i]), 8, 160);
					else
						draw_text_ext(0, 4, menu_description[i] + string(menu_toggle_false[i]), 8, 160);
				}
				else if (menu_function[i] != "variablenoshow" && menu_function[i] != "variableredirect")
				{
					draw_text_ext(0, 4, menu_description[i] + string(variable_global_get(menu_variable[i])), 8, 160);
					draw_text(x + 56, menu_ypos + (12 * i), "|" + menu_label[i] + "~");
				}
				else
				{
					draw_text_ext(0, 4, menu_description[i], 8, 160);
					draw_text(x + 56, menu_ypos + (12 * i), "|" + menu_label[i] + "~");
				}
			}
			else
			{
				draw_text_ext(0, 4, menu_description[i], 8, 160);
			}
		}
		else
		{
			draw_sprite_ext(spr_menu_selection, 1, x + 56, menu_ypos + (12 * i), 1, 1, 0, c_navy, 1);
			draw_set_colour(c_white);
			draw_text(x + 72, menu_ypos + (12 * i), menu_label[i]);
		}
	}
}
