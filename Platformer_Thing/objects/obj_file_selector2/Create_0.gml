y = 0;
selection = 0;
loading = 0;
scale = 1;
files = [];
files_truncated = [];
if (os_type == os_windows)
	filename = file_find_first("C:/Users/" + global.user + "/OnU/Screenshots/*.png", 0);
else
	filename = file_find_first(global.user + "/OnU/Screenshots/*.png", 0);
filename_truncated = string_copy(filename, 0, 20);
while (filename != "")
{
	array_push(files, filename);
	array_push(files_truncated, filename_truncated);
	filename = file_find_next();
	filename_truncated = string_copy(filename, 0, 20);
}
file_find_close();
instance_deactivate_object(obj_uploadmenu_main);
if (array_length(files) > 0)
{
	if (os_type == os_windows)
		scr = sprite_add("C:/Users/" + global.user + "/OnU/Screenshots/" + files[selection], 1, 0, 0, 0, 0);
	else
		scr = sprite_add(global.user + "/OnU/Screenshots/" + files[selection], 1, 0, 0, 0, 0);
}
else
{
	scr = -1;
}
if (scr != -1)
{
	var i = 1;
	while ((sprite_get_width(scr) * i) > 81)
	{
		scale = i;
		i -= 0.001;
	}
}
