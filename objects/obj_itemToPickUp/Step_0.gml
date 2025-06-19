sprite_index = item.sprite;

if (visibilityHasChanged) {
	visibilityHasChanged = false;
	alarm[1] = 0.05 * room_speed;
} 


if (place_meeting(x, y, obj_player)) {
	scr_itemAdd(item, item.itemType);	
	instance_destroy();
} 
if (pickedUp) {
	scr_itemAdd(item, item.itemType);
	instance_destroy();
}

