// Resize Grid
var _instancesNumeber = instance_number(obj_depthObj_parent);
var _depthGrid = ds_depthGrid;

ds_grid_resize(_depthGrid, 2, _instancesNumeber);

// Add instances to the grid 
var yy = 0;
with (obj_depthObj_parent) {
	_depthGrid[# 0, yy] = id;
	_depthGrid[# 1, yy] = y;
	yy++;
}

// Sort grid in ascending order
ds_grid_sort(_depthGrid, 1, true);

// Loop through grid and draw all instances
yy = 0;
var inst;
repeat(_instancesNumeber) {
	// pull out id 
	inst = _depthGrid[# 0, yy];
	// draw yourself
	with (inst) {
		if (obj_player.is_viewing_inventory) {   /*do nothin*/   }
		else {event_perform(ev_draw, 0);}
	}
	yy++;
}