// next page 
		if (page < page_number - 1) {
			page++;
			draw_char = 0;
			reachedEndOfPage = false;
			pausedForReading = false;
		}
		// destroy textbox
		else {
			// link text for options
			if (dialogue_option_num > 0) {
				scr_create_textbox(dialogue_option_link_id[dialogue_option_pos], associatedSpeakBlock);	
			} else {
				associatedSpeakBlock.alarm[0] = 1 * room_speed;
				//global.playerState = PLAYER_STATE.FREE;
			}
			instance_destroy();	
		}
alarm_set(1, initSkipDisableTime);