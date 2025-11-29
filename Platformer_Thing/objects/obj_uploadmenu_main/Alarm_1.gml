exiting = 0;
if (global.selectionmenu == 0)
{
	instance_deactivate_object(obj_menu_revamped);
	new_item = steam_ugc_create_item(app_id, ugc_filetype_community);
	uploading_status = 1;
}
else if (global.selectionmenu == 1)
{
	instance_deactivate_object(obj_menu_revamped);
	selection = 0;
	uploading_status = 0;
}
