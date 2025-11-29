function input_combo_params_get()
{
	static _global = __input_global();
	static _result = {};
	
	with (_global.__combo_params)
	{
		_result.reset = __reset;
		_result.side_on = __side_on;
		_result.forward_verb = __forward_verb;
		_result.counterclockwise_verb = __counterclockwise_verb;
		_result.backward_verb = __backward_verb;
		_result.clockwise_verb = __clockwise_verb;
		_result.reference_direction = __reference_direction;
	}
	return _result;
}
