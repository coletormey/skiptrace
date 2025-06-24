function scr_randomDrop(){
	drop_range = random_range(0, 500);
	if (drop_range >= 400) {
		var _inst = instance_create_layer(x, y, "Instances", obj_itemToPickUp);
		_inst.item = global.item_list.gem1;
	}
}