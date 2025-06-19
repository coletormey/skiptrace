//After certain time, this alarm will trigger next alarm, and 
//begin flicker in visibility for item

//if (item.itemType == ITEM_TYPE.PERMANENT_WEAPON) {
//;} else {instance_destroy();}

if (item.itemType != ITEM_TYPE.PERMANENT_WEAPON) {
	alarm[1] = 0.05 * room_speed

	lastAlarmStage = 1;

	alarm[2] = 2 * room_speed;
}
