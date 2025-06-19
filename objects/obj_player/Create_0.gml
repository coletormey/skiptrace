enum PLAYER_STATE {
	FREE,
	USING_MENU,
	TELEPORTING,
	ACTION_PRESS,
	TEXT_BOX,
	SCREEN_TRANSITION,
}

enum SCREEN_STATE {
	STATIONARY,
	TRANSITIONING,
}


// direction, speed, and strength variables 
face = DOWN;
sprite[RIGHT] = spr_player_right;
sprite[UP] = spr_player_up;
sprite[DOWN] = spr_player_down;
sprite[LEFT] = spr_player_left;
direction_of_action = pointer_null;
x_speed = 0;
y_speed = 0;
movement_speed = 0.017 * room_speed;
teleport_speed = 0.2 * room_speed;
current_speed = movement_speed;
strength_base = 10;
health_base = 10;


// conditionals
isCollidingHoriz = false;
isCollidingVert = false;
canTeleport = true;
can_accept_input = true;
isUsingEntrance = false;
isInActiveCutscene = false;
is_viewing_inventory = false;

// timer values
action_input_delay_timer = 18;

// track damage given by player
hit_by_player_attack = ds_list_create();


//global variables
global.playerState = PLAYER_STATE.FREE;
global.screenState = SCREEN_STATE.STATIONARY;

global.player_health = health_base;
global.equipmentMain = pointer_null;
global.lastPos_x = pointer_null;
global.lastPos_y = pointer_null;

global.equipment_main = pointer_null;
global.equipment_main_strength = strength_base;
global.equipment_main_hitboxes[RIGHT] = spr_player_right_fist_HB;
global.equipment_main_hitboxes[UP] = spr_player_up_fist_HB;
global.equipment_main_hitboxes[DOWN] = spr_player_down_fist_HB;
global.equipment_main_hitboxes[LEFT] = spr_player_left_fist_HB;

global.equipment_secondary = pointer_null;
global.equipment_secondary_strength = strength_base;
global.equipment_secondary_hitboxes[RIGHT] = spr_player_right_fist_HB;
global.equipment_secondary_hitboxes[UP] = spr_player_up_fist_HB;
global.equipment_secondary_hitboxes[DOWN] = spr_player_down_fist_HB;
global.equipment_secondary_hitboxes[LEFT] = spr_player_left_fist_HB;

global.numberOfGems = 0;

