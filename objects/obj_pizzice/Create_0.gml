event_inherited();

grav = 0.5;
hsp = 0;
vsp = 0;
movespeed = 6
state = states.charge
stunned = 0
alarm[0] = 150
roaming = true
collectdrop = 5
flying = false
straightthrow = false
cigar = false
cigarcreate = false
stomped = false
shot = false
thrown = false
reset = false
flash = false
landspr = spr_pizzice_walk
idlespr = spr_pizzice_walk
fallspr = spr_pizzice_walk
stunfallspr = spr_pizzice_stun
walkspr = spr_pizzice_walk
turnspr = spr_pizzice_walk
recoveryspr = spr_pizzice_walk
grabbedspr = spr_pizzice_stun
scaredspr = spr_pizzice_stun
image_xscale = -1
hp = 2
slapped = false
grounded = true
birdcreated = false
boundbox = false
hitboxcreate = false
spr_dead = spr_pizzice_dead
important = false
depth = 0
heavy = false

if global.gameplay == 0
{
	custom_death_fnc = function()
	{
		scr_sleep(50);
		repeat 3
			instance_create(x, y, obj_slapstar);
		repeat 3
			create_particle(x, y, particles.baddiegibs);
	
		with instance_create(x, y, obj_sausageman_dead)
			sprite_index = spr_pizzice_dead1;
		with instance_create(x, y, obj_sausageman_dead)
			sprite_index = spr_pizzice_dead2;
		
		if !important
			instance_create(x, y, obj_bangeffect);
	}
}
else
{
	landspr = spr_newpizzice_walk
	idlespr = spr_newpizzice_walk
	fallspr = spr_newpizzice_walk
	stunfallspr = spr_newpizzice_stun
	walkspr = spr_newpizzice_walk
	turnspr = spr_newpizzice_walk
	recoveryspr = spr_newpizzice_walk
	grabbedspr = spr_newpizzice_stun
	scaredspr = spr_newpizzice_stun
	spr_dead = spr_newpizzice_stun
}
