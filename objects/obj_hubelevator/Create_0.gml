sprite_index = spr_doorvisited
depth = 99

state = 0;
hub_array = [
	["FLOOR 2", hub_room2],
	["FLOOR 1", hub_room1],
	["ARCADE", hub_arcade],
]
targetDoor = "A";

if sugaryspire
	array_insert(hub_array, 0, ["SUGARY", hub_roomSP]);
if debug
	array_push(hub_array, ["TEST", rm_test]);
if room == hub_room1
	array_push(hub_array, ["TUTORIAL", PP_room1]);

sel = 0;
for(var i = 0; i < array_length(hub_array); i++)
{
	if room == hub_array[i][1]
	{
		sel = i;
		break;
	}
}

