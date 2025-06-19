function scr_create_textBox(_text_id, _inst_NPC){
	with instance_create_depth(0, 0, -99999, obj_textBox) {
		scr_game_text(_text_id);
		associatedNPC = _inst_NPC; 
	}
}
