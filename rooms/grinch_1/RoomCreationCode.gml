global.panic = true;
global.minutes = 2;
global.seconds = 59;
if global.modifier == mods.no_toppings
	global.minutes = 4;
global.wave = 0;
global.maxwave = (global.minutes * 60 + global.seconds) * 60;

with obj_camera
	alarm[1] = 60;

// eggplant timer
global.fill = ((minutes * 60 + seconds) * 60) * obj_chunktimer.fillrate;
with obj_tv
	chunkmax = global.fill

// don't hang the game on the room this sprite appears
sprite_prefetch(spr_grinch_grinch2);
