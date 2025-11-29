function move_rec_tiles_down(arg0)
{
	for (var i = 10; i > 0; i -= 1)
		rec_tiles[i] = rec_tiles[i - 1];
	rec_tiles[0] = arg0;
}
