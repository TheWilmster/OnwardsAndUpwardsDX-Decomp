switch (chunk)
{
	case 0:
		draw_sprite_part(spr_lily_walk, 0, 0, 0, 8, 8, x, y);
		break;
	case 1:
		draw_sprite_part(spr_lily_walk, 0, 8, 0, 8, 8, x, y);
		break;
	case 2:
		draw_sprite_part(spr_lily_walk, 0, 0, 8, 8, 8, x, y);
		break;
	case 3:
		draw_sprite_part(spr_lily_walk, 0, 8, 8, 8, 8, x, y);
		break;
}
