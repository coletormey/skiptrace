depth = -99999;

textBox_width =  camera_get_view_width(view_camera[0]) - 32;
textBox_height = 42;
text_border = 8;
line_seperation = 12;
line_width = textBox_width - (text_border * 2);
textBox_sprite = spr_textBox;
textBox_image = 0;
textBox_image_speed = 30 / room_speed;

// the text
page = 0;
page_number = 0;
text[0] = "";
text_length[0] = string_length(text[0]);

// dictates how many characters are being drawn currently from text string
// this var will count up as each char is printed
draw_char = 0;	
text_speed = 1;

canSkipText = false;
initSkipDisableTime = 0.5 * room_speed;
alarm[0] = initSkipDisableTime;

associatedNPC = pointer_null;

// options
dialogue_option[0] = "";
dialogue_option_link_id[0] = -1;
dialogue_option_pos = 0;
dialogue_option_num = 0;

cutsceneDialoguePageTimer = 2 * room_speed;
pausedForReading = false;

reachedEndOfPage = false;
displayingOptions = false;
setup = false;