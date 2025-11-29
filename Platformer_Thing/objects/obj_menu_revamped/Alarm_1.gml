selection = 0;
exiting = 0;
if (pass_argument != -1)
{
	inst = instance_create_depth(0, 0, 0, object_to_create);
	inst.arg = pass_argument;
}
else
{
	instance_create_depth(0, 0, 0, object_to_create);
}
x = 90;
hspeed = -3;
transition_mode = -1;
