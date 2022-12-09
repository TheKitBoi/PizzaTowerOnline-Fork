/// @description maintenance
if (!check_online() or gms_ini_game_read("game", "leveleditor") == false)
&& !debug
{
	window_set_cursor(cr_default);
	scr_playerreset();
	with obj_player
		targetDoor = "B";
	room_goto(hub_outside2);
	
	instance_destroy();
}
