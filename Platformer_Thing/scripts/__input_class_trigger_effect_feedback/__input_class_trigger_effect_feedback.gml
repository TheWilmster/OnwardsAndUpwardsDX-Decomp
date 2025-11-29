function __input_class_trigger_effect_feedback(arg0, arg1) constructor
{
	static __mode_name = "feedback";
	static __mode = (1 << 0);
	
	static __steam_get_state = function(arg0, arg1)
	{
		if (input_gamepad_value(arg0, arg1) >= (__params.position / 10))
			return (2 << 0);
		return (1 << 0);
	};
	
	static __apply_ps5 = function(arg0, arg1, arg2)
	{
		return ps5_gamepad_set_trigger_effect_feedback(arg0, arg1, __params.position, __params.strength * arg2);
	};
	
	__params = 
	{
		position: clamp(arg0 * 10, 0, 9),
		strength: clamp(arg1 * 8, 0, 8)
	};
}
