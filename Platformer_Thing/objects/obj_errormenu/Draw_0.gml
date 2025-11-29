draw_set_colour(c_white);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_font(global.font_normal);
draw_set_valign(fa_middle);
if (global.missing == "goal")
{
	draw_text(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 72, "ERROR!\nThis level is\nmissing a\nGoal Flag.\n\nThis level cannot\nbe played.\n\n[OK]");
}
else if (global.missing == "start")
{
	draw_text(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 72, "ERROR!\nThis level is\nmissing a\nPlayer Start.\n\nThis level cannot\nbe played.\n\n[OK]");
}
else if (global.missing == "dataload")
{
	if (page == 0)
		draw_text_ext(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 72, "ERROR!\nUnexpected\nfailure while\nreading data.\n\nThe game must\nnow close.\n\n[OK]", 8, 160);
}
else if (global.missing == "datasave")
{
	if (page == 0)
		draw_text_ext(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 72, "ERROR!\nUnexpected\nfailure while\nwriting data.\n\nThe game must\nnow close.\n\n[OK]", 8, 160);
}
else
{
	draw_text_ext(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 72, "ERROR!\nAn exception\nhas occurred:\n" + global.whatfailed + "\n\nThe game must\nnow close.\n\n[OK]", 8, 160);
}
draw_set_valign(fa_top);
