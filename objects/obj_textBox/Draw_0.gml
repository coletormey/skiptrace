accept_key = keyboard_check_pressed(vk_enter);

textBox_x = camera_get_view_x(view_camera[0]);
textBox_y = camera_get_view_y(view_camera[0]) + 96;

// setup
if (setup == false) {
	setup = true;
	draw_set_font(font_main);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	// loop through the pages
	for (var p = 0; p < page_number; p++) {
		// find how many characters are on each page and store 
		// that value in text_length[p]
		text_length[p] = string_length(text[p]);	
		
		text_x_offset[p] = 16;
	}
}


// typing the text
if (draw_char < text_length[page] and !reachedEndOfPage) {
	draw_char += text_speed;
	draw_char = clamp(draw_char, 0, text_length[page]);
} else {
	reachedEndOfPage = true;
}


// flip through pages 
if (accept_key and canSkipText and !associatedNPC.isGivingCutsceneDialogue) {
	
	// if the typing is done
	if (draw_char == text_length[page]) {
		// next page 
		if (page < page_number - 1) {
			page++;
			draw_char = 0;
			reachedEndOfPage = false;
		}
		// destroy textbox
		else {
			// link text for options
			if (dialogue_option_num > 0) {
				scr_create_textbox(dialogue_option_link_id[dialogue_option_pos], associatedNPC);	
			} else {
				associatedNPC.alarm[0] = 1 * room_speed;
				global.playerState = PLAYER_STATE.FREE;
			}
			instance_destroy();	
		}
	}
	// if not done typing
	else {
		draw_char = text_length[page];	
	}
} /*else if (associatedSpeakBlock.isGivingCutsceneDialogue) {
	// if the typing is done
	if (draw_char == text_length[page] and !pausedForReading) {
		alarm[1] = cutsceneDialoguePageTimer;
		pausedForReading = true;
	}
}
*/

// draw textBox

// set height of textbox based on ace's y-location on screen
if (obj_player.y >= camera_get_view_y(view_camera[0]) + UI_HEIGHT + (camera_get_view_height(view_camera[0]) / 2)) {
	var _textBox_y = textBox_y - (camera_get_view_height(view_camera[0]) / 2);
} else {var _textBox_y = textBox_y;}
var _textBox_x = textBox_x + text_x_offset[page];

textBox_image += textBox_image_speed;
textBox_sprite_w = sprite_get_width(textBox_sprite);
textBox_sprite_h = sprite_get_height(textBox_sprite);


// back of textBox
draw_sprite_ext(textBox_sprite, textBox_image, _textBox_x, _textBox_y , textBox_width / textBox_sprite_w, textBox_height / textBox_sprite_h, 0, c_white, 1);


// options
if (draw_char == text_length[page] and page ==	page_number - 1) {
	// option selection
	dialogue_option_pos += keyboard_check_pressed(ord("D")) - keyboard_check_pressed(ord("A"));
	// clamping stops value from going out of range
	dialogue_option_pos = clamp(dialogue_option_pos, 0, dialogue_option_num - 1);
	
	// draw the options
	var _op_space_between = 32; // height of each option
	var _op_text_border = 4; // width of each option
	for (var _op = 0; _op < dialogue_option_num; _op++;) {
		if (_op == 0) {_op_space_between = 12;}
		else {_op_space_between = 24;}
		
		// the option box
		var _op_width = string_width(dialogue_option[_op]) + (_op_text_border * 2);
		draw_sprite_ext(textBox_sprite, textBox_image, _textBox_x + 8, _textBox_y - (_op_space_between * dialogue_option_num) + (_op_space_between * _op), _op_width/textBox_sprite_w, (_op_space_between-1)/textBox_sprite_h, 0, c_white, 1);
		
		// the arrow
		if (dialogue_option_pos == _op) {
			draw_sprite(spr_arrow, 0, _textBox_x + (_op_space_between * dialogue_option_num) + (_op_space_between * _op),  _textBox_y + textBox_sprite_h + 10);	
		}
		
		// the option text
		draw_text(_textBox_x + (_op_space_between * dialogue_option_num) + (_op_space_between * _op) + 12, _textBox_y + textBox_sprite_h + 8, dialogue_option[_op]);
		
		displayingOptions = true;
	}
}


// draw text
var _drawText = string_copy(text[page], 1, draw_char);
draw_text_ext(_textBox_x + text_border, _textBox_y + (text_border / 2), _drawText, line_seperation, line_width);

// if done drawing text, draw down arrow signifying to continue
if (reachedEndOfPage and !displayingOptions and (page < page_number - 1) and !associatedNPC.isGivingCutsceneDialogue) {
	draw_sprite(spr_arrow_down, 0, camera_get_view_x(view_camera[0]) + textBox_width , _textBox_y + textBox_height - 10);
}
