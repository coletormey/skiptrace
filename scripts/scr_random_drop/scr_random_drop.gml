function scr_random_drop(){
	drop_range = random_range(0, 500);
	if (drop_range >= 400) {
		var _inst = instance_create_layer(x, y, "Instances", obj_itemToPickUp);
		_inst.item = obj_itemManager.item_list.gem_1;
		_inst.visible = true;
	}
}