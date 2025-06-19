function scr_teleport(){
	switch (face) {
		case RIGHT: 
			scr_checkCollisionAgainstSelf();
			x += teleport_speed;
			break;
	}
}