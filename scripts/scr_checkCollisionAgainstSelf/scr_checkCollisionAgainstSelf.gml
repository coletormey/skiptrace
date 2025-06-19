function scr_checkCollisionAgainstSelf(){
#region //################## Walking Collision Check: Begin ##################\\
	if (place_meeting(x + x_speed, y, obj_wall) 
	or place_meeting(x + x_speed, y, obj_npc))
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
	
	if place_meeting(x, y + y_speed, obj_wall)
	or place_meeting(x, y + y_speed, obj_npc)
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
#endregion //################## Walking Collision Check: End ##################\\
}