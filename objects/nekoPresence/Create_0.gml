/// @description Initialize Discord.
if instance_number(object_index) > 1
{
	instance_destroy();
	exit;
}
global.discord_initialized = false;

if !global.richpresence
{
	instance_destroy();
	exit;
}

#macro DISCORD_APP_ID "828220751810265098"
