if (scr != -1)
	sprite_delete(scr);
instance_activate_object(obj_uploadmenu_main);
obj_uploadmenu_main.uploading_status = 0;
instance_destroy();
