if (room == room_inventoryScreen_1
	or room == room_inventoryScreen_2
	or room == room_inventoryScreen_3) 
{
	
	
	up_key = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
	down_key = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
	left_key = keyboard_check_pressed(vk_left) or keyboard_check_pressed(ord("A"));
	right_key = keyboard_check_pressed(vk_right) or keyboard_check_pressed(ord("D"));
	select_key_main = keyboard_check_pressed(vk_enter);
	select_key_secondary = keyboard_check_pressed(vk_space);
	return_key = keyboard_check_pressed(vk_tab);
	next_screen = keyboard_check_pressed(ord("E"));
	prev_screen = keyboard_check_pressed(ord("Q"));
	
	
	if (return_key) {
		menu_level = 0;
		position = 0;
		obj_player.is_viewing_inventory = false;
		var _prevRoom = obj_cameraManager.last_camera_info.last_room;
		global.playerState = PLAYER_STATE.FREE;
		room_goto(_prevRoom);
	}
	
	// controls for changing inventory screens
	switch (room) {
		case room_inventoryScreen_1: 
			// store number of options in equipable items
			options_length = array_length(option[menu_level]);
			if (next_screen){
				room_goto(room_inventoryScreen_2);
			} else if (prev_screen) {
				room_goto(room_inventoryScreen_3);
			}
			break;
		case room_inventoryScreen_2: 
			// store number of options in equipable items
			options_length = array_length(option_collectible[menu_level]);
			if (next_screen){
				room_goto(room_inventoryScreen_3);
			} else if (prev_screen) {
				room_goto(room_inventoryScreen_1);
			}
			break;
		case room_inventoryScreen_3: 
			if (next_screen){
				room_goto(room_inventoryScreen_1);
			} else if (prev_screen) {
				room_goto(room_inventoryScreen_2);
			}
			break;
		default: break;
	}

	// NAVIGATE MENU 

	position += right_key - left_key;
	if position >= options_length { position = 0 };
	if position < 0 { position = options_length - 1 };

	// relative to inventory layout, pressing down will count higher and move 
	// cursor down and up will count to lower numbers, while still moving cursor up
	if (down_key) {
		if (menu_level == 2) {
			menu_level = 0;
		} else {
			menu_level++;
		}
	} else if (up_key) {
		if (menu_level == 0) {
			menu_level = 2;
		} else {
			menu_level--;
		}
	}
	
	
	// SWAP PERMANENT_WEAPONs between inventory options and equipment_main
	/*if (select_key_main) {
		if (option[menu_level, position] == pointer_null) {
			if (global.equipment_main != pointer_null) {
				// set current item location in option array
				global.equipment_main.currentMenuLevel = menu_level;
				global.equipment_main.currentMenuPosition = position;
				
				// set current item 'equipped' value to false
				global.equipment_main.equipped = false;
				
				option[menu_level, position] = global.equipment_main;
				global.equipment_main = pointer_null;
			} else {option[menu_level, position] = global.equipment_main;}
		} else if (option[menu_level, position].itemType == ITEM_TYPE.PERMANENT_WEAPON) {
			
			
			if (global.equipment_main != pointer_null) {
				global.equipment_main.currentMenuLevel = menu_level;
				global.equipment_main.currentMenuPosition = position;
				global.equipment_main.equipped = false;
				
				var _temp = global.equipment_main;
				
				// set current item to item from inventory
				global.equipment_main = option[menu_level, position]; 
				
				option[menu_level, position] = _temp;
				// set new currnt item 'equipped' value to true
				global.equipment_main.equipped = true;
			} else {
				// set current item to item from inventory
				global.equipment_main = option[menu_level, position]; 
				option[menu_level, position] = pointer_null;
			}
			}
		
		// change hitbox to appropriate sprite
		if (global.equipment_main != pointer_null) {
			global.equipment_main_strength = global.equipment_main.strength;
			global.equipment_main_hitboxes[RIGHT] = global.equipment_main.mainWeaponRightHitbox;
			global.equipment_main_hitboxes[UP] = global.equipment_main.mainWeaponUpHitbox;
			global.equipment_main_hitboxes[DOWN] = global.equipment_main.mainWeaponDownHitbox;
			global.equipment_main_hitboxes[LEFT] = global.equipment_main.mainWeaponLeftHitbox;
		} else {
			global.equipment_main_hitboxes[RIGHT] = spr_ace_rightFist_HB;
			global.equipment_main_hitboxes[UP] = spr_ace_upFist_HB;
			global.equipment_main_hitboxes[DOWN] = spr_ace_downFist_HB;
			global.equipment_main_hitboxes[LEFT] = spr_ace_leftFist_HB;
		}
	}
	
		
	if (select_key_secondary) {
		if (option[menu_level, position] == pointer_null) {
			if (global.equipment_secondary != pointer_null) {
				// set current item location in option array
				global.equipment_secondary.currentMenuLevel = menu_level;
				global.equipment_secondary.currentMenuPosition = position;
				
				// set current item 'equipped' value to false
				global.equipment_secondary.equipped = false;
				
				option[menu_level, position] = global.equipment_secondary;
				global.equipment_secondary = pointer_null;
			} else {option[menu_level, position] = global.equipment_secondary;}
		} else if (option[menu_level, position].itemType == ITEM_TYPE.CONSUMABLE) {
			
			
			if (global.equipment_secondary != pointer_null) {
				global.equipment_secondary.currentMenuLevel = menu_level;
				global.equipment_secondary.currentMenuPosition = position;
				global.equipment_secondary.equipped = false;
				
				var _temp = global.equipment_secondary;
				
				// set current item to item from inventory
				global.equipment_secondary = option[menu_level, position]; 
				
				option[menu_level, position] = _temp;
				// set new currnt item 'equipped' value to true
				global.equipment_secondary.equipped = true;
			} else {
				// set current item to item from inventory
				global.equipment_secondary = option[menu_level, position]; 
				option[menu_level, position] = pointer_null;
			}
			}
		
		// change hitbox to appropriate sprite
		if (global.equipment_secondary != pointer_null) {
			global.equipment_secondary_strength = global.equipment_secondary.strength;
			global.equipment_secondary_hitboxes[RIGHT] = global.equipment_secondary.mainWeaponRightHitbox;
			global.equipment_secondary_hitboxes[UP] = global.equipment_secondary.mainWeaponUpHitbox;
			global.equipment_secondary_hitboxes[DOWN] = global.equipment_secondary.mainWeaponDownHitbox;
			global.equipment_secondary_hitboxes[LEFT] = global.equipment_secondary.mainWeaponLeftHitbox;
		} else {
			global.equipment_secondary_hitboxes[RIGHT] = spr_ace_rightFist_HB;
			global.equipment_secondary_hitboxes[UP] = spr_ace_upFist_HB;
			global.equipment_secondary_hitboxes[DOWN] = spr_ace_downFist_HB;
			global.equipment_secondary_hitboxes[LEFT] = spr_ace_leftFist_HB;
		}
	}
		*/
}