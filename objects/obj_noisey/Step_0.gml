switch (state)
{
	case states.idle: scr_enemy_idle (); break;
	case states.charge: scr_enemy_charge (); break;
	case states.turn: scr_enemy_turn (); break;
	case states.walk: scr_enemy_walk (); break;
	case states.land: scr_enemy_land (); break;
	case states.hit: scr_enemy_hit (); break;
	case states.stun: scr_enemy_stun (); break;
	case states.pizzagoblinthrow: scr_pizzagoblin_throw (); break;
	// grabbed state here
}

if global.gameplay != 0
{
	walkspr = phase == 0 ? walkspr : spr_noisey_bouncefall;
	if state == states.walk && phase == 1
	{
		if grounded && sprite_index != spr_noisey_bounceland && vsp > 0
		{
			image_index = 0
			sprite_index = spr_noisey_bounceland
		}
		if sprite_index == spr_noisey_bounceland
		{
			if floor(image_index) >= image_number - 1
				sprite_index = spr_noisey_bouncefall
			if floor(image_index) == 4
				vsp = -6
		}
	}
	if lasthp != hp && phase == 0 && state == states.stun && grounded
	{
		lasthp = hp
		phase = 1
		stunned = 5
		killprotection = false
	}
	scr_scareenemy();
}
if state == states.stun && stunned > 100 && birdcreated = false
{
	birdcreated = true
	with instance_create(x, y, obj_enemybird)
		ID = other.id
}

if state != states.stun
	birdcreated = false

if !global.miniboss && room == strongcold_miniboss
	instance_destroy()

//Flash
if (flash == true && alarm[2] <= 0) {
   alarm[2] = 0.15 * room_speed; // Flashes for 0.8 seconds before turning back to normal
}



if !hitboxcreate && state == states.walk
{
	hitboxcreate = true
	with instance_create(x, y, obj_forkhitbox)
		ID = other.id
}

if state != states.grabbed
	depth = 0



if state != states.stun
	thrown = false

if !boundbox
{
	with instance_create(x, y, obj_baddiecollisionbox)
	{
		sprite_index = other.sprite_index
		mask_index = sprite_index
		baddieID = other.id
		other.boundbox = true
	}
}


