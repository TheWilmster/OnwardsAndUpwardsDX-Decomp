function give_achievement(arg0)
{
	if (global.achievements[arg0] == 0)
	{
		global.achievements[arg0] = 1;
		instance_create_depth(0, 0, -100, obj_merit_obtained);
		json = json_stringify(global.achievements);
		buffer = buffer_create(1, buffer_grow, 1);
		buffer_write(buffer, buffer_string, json);
		buffer_save(buffer, "achievement.onuc");
		buffer_delete(buffer);
	}
}
