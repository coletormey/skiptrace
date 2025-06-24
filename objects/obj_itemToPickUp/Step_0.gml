sprite_index = item.sprite;

if (visibilityHasChanged) {
	visibilityHasChanged = false;
	alarm[1] = 0.05 * room_speed;
} 

// Stop at the final frame
if (image_index >= image_number - 1) {
    image_index = image_number - 1;
    image_speed = 0;
}


if (place_meeting(x, y, obj_player) and is_collectible) {
	scr_itemAdd(item, item.itemType);	
	instance_destroy();
}
/*
if (pickedUp) {
	scr_itemAdd(item, item.itemType);
	instance_destroy();
}

