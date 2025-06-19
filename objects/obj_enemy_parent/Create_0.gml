startingHealth = 10;
instanceHealth = 10;

centerYOffset = -8;
centerY = y + centerYOffset;

vector_relative_to_player = point_direction(x, centerY, obj_player.x, obj_player.y);
vectorRelativeToDamagingObj = pointer_null;

hasBeenHit = false;
hasBeenHitByBomb = false;

knockBack_speed = 0.012 * room_speed;

inputTimer = 9; 

isOnCurrentScreen = false;

// home screen location for enemy instance
initPosition_x = x;
initPosition_y = y;

home_x = pointer_null;
home_y = pointer_null;

enemyType = pointer_null;
