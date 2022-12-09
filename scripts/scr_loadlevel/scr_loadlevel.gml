/// @param {string} levelstring
function scr_loadlevel(argument0)
{
	var _wrapper = json_decode(argument0);
	
	// level doesn't even exist
	if _wrapper == -1
	{
		show_message(lang_string("editor.play.jsonfailed"));
		return -4;
	}
	
	var _list = ds_map_find_value(_wrapper, "ROOT");
	var _unsupported = ds_list_create();
	
	// root missing
	if _list == undefined
	{
		show_message(lang_string("editor.play.noroot"));
		ds_map_destroy(_wrapper);
		return -4;
	}
	
	// forbidden object list
	var _forbidden = ds_list_create();
	ds_list_add(_forbidden,
		obj_gms,
		obj_login,
		obj_onlinemenu,
		obj_editor_cursor,
		obj_otherplayer,
		obj_wc,
		nekoPresence,
		obj_drpc_updater,
		obj_player,
		obj_player1,
		obj_player2,
		
		obj_acceleratecurrent,
		obj_gravityrect,
		obj_taxiold,
		obj_antonball,
		obj_gmlive,
		obj_snickexf,
		obj_snickexg,
		obj_snickexh,
		obj_snickexi,
		obj_snickexgquill,
		obj_timeattackclock,
		obj_prelogin,
		obj_load,
		obj_disclaimer,
		obj_crashed,
		obj_mariohell,
		obj_arcadehub,
		obj_devdoor,
		obj_mariologgedin,
		obj_racemenu,
	);

	// start creating the level
	for (var i = 0; i < ds_list_size(_list); i++)
	{
		var _map = ds_list_find_value(_list, i); // find object map
		var _obj = ds_map_find_value(_map, "obj"); // get object name from map
	
		var _getobj = asset_get_index(_obj); // figure object index from name
		if _obj != undefined && ds_list_find_index(_forbidden, _getobj) == -1 // if object exists and isn't forbidden
		{
			if _getobj != -1 // if asset got a
			{
				// figure position for object
				var _x = ds_map_find_value(_map, "x");
				var _y = ds_map_find_value(_map, "y");
				
				if _x == undefined
					_x = 0;
				if _y == undefined
					_y = 0;
				
				// parent specific layers
				var lay = "Instances";
				switch object_get_parent(_getobj)
				{
					case obj_baddie:
						lay = "Enemies";
						break;
					case obj_tiles:
						lay = "Tile_obj";
						break;
				}
			
				// create the object
				with instance_create_layer(_x, _y, lay, _getobj)
				{
					__l_e_ = true; // specify the object is made here
				
					var _xscale = ds_map_find_value(_map, "image_xscale");
					var _yscale = ds_map_find_value(_map, "image_yscale");
					var _image = ds_map_find_value(_map, "image_index");
				
					if _xscale != undefined
						image_xscale = _xscale;
					if _yscale != undefined
						image_yscale = _yscale;
					if _image != undefined
					{
						image_index = _image;
						img_index = _image;
					}
				
					// object specific variables
					switch _obj
					{
						case "background_trigger":
							index = ds_map_find_value(_map, "index");
							hsp = ds_map_find_value(_map, "hsp");
							vsp = ds_map_find_value(_map, "vsp");
							break;
					
						case "sound_trigger":
							index = ds_map_find_value(_map, "index");
							continuous = ds_map_find_value(_map, "continuous");
							break;
					
						case "obj_escapetimer":
							minutes = ds_map_find_value(_map, "minutes");
							seconds = ds_map_find_value(_map, "seconds");
							disablemusic = ds_map_find_value(_map, "disablemusic");
							break;
					
						case "obj_baddiespawner_editor":
							xscale = ds_map_find_value(_map, "xscale");
							if is_undefined(xscale)
								xscale = -1;
							break;
					
						case "obj_door_editor":
						case "obj_keydoor_editor":
						case "obj_taxi_editor":
						case "obj_stopsign_editor":
						case "obj_boxofpizza_editor":
							index = ds_map_find_value(_map, "index");
							break;
					
						case "obj_teleporter_editor":
						case "obj_teleporter":
							start = ds_map_find_value(_map, "start");
							trigger = ds_map_find_value(_map, "trigger");
							break;
					
						case "obj_timedgateclock_editor":
							seconds = ds_map_find_value(_map, "seconds");
							minutes = ds_map_find_value(_map, "minutes");
							break;
					
						case "obj_surpriseenemy_editor":
							xscale = ds_map_find_value(_map, "xscale");
							trigger = ds_map_find_value(_map, "trigger");
							index = ds_map_find_value(_map, "index");
							break;
					
						case "obj_surpriseenemyarea_editor":
							trigger = ds_map_find_value(_map, "trigger");
							break;
					}
				}
			}
			else if ds_list_find_index(_unsupported, string(_obj)) == -1
				ds_list_add(_unsupported, string(_obj));
		}
		// detect forbidden objects
		else
			trace("FORBIDDEN OBJECT " + string(_obj));
	}

	// list unsupported objects
	if ds_list_size(_unsupported) != 0
	{
		var str = lang_string("editor.play.badobject") + "\n";
		for(i = 0; i < ds_list_size(_unsupported); i++)
			str += "\n" + ds_list_find_value(_unsupported, i);
	
		show_message(str);
		_wrapper = false;
	}
	
	// free ds lists
	ds_list_destroy(_forbidden);
	ds_list_destroy(_unsupported);

	// finally return the loaded json (ds map)
	ds_map_destroy(_wrapper);
	return _wrapper;
}
