event_inherited();

add_component(scr_component_collision());




hasBeenHit = false;
inputTimer = 9;

startingHealth = 2;
instanceHealth = 2;

sprite_to_animate = pointer_null;

layer_to_edit = layer_get_id("breakable"); 
map_to_edit = layer_tilemap_get_id(layer_to_edit);
map_data = tilemap_get_at_pixel(map_to_edit, x, y);

breakableObjType = "default";
