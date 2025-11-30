function load_level(_file_name)
{
	try
	{
		lvldata = buffer_load(_file_name);
		buffer_seek(lvldata, buffer_seek_start, 0);
		global.description = buffer_read(lvldata, buffer_string);
		global.validated = buffer_read(lvldata, buffer_u8);
		tilemap = layer_tilemap_get_id("Collision");
		for (var i = 0; i < 192; i++)
		{
			for (var j = 0; j < 320; j++)
			{
				tile = buffer_read(lvldata, buffer_u16);
				tilemap_set(tilemap, tile, j, i);
			}
		}
		tilemap = layer_tilemap_get_id("Decor");
		for (var i = 0; i < 192; i++)
		{
			for (var j = 0; j < 320; j++)
			{
				tile = buffer_read(lvldata, buffer_u16);
				tilemap_set(tilemap, tile, j, i);
			}
		}
		instance_destroy(obj_level_entity);
		global.number = buffer_read(lvldata, buffer_u16);
		for (var i = 0; i < global.number; i++)
		{
			readobj = buffer_read(lvldata, buffer_string);
			show_debug_message(readobj);
			readx = buffer_read(lvldata, buffer_u16);
			ready = buffer_read(lvldata, buffer_u16);
			inst = instance_create_layer(readx, ready, "Instances", asset_get_index(readobj));
			inst.modestart = buffer_read(lvldata, buffer_s8);
			show_debug_message(inst.modestart);
			inst.siz = buffer_read(lvldata, buffer_s8);
			inst.spd = buffer_read(lvldata, buffer_s8);
			spr = buffer_read(lvldata, buffer_string);
			show_debug_message(spr);
			inst.sprite_index = asset_get_index(spr);
			inst.image_xscale = buffer_read(lvldata, buffer_u8);
			inst.image_xscale /= 4;
			inst.image_yscale = buffer_read(lvldata, buffer_u8);
			inst.image_yscale /= 4;
		}
		obj_editor.bg_red = buffer_read(lvldata, buffer_u8);
		obj_editor.bg_green = buffer_read(lvldata, buffer_u8);
		obj_editor.bg_blue = buffer_read(lvldata, buffer_u8);
		obj_editor.music_track = buffer_read(lvldata, buffer_u8);
		global.preserve_flags = buffer_read(lvldata, buffer_u8);
		global.low_gravity = buffer_read(lvldata, buffer_u8);
		global.objective = buffer_read(lvldata, buffer_u8);
		global.objective_value = buffer_read(lvldata, buffer_u8);
		lives = buffer_read(lvldata, buffer_u8);
		buffer_delete(lvldata);
		window_set_caption("Onward and Upward! DX - " + _file_name);
		return 1;
	}
	catch (exception)
	{
		show_debug_message("CONGLATURATION !!! YOU GET EXCEPTION !!!");
		global.missing = "dataload";
		global.exception = exception.longMessage;
		global.stack = exception.stacktrace;
		global.whatfailed = _file_name;
		room_goto(rm_error);
	}
}
