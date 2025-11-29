my_id = global.checkpoints;
global.checkpoints += 1;
if (global.no_death_mode == 1)
	instance_destroy();
last_checkpoint = 0;
