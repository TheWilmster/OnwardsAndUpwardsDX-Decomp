function set_fav_tile(_tile)
{
	if (!array_contains(fav_tiles, _tile))
	{
		fav_tile_set = 0;
		for (var i = 0; i < 10; i++)
		{
			if (fav_tile_set == 0)
			{
				if (fav_tiles[i] == 0)
				{
					fav_tiles[i] = _tile;
					fav_tile_set = 1;
					break;
				}
			}
		}
		if (fav_tile_set == 0)
		{
			audio_play_sound(sfx_error, 0, 0);
			global.show_error_message = 300;
			global.error_message = "Favourites are full!";
		}
	}
	else
	{
		fav_tile_set = 0;
		for (var i = 0; i < 10; i++)
		{
			if (fav_tile_set == 0)
			{
				if (fav_tiles[i] == _tile)
				{
					fav_tiles[i] = 0;
					fav_tile_set = 1;
					break;
				}
			}
		}
	}
}
