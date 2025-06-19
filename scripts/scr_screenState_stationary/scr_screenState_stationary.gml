function scr_screenState_stationary(){
if (right_key and x + (sprite_width / 3) > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])
					and camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) != room_width) {
		global.screenState = SCREEN_STATE.TRANSITIONING;
		global.playerState = PLAYER_STATE.SCREEN_TRANSITION;
		obj_cameraManager.screenTransitionDirection = RIGHT;
		screenTransitionTargetX = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]);
		canAcceptInput = false;
		image_speed = 0;
	} else if (left_key and (x - (sprite_width / 3) < camera_get_view_x(view_camera[0]))
						  and camera_get_view_x(view_camera[0]) != 0) {
		global.screenState = SCREEN_STATE.TRANSITIONING;
		global.playerState = PLAYER_STATE.SCREEN_TRANSITION;
		obj_cameraManager.screenTransitionDirection = LEFT;
		screenTransitionTargetX = camera_get_view_x(view_camera[0]) - camera_get_view_width(view_camera[0]);
		canAcceptInput = false;
		image_speed = 0;
	} else if (down_key and (y >= camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])
						 and camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) != room_height)) {
		global.screenState = SCREEN_STATE.TRANSITIONING;
		global.playerState = PLAYER_STATE.SCREEN_TRANSITION;
		obj_cameraManager.screenTransitionDirection = DOWN;
		screenTransitionTargetY = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - UI_HEIGHT;
		canAcceptInput = false;
		image_speed = 0;
	} else if (up_key and y - (sprite_height / 2) < camera_get_view_y(view_camera[0]) + UI_HEIGHT
						and camera_get_view_y(view_camera[0]) != 0) {
		global.screenState = SCREEN_STATE.TRANSITIONING;
		global.playerState = PLAYER_STATE.SCREEN_TRANSITION;
		obj_cameraManager.screenTransitionDirection = UP;
		screenTransitionTargetY = camera_get_view_y(view_camera[0]) - camera_get_view_height(view_camera[0]) + UI_HEIGHT;
		canAcceptInput = false;
		image_speed = 0;
	}
	
	obj_cameraManager.last_camera_info.x = camera_get_view_x(view_camera[0]);
	obj_cameraManager.last_camera_info.y = camera_get_view_y(view_camera[0]);	
}