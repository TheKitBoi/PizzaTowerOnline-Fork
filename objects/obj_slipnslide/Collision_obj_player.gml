if (!drop && !instance_exists(obj_pepperman)) or global.gameplay != 0
{
	with other
	{
		if scr_transformationcheck()
		{
			if global.gameplay == 0
			{
				if state == states.barrel
				{
					movespeed = 4
					sprite_index = spr_player_barrelslipnslide
					image_index = 0
					
					other.drop = true
					other.vsp = -5
				}
				else if state != states.slipnslide
				{
					sprite_index = spr_slipnslide
					other.drop = true
					other.vsp = -5
					state = states.slipnslide
					if movespeed < 12
						movespeed = 12
				}
			}
			else
			{
				scr_soundeffect(sfx_tumble2)
				
				sprite_index = spr_slipbanan1;
				other.drop = 1;
				vsp = -11;
				image_index = 0;
				state = states.slipbanan;
				movespeed += 2;
				if movespeed > 14
					movespeed = 14;
				instance_destroy(other);
			}
		}
	}
}

