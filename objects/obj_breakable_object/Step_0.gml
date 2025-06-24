if (hasBeenHit) {
	var _inst = instance_create_layer(x, y, "Instances", obj_destroyed_object);
	_inst.sprite_index = sprite_to_animate;
	instance_destroy();
}