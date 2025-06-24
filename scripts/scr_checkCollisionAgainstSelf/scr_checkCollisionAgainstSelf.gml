function scr_checkCollisionAgainstSelf(){
	
#region //################## Walking Collision Check: Begin ##################\\
	if (place_meeting(x + x_speed, y, obj_wall) 
	or (place_meeting(x + x_speed, y, obj_base_game_object) and instance_place(x + x_speed, y, obj_base_game_object).collides_with_player))
	{
		isCollidingHoriz = true;
		isCollidingVert = false;
	
		x_speed = 0;
		if left_key
		{
		face = LEFT;
		}
		if right_key
		{
		face = RIGHT;
		} 
		show_debug_message("collision");
	} else {isCollidingHoriz = false;}
	
	if (place_meeting(x, y + y_speed, obj_wall)
	or (place_meeting(x, y + y_speed, obj_base_game_object) and instance_place(x, y + y_speed, obj_base_game_object).collides_with_player))
	{
		isCollidingVert = true;
		isCollidingHoriz = false;
	
		y_speed = 0;	
		if up_key
		{
		face = UP;
		}
		if down_key
		{
		face = DOWN;
		}
		show_debug_message("collision");
	} else {isCollidingVert = false;}
	
	// check collision with status affecting objects
	if place_meeting(x, y + y_speed, obj_stairs) == true 
	{
		y_speed /= 2;
	}
#endregion //################## Walking Collision Check: End ##################\\



/*
if (place_meeting(x, y, obj_base_game_object) and (left_key or right_key or up_key or down_key)) {
	var object = instance_place(x, y, obj_base_game_object);
	for (var i = 0; i < array_length(object.component_list); i++) 
	{
		var component = object.component_list[i];
		if (component.name == "collision") {
			if (place_meeting(x + x_speed, y, object))
			{
				isCollidingHoriz = true;
				isCollidingVert = false;
	
				x_speed = 0;
				if left_key
				{
				face = LEFT;
				}
				if right_key
				{
				face = RIGHT;
				} 
			} else {isCollidingHoriz = false;}
	
			if (place_meeting(x, y + y_speed, object))
			{
				isCollidingVert = true;
				isCollidingHoriz = false;
	
				y_speed = 0;	
				if up_key
				{
				face = UP;
				}
				if down_key
				{
				face = DOWN;
				}
			} else {isCollidingVert = false;}
			break;
		}
	}
} else {isCollidingHoriz = false; isCollidingVert = false;}


*/


	

}