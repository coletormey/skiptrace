function scr_action(){
	
	// set player movement to 0 while taking action
	x_speed = 0;
	y_speed = 0;
	
	show_debug_message("entered action script");
	
	switch (global.equipmentMain) {
		default:
		if (sprite_index != spr_player_down_fist and direction_of_action == DOWN) {
			sprite_index = spr_player_down_fist;
			image_index = 0;
			mask_index = spr_player_down_fist_HB;
			ds_list_clear(hit_by_player_attack);
		} else if (sprite_index != spr_player_right_fist and direction_of_action == RIGHT) {
			sprite_index = spr_player_right_fist;
			image_index = 0;
			mask_index = spr_player_right_fist_HB;
			ds_list_clear(hit_by_player_attack);	
		} else if (sprite_index != spr_player_left_fist and direction_of_action == LEFT) {
			sprite_index = spr_player_left_fist;
			image_index = 0;
			mask_index = spr_player_left_fist_HB;
			ds_list_clear(hit_by_player_attack);
		} else if (sprite_index != spr_player_up_fist and direction_of_action == UP) {
			sprite_index = spr_player_up_fist;
			image_index = 0;
			mask_index = spr_player_up_fist_HB;
			ds_list_clear(hit_by_player_attack);
		} break;
	}
	
	
	//check for hits
	mask_index = global.equipment_main_hitboxes[direction_of_action]
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, obj_enemy_parent, hitByAttackNow, false);
	
	var breakableObjAttackNow = ds_list_create();
	var breakableObjHits = instance_place_list(x, y, obj_breakable_object, breakableObjAttackNow, false);
	
	
	if (hits > 0) {
		for (var i = 0; i < hits; i++) {
			// if this instance has not yet been hit by attack
			var hitID = hitByAttackNow[| i];
			if (ds_list_find_index(hit_by_player_attack, hitID) == -1) {
				ds_list_add(hit_by_player_attack, hitID);
				with (hitID) {
					//hitID.visible = false;
					hitID.hasBeenHit = true;
					hitID.alarm[3] = hitID.inputTimer;
					if (global.equipment_main != pointer_null) {
						hitID.instanceHealth -= global.equipment_main.strength;
					} else {hitID.instanceHealth -= 2;}
				}
			}
		}
	}
	if (breakableObjHits > 0) {
		for (var i = 0; i < breakableObjHits; i++) {
			// if this instance has not yet been hit by attack
			var hitID = breakableObjAttackNow[| i];
			if (ds_list_find_index(hit_by_player_attack, hitID) == -1) {
				ds_list_add(hit_by_player_attack, hitID);
				with (hitID) {
					hitID.hasBeenHit = true;
					hitID.collides_with_player = false;
					hitID.destroyed = true;
					scr_random_drop();
				}
			}
		}
	}
	
	
	
	
	
	ds_list_destroy(hitByAttackNow);
	ds_list_destroy(breakableObjAttackNow);
	
	if (scr_animation_end()) {
		face = direction_of_action;
		right_key = false;
		up_key = false;
		left_key = false;
		down_key = false;
		image_speed = 1;
		mask_index = spr_player_down;
		global.playerState = PLAYER_STATE.FREE;
	}
}
	
	
	