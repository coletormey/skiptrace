draw_set_font(global.font_main);
switch (room) {
	case room_inventoryScreen_1:
		sprite_index = spr_inventoryScreen;
		break;
	case room_inventoryScreen_2:
		sprite_index = spr_inventoryScreen_2;
		break;
	case room_inventoryScreen_3:
		sprite_index = spr_inventoryScreen_3;
		break;
}

draw_sprite(sprite_index, image_index, x, y);
//draw_sprite(spr_currentItemHighlight, image_index, 21 + (32 * position), UI_HEIGHT + 6 + (menu_level * 28));

draw_set_valign(fa_top);
draw_set_halign(fa_left);