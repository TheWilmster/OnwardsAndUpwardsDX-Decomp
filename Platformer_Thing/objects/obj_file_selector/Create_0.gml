instance_deactivate_object(obj_menu_revamped);
y = 0;
selection = 0;
mode = 0;
global.foreign_level = 0;
files = [];
files_truncated = [];
steam_files = [];
steam_files_truncated = [];
steam_file_paths = [];
if (os_type == os_windows)
	filename = file_find_first("C:/Users/" + global.user + "/OnU/Levels/*.onul", 0);
else
	filename = file_find_first(global.user + "/OnU/Levels/*.onul", 0);
filename_truncated = string_copy(filename, 0, 20);
global.level_name = "";
while (filename != "")
{
	array_push(files, filename);
	array_push(files_truncated, filename_truncated);
	filename = file_find_next();
	filename_truncated = string_copy(filename, 0, 20);
}
file_find_close();
steam_list = ds_list_create();
info_map = ds_map_create();
steam_ugc_get_subscribed_items(steam_list);
for (var i = 0; i < ds_list_size(steam_list); i++)
{
	success = 0;
	success = steam_ugc_get_item_install_info(ds_list_find_value(steam_list, i), info_map);
	if (success == 1)
	{
		filename = ds_map_find_value(info_map, "folder");
		filename2 = file_find_first(filename + "/*.onul", 0);
		filename = filename + "/" + filename2;
		array_push(steam_file_paths, filename);
		filename = filename_name(filename);
		array_push(steam_files, filename);
		filename_truncated = string_copy(filename, 0, 20);
		array_push(steam_files_truncated, filename);
	}
}
