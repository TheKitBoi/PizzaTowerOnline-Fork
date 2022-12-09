mylayers = ["Tiles_Secret", "Tiles_Secret1", "Tiles_Secret2"];
if place_meeting(x, y, obj_player)
{
	alpha = 0;
	if !oneway
		done = true;
}
else if oneway
{
	with instance_create(x, y, obj_solid)
	{
		image_xscale = other.image_xscale;
		image_yscale = other.image_yscale;
	}
	done = true;
}

for(var i = 0; i < array_length(mylayers); i++)
{
	var mylayer = mylayers[i];
	if layer_exists(mylayer)
	{
		layer_depth(mylayer, (done ? 90 : -10) - i);
		layer_shader(mylayer, shd_layeralpha);
	}
}
