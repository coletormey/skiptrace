draw_set_font(global.font_main);


if (room == room_inventoryScreen) {
	var _xx_text = camera_get_view_x(view_camera[0]) + screenBorder;
	var _xx = camera_get_view_x(view_camera[0]) + screenBorder + 4;
	var _yy_text = camera_get_view_y(view_camera[0]) + UI_HEIGHT + 7;
	var _yy = camera_get_view_y(view_camera[0]) + UI_HEIGHT + 24;
	var _sep = separation;
	for (var i = 0; i <= 2; i++) {
		for (var j = 0; j <= 4; j++) {
			if (option[i, j] != pointer_null) {
				if ( j == 0 and i == 0) {
					draw_sprite(option[i, j].sprite, 0, _xx + _sep * option[i, j].currentMenuPosition, _yy + _sep * option[i, j].currentMenuLevel);
					/*if (option[i, j] == item_list.bomb) {
						var _numOfConsumable = string(global.numberOfBombs);
						var _numberOfDigits = string_length(_numOfConsumable);
						var _numOfBombsToPrint = 0;
		
						switch (_numberOfDigits) {
						case 1:
							_numOfBombsToPrint = "0" + _numOfConsumable;
							break;
						case 2:
							_numOfBombsToPrint = _numOfConsumable;
							break;
						}
						draw_text((_xx_text + _sep * option[i, j].currentMenuPosition) + 8, (_yy_text + _sep * option[i, j].currentMenuLevel) + 10, _numOfBombsToPrint);
					}
				*/
				//draw everything else in the row
				} else  {
					draw_sprite(option[i, j].sprite, 0, _xx + _sep * option[i, j].currentMenuPosition, _yy + separationBetweenItems * option[i, j].currentMenuLevel);
					
					/*
					if (option[i, j] == item_list.bomb) {
						var _numOfConsumable = string(global.numberOfBombs);
						var _numberOfDigits = string_length(_numOfConsumable);
						var _numOfBombsToPrint = 0;
		
						switch (_numberOfDigits) {
						case 1:
							_numOfBombsToPrint = "0" + _numOfConsumable;
							break;
						case 2:
							_numOfBombsToPrint = _numOfConsumable;
							break;
						}
						draw_text((_xx_text + _sep * option[i, j].currentMenuPosition) + 8, (_yy_text + separationBetweenItems * option[i, j].currentMenuLevel) + 10, _numOfBombsToPrint);
					}
						*/
				}
			}
		} 
	}
	

	// this allows the text to be drawn with scale values set for sizing
	// drawing item description
	//draw_text_transformed(_xx + _sep * i, _yy + 16, inventory[i].name, 0.5, 0.5, 0);
	
	
	// draw text for individual item description display
	if (options_length != 0) {
		if (option[menu_level, position] != pointer_null and option[menu_level, position].equipped == false) {
			draw_text(itemDesc_x + x_border, itemDesc_y + y_border, option[menu_level, position].description);
		}
	}
	
	// draw underline cursor
	draw_sprite(spr_currentItemHighlight, image_index, 21 + (32 * position), UI_HEIGHT + 6 + (menu_level * 28));
	
}
