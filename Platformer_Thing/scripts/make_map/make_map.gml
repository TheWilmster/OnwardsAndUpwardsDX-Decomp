function make_map(arg0)
{
	try
	{
		arg0 = buffer_create(100, buffer_grow, 2);
		tilemap = layer_tilemap_get_id("Collision");
		for (var i = 0; i < 96; i++)
		{
			for (var j = 0; j < 160; j++)
				buffer_write(arg0, buffer_u16, tilemap_get_at_pixel(tilemap, (j * 16) + 4, (i * 16) + 4));
		}
		return 1;
	}
	catch (exception)
	{
		show_debug_message("CONGLATURATION !!! YOU GET EXCEPTION !!!");
		global.missing = "generic";
		global.exception = exception.longMessage;
		global.stack = exception.stacktrace;
		global.whatfailed = exception.message;
		room_goto(rm_error);
	}
}
