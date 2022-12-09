if !debug
{
	// exit level editor
	if !check_online() or gms_ini_game_read("game", "leveleditor") == false
	{
		event_perform(ev_alarm, 2);
		exit;
	}
}

// level editor shit here
enum reqtypes
{
	read_paging,
	read_level,
	tp_level,
	
	login,
	register,
	upload,
	rate_level,
	delete_level,
	user_info
}
enum menutypes
{
	menustart,
	menuonline,
	
	levelbrowser,
	leveldetails,
	
	login,
	register,
	upload,
	vote,
	listfiles,
	userinfo,
	choosegameplay,
	warngameplay
}

records = undefined; // the level listing
showmissingchar = false;

yview = 0; // scrolling
yviewmax = 0;

menu = menutypes.menustart;

message = ""; // text at top
showtext = false;
xi = 960 / 2;
yi = -50;

page = 1;
paging_type = 3; // 0 for browse, 1 for featured, 2 for search, 3 for alternate
pagelast = 0;

request = ""; // the http request sent
requestype = 0;

loading = false; // loading wheelie thing
loadingrotation = 0;
scrolling = false;
viewpos = 0;

// search button
searchstring = "";
searchstring_real = "";
selectedsearch = false;

cooldown = 0;
textboxes = ds_map_create();

// password button
passwordstring = "";
selectedpassword = false;
registering = false;
passconfirm1 = "";

if check_online()
	gms_chat_toggle(false);
loginback = -1;

// etc
textline = false;
deletion_confirm = 0;

response = "";
map = undefined;

// level details
level_id = undefined;
level_name = undefined;
level_desc = undefined;
level_string = undefined;
level_userid = undefined;
level_author = undefined;
level_created = undefined;
level_category = undefined;

// user details
user_name = undefined;
user_lastlogin = undefined;
user_created = undefined;
user_admin = undefined;

// login status
if !variable_global_exists("auth")
	global.auth = "";
userid = -1;

// level verification
gmsroom = -1;
loadlist = [];
gameplay_store = global.gameplay;
gameplay_chosen = -1;

// other shit
with obj_player
	state = states.titlescreen;

global.pizzacoinstart = global.pizzacoin;
alarm[2] = 10;