var _inst_NPC = id;

if (((position_meeting(x, y, obj_player) and obj_player.face == UP)
or (position_meeting(x, y - sprite_height, obj_player) and obj_player.face == DOWN)
or (position_meeting(x + sprite_width, y - (sprite_height/2), obj_player) and obj_player.face == LEFT)
or (position_meeting(x - sprite_width, y - (sprite_height/2), obj_player) and obj_player.face == RIGHT))
and keyboard_check_pressed(vk_enter) and canInteract) {
	scr_create_textBox(_inst_NPC.text_id, _inst_NPC);
	canInteract = false;
	global.playerState = PLAYER_STATE.TEXT_BOX;
}

