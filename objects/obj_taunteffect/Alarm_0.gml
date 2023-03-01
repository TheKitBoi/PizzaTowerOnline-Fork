alarm[0] = -1
if instance_exists(player) && player.character == "SP"
	sugary = true;
gms_instance_sync_var_add("sugary", sugary);
gms_instance_sync(self, is_onetime | isc_local);

