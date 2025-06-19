draw_set_font(global.font);

	var _xx = camera_get_view_x(view_camera[0]);
	var _yy = camera_get_view_y(view_camera[0]);
	
	
	
	draw_sprite(sprite, 0, _xx, _yy);
	
	if (global.equipment_main != pointer_null) {
		draw_sprite(global.equipment_main.sprite, 0, _xx + 18, _yy + 16);
	}
	if (global.equipment_secondary != pointer_null) {
		draw_sprite(global.equipment_secondary.sprite, 0, _xx + 64, _yy + 16);
		
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
		draw_text(_xx + 70, _yy + 7, _numOfBombsToPrint)
	}
	
	var _numOfGemsAsString = string(global.numberOfGems);
	var _numberOfDigits = string_length(_numOfGemsAsString);
	var _numOfGemsToPrint = 0;
	
	switch (_numberOfDigits) {
		case 1:
			_numOfGemsToPrint = "00" + _numOfGemsAsString;
			break;
		case 2:
			_numOfGemsToPrint = "0" + _numOfGemsAsString;
			break;
		case 3:
			_numOfGemsToPrint = _numOfGemsAsString;
			break;
	}
	draw_text(_xx + (camera_get_view_width(view_camera[0]) / 2) + 1, _yy + 7, _numOfGemsToPrint)
	
	
	var _healthAsString = string(global.player_health);
	var _numberOfDigits = string_length(_healthAsString);
	var _healthToPrint = 0;
	
	switch (_numberOfDigits) {
		case 1:
			_healthToPrint = "00" + _healthAsString;
			break;
		case 2:
			_healthToPrint = "0" + _healthAsString;
			break;
		case 3:
			_healthToPrint = _healthAsString;
			break;
	}
	draw_text(_xx + camera_get_view_width(view_camera[0]) - (camera_get_view_width(view_camera[0]) / 4) + 1, _yy + 7, _healthToPrint)