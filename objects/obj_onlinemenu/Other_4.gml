// random background
ds_map_clear(textboxes);
if room == editor_entrance
{
	global.gameplay = gameplay_store;
	gmsroom = -1;
	if check_online()
		gms_chat_toggle(false);
	
	/*
	var lbg = layer_get_id("Backgrounds_1");
	var bg = layer_background_get_id(lbg);
	layer_background_blend(bg, c_white);
	layer_background_sprite(bg, choose(bg_space1));
	*/
}

if room != editor_entrance && room != custom_lvl_room && room != rank_room && room != timesuproom
	instance_destroy();
if (room == rank_room or room == timesuproom) && menu != -1
	instance_destroy();
