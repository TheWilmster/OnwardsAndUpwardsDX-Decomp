draw_set_colour(c_black);
draw_set_alpha(0.5);
draw_rectangle(0, 0, 2560, 1536, false);
draw_set_colour(c_white);
draw_set_alpha(1);
if (perfect == 1 || global.cloud_perfect == 1)
	draw_sprite(spr_titleanim2, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));
else
	draw_sprite(spr_titleanim, 0, camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]));
draw_set_halign(fa_center);
draw_set_font(global.font);
if (input_player_get_gamepad() != -1)
{
	draw_text_ext(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 96, "Controller detected!", 8, 160);
	draw_text(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 120, "Press " + input_verb_get_icon("pause"));
}
else
{
	draw_text(camera_get_view_x(view_camera[0]) + 80, camera_get_view_y(view_camera[0]) + 120, "Press Space");
}
draw_set_halign(fa_right);
if (os_type == os_linux)
	draw_text(camera_get_view_x(view_camera[0]) + 160, camera_get_view_y(view_camera[0]) + 136, "v1.01l");
else
	draw_text(camera_get_view_x(view_camera[0]) + 160, camera_get_view_y(view_camera[0]) + 136, "v1.01");
