steam_list = ds_list_create();
steam_ugc_get_subscribed_items(steam_list);
if (ds_list_size(steam_list) > 0)
{
	if (!steam_get_achievement("ACH_SUBSCRIBE"))
		steam_set_achievement("ACH_SUBSCRIBE");
	give_achievement(7);
}
