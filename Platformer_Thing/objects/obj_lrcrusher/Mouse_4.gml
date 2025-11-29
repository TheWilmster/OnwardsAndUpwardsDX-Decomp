if (instance_exists(obj_editor))
{
	if (obj_editor.show_menu == 0 && obj_editor.show_tiles == 0)
	{
		if (global.selected_entity == id)
		{
			attribute += 1;
			if (attribute == 2)
				attribute = 0;
		}
		else
		{
			global.selected_entity = id;
		}
	}
}
