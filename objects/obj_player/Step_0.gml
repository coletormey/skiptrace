#region //################## Check For Input: Begin ##################\\
if (can_accept_input) {
	right_key = input_check("right")
	left_key = input_check("left")
	up_key = input_check("up")
	down_key = input_check("down")
	teleport_key = input_check("teleport")
	action_right_key = input_check("action_right")
	action_left_key = input_check("action_left")
	action_up_key = input_check("action_up")
	action_down_key = input_check("action_down")
	inventory_key = input_check_pressed("inventory")
}
#endregion //################## Check For Input: End ##################\\

switch (global.playerState) {
	case PLAYER_STATE.FREE: scr_playerState_free(); break;
	case PLAYER_STATE.USING_MENU: scr_playerState_using_menu(); break;
	case PLAYER_STATE.TELEPORTING: scr_teleport(); break;
	case PLAYER_STATE.ACTION_PRESS: scr_action(); break;
	case PLAYER_STATE.TEXT_BOX: scr_playerState_textBox(); break;
	case PLAYER_STATE.SCREEN_TRANSITION: scr_playerState_screen_transition(); break;
}

switch (global.screenState) {
	case SCREEN_STATE.STATIONARY: scr_screenState_stationary(); break;	
	case SCREEN_STATE.TRANSITIONING: scr_screenState_transitioning(); break;
}