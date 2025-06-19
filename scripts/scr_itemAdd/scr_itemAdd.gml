function scr_itemAdd(_item, _type){
			switch (_type) {
			case ITEM_TYPE.PERMANENT_WEAPON:
				if (obj_itemManager.item_list.sword1.acquired == false) {
					obj_itemManager.item_list.sword1.acquired = true;
					array_push(global.item_inventory, _item);
				
			
				obj_itemManager.options_length++;
				
				
				if (global.equipment_main != pointer_null) {
					global.equipment_main.equipped = false;
					var _itemPlacedInOptions = false;
					for (var i = 0; i <= 2; i++) {
						for (var j = 0; j <= 4; j++) {
							if (obj_itemManager.option[i, j] == pointer_null 
							and _itemPlacedInOptions == false
							and obj_itemManager.options_length > 1) {
								global.equipment_main.currentMenuLevel = i;
								global.equipment_main.currentMenuPosition = j;
								obj_itemManager.option[i, j] = global.equipment_main;
								_itemPlacedInOptions = true;
							}
						}
					}
				}
				global.equipment_main = _item; 
				global.equipment_main.equipped = true;	
				global.equipment_main_strength += _item.strength;
				global.equipment_main_hitboxes[RIGHT] = item.mainWeaponRightHitbox;
				global.equipment_main_hitboxes[UP] = item.mainWeaponUpHitbox;
				global.equipment_main_hitboxes[DOWN] = item.mainWeaponDownHitbox;
				global.equipment_main_hitboxes[LEFT] = item.mainWeaponLeftHitbox;
				
				var _itemPlacedInOptions = false;
				for (var i = 0; i <= 2; i++) {
					for (var j = 0; j <= 4; j++) {
						if (obj_itemManager.option[i, j] == pointer_null 
						and _itemPlacedInOptions == false
						and obj_itemManager.options_length > 1
						and global.equipment_main.equipped == false) {
							global.equipment_main.currentMenuLevel = i;
							global.equipment_main.currentMenuPosition = j;
							obj_itemManager.option[i, j] = global.equipment_main;
							_itemPlacedInOptions = true;
						}
					}
				}
				}
				
				break;
			case ITEM_TYPE.CONSUMABLE:
				//global.equipment_secondary = _item;
				/*
				if (global.equipment_secondary != pointer_null) {
					global.equipment_secondary.equipped = false;
					var _itemPlacedInOptions = false;
					for (var i = 0; i <= 2; i++) {
						for (var j = 0; j <= 4; j++) {
							if (obj_itemManager.option[i, j] == pointer_null 
							and _itemPlacedInOptions == false
							and obj_itemManager.options_length > 1) {
								global.equipment_secondary.currentMenuLevel = i;
								global.equipment_secondary.currentMenuPosition = j;
								global.equipment_secondary.equipped = true;
								obj_itemManager.option[i, j] = global.equipment_secondary;
								_itemPlacedInOptions = true;
							}
						}
					}
				}
				*/
				switch (_item) {
					case obj_itemManager.item_list.bomb:
						if (obj_itemManager.item_list.bomb.acquired == false) {
							obj_itemManager.item_list.bomb.acquired = true;
							array_push(global.item_inventory, _item);
							var _itemPlacedInOptions = false;
							for (var i = 0; i <= 2; i++) {
								for (var j = 0; j <= 4; j++) {
									if (obj_itemManager.option[i, j] == pointer_null 
									and _itemPlacedInOptions == false)
									/*and global.equipment_secondary.equipped == false)*/ {
										_item.currentMenuLevel = i;
										_item.currentMenuPosition = j;
										obj_itemManager.option[i, j] = _item;
										_itemPlacedInOptions = true;
									}
								}
							}
							global.numberOfBombs += 1;
						} else {global.numberOfBombs += 1;}
				
				}
				
				break;
			case ITEM_TYPE.GEM:
				global.numberOfGems += _item.value;
				break;
			case ITEM_TYPE.COLLECTIBLE:
				obj_itemManager.options_collectible_length++;
			
				// adds actual item to inventory
				array_push(obj_itemManager.item_inventory, _item);
				// array_push(obj_itemManager.inventory, _item);
				
				
				
				var _itemPlacedInOptions = false;
				for (var i = 0; i <= 2; i++) {
					for (var j = 0; j <= 4; j++) {
						
						
						if (obj_itemManager.option_collectible[i, j] == pointer_null 
						and _itemPlacedInOptions == false) {
							obj_itemManager.option_collectible[i, j] = _item;
							obj_itemManager.option_collectible[i, j].currentMenuLevel = i;
							obj_itemManager.option_collectible[i, j].currentMenuPosition = j;
							
							_itemPlacedInOptions = true;
						}
					}
				}
				break;
		}
}