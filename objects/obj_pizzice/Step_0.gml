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


if state == states.stun && stunned > 100 && !birdcreated
{
	birdcreated = true
	with instance_create(x, y, obj_enemybird)
		ID = other.id
}

if state == states.idle or state == states.walk
	state = states.charge

var player = instance_nearest(x, y, obj_player);
if !hitboxcreate && state == states.charge && (!player or (player.state != states.mach3 && player.state != states.mach2 && player.state != states.handstandjump))
{
	hitboxcreate = true
	with instance_create(x, y, obj_forkhitbox)
	{
		sprite_index = spr_player_mask
		ID = other.id
	}
}

if state != states.stun
	birdcreated = false

//Flash
if (flash == true && alarm[2] <= 0) {
   alarm[2] = 0.15 * room_speed; // Flashes for 0.8 seconds before turning back to normal
}

if state != states.grabbed
	depth = 0

if state != states.stun 
	thrown = false


if !boundbox
{
	with instance_create(x,y,obj_baddiecollisionbox)
	{
		sprite_index = other.sprite_index
		mask_index = sprite_index
		baddieID = other.id
		other.boundbox = true
	}
}

