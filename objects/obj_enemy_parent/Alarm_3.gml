hasBeenHit = false;
if (instanceHealth <= 0) {
	instance_destroy();	
}
alarm_set(3, inputTimer);