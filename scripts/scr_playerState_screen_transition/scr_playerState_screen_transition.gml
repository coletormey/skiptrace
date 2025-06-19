function scr_playerState_screen_transition(){
if (global.screenState == SCREEN_STATE.STATIONARY) {
		global.playerState = PLAYER_STATE.FREE;
		
	} else {
		// move player appropriately to new position when screen changes in any direction
		switch (obj_cameraManager.screenTransitionDirection) {
			case RIGHT:
				x += 0.0045 * room_speed;
				break;
			case UP:
				y -= 0.008 * room_speed;
				break;
			case DOWN:
				y += 0.008 * room_speed;
				break;
			case LEFT:
				x -= 0.0045 * room_speed;
				break;
		}
	}
}