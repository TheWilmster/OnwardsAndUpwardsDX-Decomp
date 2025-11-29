function get_objective(arg0)
{
	switch (arg0)
	{
		case 1:
			if (arg0 == 0)
				return "Collect all coins.";
			else
				return "Collect " + string(global.objective_value) + " coins.";
			break;
		case 2:
			if (arg0 == 0)
				return "Touch every save point.";
			else
				return "Touch " + string(global.objective_value) + "\nsave points.";
			break;
		case 3:
			return "Finish without\njumping.";
			break;
		case 4:
			return "Finish without\nlanding after\nfalling.";
			break;
		case 5:
			return "Finish without\ngliding.";
			break;
		case 6:
			return "Finish without\ngrappling.";
			break;
		case 7:
			return "Finish without\ntouching moving\nobjects.";
			break;
		case 8:
			return "Finish within\n" + get_time_limit(global.objective_value) + ".";
			break;
	}
}
