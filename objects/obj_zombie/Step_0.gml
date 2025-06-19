// movement behavior: meander around
	x_speed = lengthdir_x(movementSpeed, vector_relative_to_player)
	y_speed = lengthdir_y(movementSpeed, vector_relative_to_player)

// Inherit the parent event
event_inherited();

