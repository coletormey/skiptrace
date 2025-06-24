// Define the layer and position of the tile you want to delete
	var _layer_to_edit = layer_get_id("nature"); 
	var _map_to_edit = layer_tilemap_get_id(_layer_to_edit);
	var _map_data = tilemap_get_at_pixel(_map_to_edit, x, y);
	_map_data = tile_set_empty(_map_data);
	tilemap_set_at_pixel(_map_to_edit, _map_data, x, y);
	
	
	
	
	
	visible = true;
	
	
	
	if (scr_animation_end()) {
		
		instance_destroy();	
		
	}