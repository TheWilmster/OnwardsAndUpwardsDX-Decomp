function save_level(arg0)
{
	try
	{
		lvldata = buffer_create(1, buffer_grow, 1);
		buffer_seek(lvldata, buffer_seek_start, 0);
		buffer_write(lvldata, buffer_string, global.description);
		buffer_write(lvldata, buffer_u8, global.validated);
		tilemap = layer_tilemap_get_id("Collision");
		for (var i = 0; i < 192; i++)
		{
			for (var j = 0; j < 320; j++)
				buffer_write(lvldata, buffer_u16, tilemap_get_at_pixel(tilemap, (j * 8) + 4, (i * 8) + 4));
		}
		tilemap = layer_tilemap_get_id("Decor");
		for (var i = 0; i < 192; i++)
		{
			for (var j = 0; j < 320; j++)
				buffer_write(lvldata, buffer_u16, tilemap_get_at_pixel(tilemap, (j * 8) + 4, (i * 8) + 4));
		}
		global.number = 0;
		with (obj_level_entity)
			global.number += 1;
		buffer_write(lvldata, buffer_u16, global.number);
		with (obj_level_entity)
		{
			buffer_write(other.lvldata, buffer_string, object_get_name(object_index));
			buffer_write(other.lvldata, buffer_u16, x);
			buffer_write(other.lvldata, buffer_u16, y);
			if (variable_instance_exists(self, "modestart"))
				buffer_write(other.lvldata, buffer_s8, modestart);
			else
				buffer_write(other.lvldata, buffer_s8, 100);
			if (variable_instance_exists(self, "siz"))
				buffer_write(other.lvldata, buffer_s8, siz);
			else
				buffer_write(other.lvldata, buffer_s8, 100);
			if (variable_instance_exists(self, "spd"))
				buffer_write(other.lvldata, buffer_s8, spd);
			else
				buffer_write(other.lvldata, buffer_s8, 100);
			buffer_write(other.lvldata, buffer_string, sprite_get_name(sprite_index));
			buffer_write(other.lvldata, buffer_u8, image_xscale * 4);
			buffer_write(other.lvldata, buffer_u8, image_yscale * 4);
		}
		buffer_write(lvldata, buffer_u8, obj_editor.bg_red);
		buffer_write(lvldata, buffer_u8, obj_editor.bg_green);
		buffer_write(lvldata, buffer_u8, obj_editor.bg_blue);
		buffer_write(lvldata, buffer_u8, obj_editor.music_track);
		buffer_write(lvldata, buffer_u8, global.preserve_flags);
		buffer_write(lvldata, buffer_u8, global.low_gravity);
		buffer_write(lvldata, buffer_u8, global.objective);
		buffer_write(lvldata, buffer_u8, global.objective_value);
		buffer_write(lvldata, buffer_u8, lives);
		window_set_caption("Onward and Upward! DX - " + arg0);
		buffer_save(lvldata, arg0);
		buffer_delete(lvldata);
		return 1;
	}
	catch (exception)
	{
		show_debug_message("CONGLATURATION !!! YOU GET EXCEPTION !!!");
		global.missing = "datasave";
		global.exception = exception.longMessage;
		global.stack = exception.stacktrace;
		global.whatfailed = arg0;
		room_goto(rm_error);
	}
}
