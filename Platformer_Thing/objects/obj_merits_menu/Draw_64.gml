display_set_gui_size(160, 144);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_white);
for (var i = 0; i < (12 + test); i++)
{
	if (global.achievements[i] == 0)
	{
		if (merit_locked[i] == 1)
		{
			if ((selection + scroll) == i)
				draw_sprite_ext(spr_achievement_menu_selection, 0, 8, (i * 44) + y, 1, 1, 0, c_dkgray, 1);
			else
				draw_sprite_ext(spr_achievement_menu_selection, 0, 8, (i * 44) + y, 1, 1, 0, c_black, 1);
			draw_set_font(fon_small);
			draw_text_ext(8, (i * 44) + y, "?????", 9, 144);
			draw_set_font(fon_tiny);
			draw_text_ext(8, (i * 44) + y + 8, "Merit is a secret.", 8, 144);
		}
		else
		{
			if ((selection + scroll) == i)
				draw_sprite_ext(spr_achievement_menu_selection, 0, 8, (i * 44) + y, 1, 1, 0, c_ltgray, 1);
			else
				draw_sprite_ext(spr_achievement_menu_selection, 0, 8, (i * 44) + y, 1, 1, 0, c_dkgray, 1);
			draw_set_font(fon_small);
			draw_text_ext(8, (i * 44) + y, merits[i], 9, 144);
			draw_set_font(fon_tiny);
			draw_text_ext(8, (i * 44) + y + 8, merit_descriptions[i], 8, 144);
		}
	}
	else if (merit_locked[i] == 1)
	{
		if ((selection + scroll) == i)
			draw_sprite_ext(spr_achievement_menu_selection, 0, 8, (i * 44) + y, 1, 1, 0, c_fuchsia, 1);
		else
			draw_sprite_ext(spr_achievement_menu_selection, 0, 8, (i * 44) + y, 1, 1, 0, c_purple, 1);
		draw_set_font(fon_small);
		draw_text_ext(8, (i * 44) + y, merits[i], 9, 144);
		draw_set_font(fon_tiny);
		draw_text_ext(8, (i * 44) + y + 8, merit_descriptions[i], 8, 144);
	}
	else
	{
		if ((selection + scroll) == i)
			draw_sprite_ext(spr_achievement_menu_selection, 0, 8, (i * 44) + y, 1, 1, 0, c_blue, 1);
		else
			draw_sprite_ext(spr_achievement_menu_selection, 0, 8, (i * 44) + y, 1, 1, 0, c_navy, 1);
		draw_set_font(fon_small);
		draw_text_ext(8, (i * 44) + y, merits[i], 9, 144);
		draw_set_font(fon_tiny);
		draw_text_ext(8, (i * 44) + y + 8, merit_descriptions[i], 8, 144);
	}
}
