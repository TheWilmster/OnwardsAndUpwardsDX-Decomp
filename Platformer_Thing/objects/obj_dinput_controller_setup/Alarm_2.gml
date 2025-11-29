connection_successful = 0;
for (var i = 0; i < 1000; i++)
{
	if (gamepad_is_connected(i))
	{
		connection_successful = 1;
		global.gamepad = i;
	}
}
if (connection_successful == 1)
	room_goto_next();
else
	alarm[2] = 5;
