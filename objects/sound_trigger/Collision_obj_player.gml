if global.panic && !global.disableescapemusic
	exit;
if scr_checkskin(checkskin.p_anton)
	exit;

if cam == noone or other.cam == cam
{
	obj_music_set.music_editor = asset_get_index(name)
	with obj_music
	{
		continuous = other.continuous
		alarm[0] = 1
	}
}
