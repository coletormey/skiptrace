if (item.itemType == ITEM_TYPE.PERMANENT_WEAPON or item.itemType == ITEM_TYPE.COLLECTIBLE) {}
else {
	if (visible == true) {visible = false;}
	else {visible = true;}

	visibilityHasChanged = true;
}