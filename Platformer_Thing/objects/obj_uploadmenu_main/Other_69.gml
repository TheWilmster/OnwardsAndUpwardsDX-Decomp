legal_agreement = ds_map_find_value(async_load, "legal_agreement_required");
if (legal_agreement == 0)
{
	event_id = ds_map_find_value(async_load, "id");
	if (event_id == new_item)
	{
		type = ds_map_find_value(async_load, "event_type");
		if (type == "ugc_create_item")
		{
			success = ds_map_find_value(async_load, "result");
			if (success == 1)
			{
				global.published_id = ds_map_find_value(async_load, "published_file_id");
				update_handle = steam_ugc_start_item_update(app_id, global.published_id);
				test = steam_ugc_set_item_title(update_handle, global.level_name);
				if (test == 0)
				{
					success = 252;
					uploading_status = 5;
					alarm[2] = 1;
				}
				test = steam_ugc_set_item_description(update_handle, global.description);
				if (test == 0)
				{
					success = 253;
					uploading_status = 5;
					alarm[2] = 1;
				}
				steam_ugc_set_item_visibility(update_handle, 0);
				if (os_type == os_windows)
					test = steam_ugc_set_item_preview(update_handle, "C:/Users/" + global.user + "/OnU/Screenshots/" + global.screenshot);
				else
					test = steam_ugc_set_item_preview(update_handle, global.user + "/OnU/Screenshots/" + global.screenshot);
				if (test == 0)
				{
					success = 254;
					uploading_status = 5;
					alarm[2] = 1;
				}
				tag = [];
				if (swears == 1)
					array_push(tag, "contains profanity");
				if (global.validated == 1)
					array_push(tag, "validated");
				if (tag != [])
					steam_ugc_set_item_tags(update_handle, tag);
				if (os_type == os_windows)
				{
					file_copy(global.level, "C:/Level/" + global.level_name);
					test = steam_ugc_set_item_content(update_handle, "C:/Level/");
				}
				else
				{
					file_copy(global.level, global.user + "/Level/" + global.level_name);
					test = steam_ugc_set_item_content(update_handle, global.user + "/Level/");
				}
				if (test == 0)
				{
					success = 255;
					uploading_status = 5;
					alarm[2] = 1;
				}
				if (uploading_status == 1)
				{
					selection = 0;
					uploading_status = 2;
					request_id = steam_ugc_submit_item_update(update_handle, "Onward and Upward DX level");
				}
				else
				{
					audio_play_sound(sfx_error, 0, 0);
				}
			}
			else
			{
				uploading_status = 4;
				alarm[2] = 1;
				audio_play_sound(sfx_error, 0, 0);
			}
		}
	}
	else
	{
		type = ds_map_find_value(async_load, "event_type");
		if (type == "ugc_update_item")
		{
			if (os_type == os_windows)
				directory_destroy("C:/Level");
			else
				directory_destroy(global.user + "/Level");
			success = ds_map_find_value(async_load, "result");
			if (success == 1)
			{
				uploading_status = 3;
				alarm[2] = 1;
				audio_play_sound(sfx_success, 0, 0);
			}
			else
			{
				uploading_status = 4;
				alarm[2] = 1;
				audio_play_sound(sfx_error, 0, 0);
			}
		}
	}
}
else if (uploading_status != 3)
{
	success = 251;
	uploading_status = 5;
	alarm[2] = 1;
	audio_play_sound(sfx_error, 0, 0);
}
