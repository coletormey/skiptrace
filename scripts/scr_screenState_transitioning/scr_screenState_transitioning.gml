function scr_screenState_transitioning(){
switch (obj_cameraManager.screenTransitionDirection) {
		case RIGHT:
			if (camera_get_view_x(view_camera[0]) < screenTransitionTargetX ) {
				camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) + 4, camera_get_view_y(view_camera[0]));	
			} else {
				if (!obj_player.isInActiveCutscene) {
					global.screenState = SCREEN_STATE.STATIONARY;
					global.playerState = PLAYER_STATE.FREE;
					screenTransitionDirection = pointer_null;
					can_accept_input = true;
					image_speed = 1;
				} else {
					global.screenState = SCREEN_STATE.STATIONARY;	
					screenTransitionDirection = pointer_null;
				}
			} break;
		case UP:
			if (camera_get_view_y(view_camera[0]) > screenTransitionTargetY ) {
				camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) - 4);	
			} else {
				if (!obj_player.isInActiveCutscene) {
				global.screenState = SCREEN_STATE.STATIONARY;
				global.playerState = PLAYER_STATE.FREE;
				screenTransitionDirection = pointer_null;
				can_accept_input = true;
				image_speed = 1;
				} else {
					global.screenState = SCREEN_STATE.STATIONARY;	
					screenTransitionDirection = pointer_null;
				}
			} break;
		case DOWN:
			if (camera_get_view_y(view_camera[0]) < screenTransitionTargetY ) {
				camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), camera_get_view_y(view_camera[0]) + 4);	
			} else {
				if (!obj_player.isInActiveCutscene) {
				global.screenState = SCREEN_STATE.STATIONARY;
				global.playerState = PLAYER_STATE.FREE;
				screenTransitionDirection = pointer_null;
				can_accept_input = true;
				image_speed = 1;
				} else {
					global.screenState = SCREEN_STATE.STATIONARY;
					screenTransitionDirection = pointer_null;
				}
			} break;
		case LEFT:
			if (camera_get_view_x(view_camera[0]) > screenTransitionTargetX ) {
				camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]) - 4, camera_get_view_y(view_camera[0]));	
			} else {
				if (!obj_player.isInActiveCutscene) {
				global.screenState = SCREEN_STATE.STATIONARY;
				global.playerState = PLAYER_STATE.FREE;
				screenTransitionDirection = pointer_null;
				can_accept_input = true;
				image_speed = 1;
				} else {
					global.screenState = SCREEN_STATE.STATIONARY;
					screenTransitionDirection = pointer_null;
				}
			} break;
	}
	//global.lastCameraInfo.x = camera_get_view_x(view_camera[0]);
	//global.lastCameraInfo.y = camera_get_view_y(view_camera[0]);
	obj_cameraManager.last_camera_info.x = camera_get_view_width(view_camera[0]);
	obj_cameraManager.last_camera_info.y = camera_get_view_height(view_camera[0]);
}