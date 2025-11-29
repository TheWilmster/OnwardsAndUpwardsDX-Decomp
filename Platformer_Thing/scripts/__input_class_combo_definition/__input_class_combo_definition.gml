function __input_class_combo_definition(arg0, arg1, arg2) constructor
{
	static press = function(arg0)
	{
		array_push(__phase_array, 
		{
			__type: (0 << 0),
			__verb: arg0
		});
		return self;
	};
	
	static release = function(arg0)
	{
		array_push(__phase_array, 
		{
			__type: (1 << 0),
			__verb: arg0
		});
		return self;
	};
	
	static press_or_release = function(arg0)
	{
		array_push(__phase_array, 
		{
			__type: (2 << 0),
			__verb: arg0
		});
		return self;
	};
	
	static hold = function(arg0)
	{
		array_push(__phase_array, 
		{
			__type: (3 << 0),
			__verb: arg0
		});
		return self;
	};
	
	static charge = function(arg0, arg1 = 60)
	{
		array_push(__phase_array, 
		{
			__type: (4 << 0),
			__verb: arg0,
			__min_time: arg1
		});
		return self;
	};
	
	__name = arg0;
	__phase_timeout = arg1;
	__directional = arg2;
	__phase_array = [];
}
