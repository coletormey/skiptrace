
	
if (global.screenState == SCREEN_STATE.STATIONARY){	

	// Check if enemy is within the current view, if not, sets speed of enemy obj to 0
	if (x < camera_get_view_x(view_camera[0]) or
		y < camera_get_view_y(view_camera[0]) + UI_HEIGHT or
		x > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) or
		y >= camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]))
	{
		isOnCurrentScreen = false;
		x_speed = 0;
		y_speed = 0;
		// used to calculate damage relative to damaging obj
		damaging_x_speed = 0;
		damaging_y_speed = 0;

		instanceHealth = startingHealth;
		x = initPosition_x;
		y = initPosition_y;
	/*
		if (home_x != pointer_null and home_y != pointer_null) {
			// get initial placement for object
			x = random_range(home_x, camera_get_view_width(view_camera[0]) - 16);
			y = random_range(home_y + UI_HEIGHT, camera_get_view_height(view_camera[0]));
	
			// if object is colliding with a wall, get new init placement until object is no longer colliding
			while (place_meeting(x + x_speed, y, obj_wall) == true) {
				x = random_range(home_x, camera_get_view_width(view_camera[0]) - 16);
				y = random_range(home_y + UI_HEIGHT, camera_get_view_height(view_camera[0]));
			}
		}
		*/
	
	} else {

		isOnCurrentScreen = true;
		home_x = camera_get_view_x(view_camera[0]);
		home_y = camera_get_view_y(view_camera[0]);
	

		// collisions
		if place_meeting(x + x_speed, y, obj_wall) == true or 
						(x + x_speed > camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) or
						(x + x_speed < camera_get_view_x(view_camera[0]))) 
		{
			x_speed = 0;
		}
		if place_meeting(x, y + y_speed, obj_wall) == true or
						(y + y_speed >= camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) or
						(y + y_speed < camera_get_view_y(view_camera[0])))
		{
			y_speed = 0;
		}


	}
		
	
}
	
// handle damage and movement
if (global.screenState == SCREEN_STATE.STATIONARY and camera_get_view_target(view_camera[0]) != pointer_null){	

	
	if (instance_exists(obj_player)) {
		vector_relative_to_player = point_direction(x, centerY, obj_player.x, obj_player.y);
		centerY = y + centerYOffset;
	}

		if (hasBeenHit) {
			// knockback when hit
			if !(place_meeting(x, y + (knockBack_speed * -y_speed), obj_wall)) and 
			   !(place_meeting(x + (knockBack_speed * -x_speed), y, obj_wall)) and
			   x + (sprite_width / 2) + (knockBack_speed * -x_speed) <= home_x + camera_get_view_width(view_camera[0]) and
			   y + (knockBack_speed * -y_speed) <= home_y + camera_get_view_height(view_camera[0]) and
			   x - (sprite_width / 2) + (knockBack_speed * -x_speed) >= home_x and
			   y - sprite_height + (knockBack_speed * -y_speed) >= home_y + UI_HEIGHT
			{	   
				x += knockBack_speed * -x_speed;
				y += knockBack_speed * -y_speed;
			}
		
		} else {
		// moving normally
		x += x_speed;
		y += y_speed;	
		}		

}



	
