if ((place_meeting((x + 1), y, obj_player1) or place_meeting((x - 1), y, obj_player1)) && (obj_player1.state == states.barrel))
instance_destroy(other)