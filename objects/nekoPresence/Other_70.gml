/// @description Capture async events from NekoPresence.
var ev_type = async_load[? "event_type"];

if ev_type == "DiscordReady"
{
	global.discord_initialized = true;
	ready = true;
	
	// create
	//rousr_dissonance_set_large_image("runner_icon");
	np_setpresence_more("", "", false);
	np_setpresence("", "", obj_drpc_updater.large, "");
}
