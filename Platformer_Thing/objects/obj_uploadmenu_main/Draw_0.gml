draw_set_colour(c_white);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_font(global.font_normal);
if (uploading_status == 0)
{
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_text_ext(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + 4, "In order to upload levels to Steam Workshop, you'll need to accept the Workshop Terms of Service.", 8, 160);
}
else if (uploading_status == 1 || uploading_status == 2)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 72, "Uploading now...");
}
else if (uploading_status == 3)
{
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_text_ext(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + 4, "Success! Would you like to view your Workshop page?", 8, 160);
}
else if (uploading_status == 4)
{
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_text(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + 4, "Failed!\nStatus code: " + string(success) + "\n" + return_steam_error_meaning(success));
}
else if (uploading_status == 5)
{
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_text(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + 4, "Failed!\nStatus code: " + string(success) + "\n" + return_steam_error_meaning(success));
}
else if (uploading_status == 6)
{
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_text_ext(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + 4, "Your level name contains symbols that aren't allowed to be used in Windows. You can't upload this to the Workshop.", 8, 160);
}
else if (uploading_status == 7)
{
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	draw_text_ext(camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + 4, "Level name:\n" + global.level_name + "\n\nDescription:\n" + desc + "\n\nSatisfied with this?", 8, 160);
}
draw_set_valign(fa_top);
