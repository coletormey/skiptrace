if ((place_meeting(x, y, obj_player) == true)) {
	obj_player.x = targetPos_x
	obj_player.y = targetPos_y;
	room_goto(target_room);
}