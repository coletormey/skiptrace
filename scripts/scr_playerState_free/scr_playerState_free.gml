function scr_playerState_free(){

#region //################## Player Movement: Begin ##################\\
if (inventory_key) {
	global.playerState = PLAYER_STATE.USING_MENU;
	is_viewing_inventory = true;
	obj_cameraManager.last_camera_info.x = camera_get_view_x(view_camera[0]);
	obj_cameraManager.last_camera_info.y = camera_get_view_y(view_camera[0]);
	obj_cameraManager.last_camera_info.last_room = room;
	room_goto(room_inventoryScreen_1);
}

if (teleport_key and canTeleport) {
	canTeleport = false;
	current_speed = teleport_speed;
	alarm[0] = 0.05 * room_speed;
}


// diagonally
if ((right_key and up_key) or (right_key and down_key) or  (left_key and up_key) or (left_key and down_key)) {
	x_speed = (right_key - left_key) * current_speed * 0.65;
	y_speed = (down_key - up_key) * current_speed * 0.65;
// straight left, right, up, or down
} else {
	x_speed = (right_key - left_key) * current_speed;
	y_speed = (down_key - up_key) * current_speed;
}

// reset image speed
image_speed = 1;

// collision detection
scr_checkCollisionAgainstSelf();

// update position 
x += x_speed;
y += y_speed;

// set sprite via speed, with no collisiondds
if y_speed == 0
{
	if x_speed > 0 {face = RIGHT};
	if x_speed < 0 {face = LEFT};
	if (isCollidingVert and (face == LEFT or face == RIGHT)) {
		if (up_key) {face = UP;} 
		else if (down_key) {face = DOWN;}
	}
}
if x_speed == 0 {
	if y_speed > 0 {face = DOWN};
	if y_speed < 0 {face = UP};
	if (isCollidingHoriz and (face == DOWN or face == UP)) {
		if (left_key) {face = LEFT;} 
		else if (right_key) {face = RIGHT;}
	}
}
if (x_speed == 0 and y_speed == 0) {
	if (isCollidingVert or isCollidingHoriz) {image_speed = 1;}
	else {image_speed = 0;}
}
sprite_index = sprite[face];

// action key presses
if (action_right_key) {
	direction_of_action = RIGHT;
	can_accept_input = false;
	action_right_key = false;
	alarm[2] = action_input_delay_timer;
	image_speed = 1;
	global.playerState = PLAYER_STATE.ACTION_PRESS;
} else if (action_left_key) {
	direction_of_action = LEFT;
	can_accept_input = false;
	action_left_key = false;
	alarm[2] = action_input_delay_timer;
	image_speed = 1;
	global.playerState = PLAYER_STATE.ACTION_PRESS;
} else if (action_up_key) {
	direction_of_action = UP;
	can_accept_input = false;
	action_up_key = false;
	alarm[2] = action_input_delay_timer;
	image_speed = 1;
	global.playerState = PLAYER_STATE.ACTION_PRESS;
} else if (action_down_key) {
	direction_of_action = DOWN;
	can_accept_input = false;
	action_down_key = false;
	alarm[2] = action_input_delay_timer;
	image_speed = 1;
	global.playerState = PLAYER_STATE.ACTION_PRESS;
}


// save player x and y positions after every frame when player has control
global.lastPos_x = x;
global.lastPos_y = y;

#endregion //################## Player Movement: End ##################\\

}