if (instance_exists(obj_player) && room != rm_demo && chaos_mode_init == 1)
{
	if (obj_player.pause == 0)
	{
		payload = irandom_range(0, 7);
		global.show_notification_message = 180;
		switch (payload)
		{
			case 0:
				global.jump_modifier = random_range(0.9, 3);
				global.notification_message = "Jump modifier x" + string(global.jump_modifier);
				break;
			case 1:
				global.speed_modifier = random_range(0.9, 3);
				global.notification_message = "Speed modifier x" + string(global.speed_modifier);
				break;
			case 2:
				global.grapple_modifier = random_range(0.9, 3);
				global.notification_message = "Grap. modifier x" + string(global.grapple_modifier);
				break;
			case 3:
				if (screen_burn == 0)
				{
					screen_burn = 1;
					global.notification_message = "Screen burn ON!";
				}
				else
				{
					screen_burn = 0;
					global.notification_message = "Screen burn OFF!";
				}
				break;
			case 4:
				if (global.money_magnet == 0)
				{
					global.money_magnet = 1;
					global.notification_message = "Money Magnet ON!";
				}
				else
				{
					global.money_magnet = 0;
					global.notification_message = "Money Magnet OFF!";
				}
				break;
			case 5:
				take_snapshot = 1;
				show_snapshot = 1;
				global.notification_message = "Snap!";
				break;
			case 6:
				if (global.blind_spot == 0)
				{
					global.blind_spot = 1;
					global.notification_message = "Blind Spot ON!";
				}
				else
				{
					global.blind_spot = 0;
					global.notification_message = "Blind Spot OFF!";
				}
				break;
			case 7:
				if (global.waugh == 0)
				{
					global.waugh = 1;
					global.notification_message = "Wauuugh Mode ON!";
				}
				else
				{
					global.waugh = 0;
					global.notification_message = "Wauuugh Mode OFF!";
				}
				break;
		}
	}
	if (room == rm_level1)
		alarm[0] = irandom_range(300, 1200);
	else if (room == rm_level2)
		alarm[0] = irandom_range(180, 900);
	else if (room == rm_level3)
		alarm[0] = irandom_range(120, 600);
	else if (room == rm_level4)
		alarm[0] = irandom_range(60, 300);
}
