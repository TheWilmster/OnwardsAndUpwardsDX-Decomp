function __input_restart()
{
	static _global = __input_global();
	
	_global.__restart_time = _global.__current_time;
	__input_clear_all();
}
