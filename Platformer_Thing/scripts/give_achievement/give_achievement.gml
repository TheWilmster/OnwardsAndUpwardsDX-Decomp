function give_achievement(_achievement_id)
{
	if (global.achievements[_achievement_id] == 0)
	{
		global.achievements[_achievement_id] = 1;
		instance_create_depth(0, 0, -100, obj_merit_obtained);
		json = json_stringify(global.achievements);
		buffer = buffer_create(1, buffer_grow, 1);
		buffer_write(buffer, buffer_string, json);
		buffer_save(buffer, "achievement.onuc");
		buffer_delete(buffer);
	}
}
