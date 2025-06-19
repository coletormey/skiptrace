depth = -9998;

global.font_main = font_main;

item_inventory = array_create(0);

itemDesc_x = 8; 
itemDesc_y = 105;

x_border = 6;
y_border = 2;


// item constructor
function create_item(_name, _desc, _spr, _eqpd, _strength, _rightHb, 
					 _upHb, _downHb, _leftHb, _val, _type, _mnuLvl, _mnuPos,
					 _acquired) constructor {
	name = _name;
	description = _desc;
	sprite = _spr;
	equipped = _eqpd;
	strength = _strength;
	mainWeaponRightHitbox = _rightHb
	mainWeaponUpHitbox = _upHb;
	mainWeaponDownHitbox = _downHb;
	mainWeaponLeftHitbox = _leftHb;
	value = _val;
	itemType = _type;
	currentMenuLevel = _mnuLvl;
	currentMenuPosition = _mnuPos;
	acquired = _acquired;
}


enum ITEM_TYPE {
	CONSUMABLE,
	COLLECTIBLE,
	PERMANENT_WEAPON,
	GEM
}



// create the items
item_list = {
	
	book : new create_item(
		"Book",
		"This is a test item, not real. Idiot!",
		spr_book,
		false,
		0,
		pointer_null,
		pointer_null,
		pointer_null,
		pointer_null,
		0,
		ITEM_TYPE.COLLECTIBLE,
		pointer_null,
		pointer_null,
		false,
	),
	
	
	gem_1 : new create_item(
		"1 Gem",
		"1 Gem",
		spr_gem_1,
		false,
		0,
		pointer_null,
		pointer_null,
		pointer_null,
		pointer_null,
		1,
		ITEM_TYPE.GEM,
		pointer_null,
		pointer_null,
		false,
	),
	/*
	sword1 : new create_item(
		"Short Sword",
		"It's not long, it's short.",
		spr_sword1,
		false,
		5,
		spr_ace_rightSword1_HB,
		spr_ace_upSword1_HB,
		spr_ace_downSword1_HB,
		spr_ace_leftSword1_HB,
		0,
		ITEM_TYPE.PERMANENT_WEAPON,
		pointer_null,
		pointer_null,
		false,
	),
	
	sword2 : new create_item(
		"Sharpened Short Sword",
		"Sharp as hell.",
		spr_sword2,
		false,
		10,
		spr_ace_rightSword2_HB,
		spr_ace_upSword2_HB,
		spr_ace_downSword2_HB,
		spr_ace_leftSword2_HB,
		0,
		ITEM_TYPE.PERMANENT_WEAPON,
		pointer_null,
		pointer_null,
		false,
	),
	
	bomb : new create_item(
		"Bomb",
		"bomb af",
		spr_bomb,
		false,
		15,
		spr_ace_rightSword2_HB,
		spr_ace_upSword2_HB,
		spr_ace_downSword2_HB,
		spr_ace_leftSword2_HB,
		0,
		ITEM_TYPE.CONSUMABLE,
		pointer_null,
		pointer_null,
		false, 
	),
	
	fist : new create_item(
		"your fists",
		"just me",
		pointer_null,
		false,
		5,
		spr_player_down_fist_HB,
		spr_player_left_fist_HB,
		spr_player_right_fist_HB,
		spr_player_up_fist_HB,
		0,
		ITEM_TYPE.PERMANENT_WEAPON,
		pointer_null,
		pointer_null,
		false,
	),
	*/
}


// hitboxes for items/weapons



// for item drawing positions
separation = 32;
screenBorder = 24;
separationBetweenItems = 28;


// equipable items 
option[0, 0] = pointer_null;
option[0, 1] = pointer_null;
option[0, 2] = pointer_null;
option[0, 3] = pointer_null;
option[0, 4] = pointer_null;
option[1, 0] = pointer_null;
option[1, 1] = pointer_null;
option[1, 2] = pointer_null;
option[1, 3] = pointer_null;
option[1, 4] = pointer_null;
option[2, 0] = pointer_null;
option[2, 1] = pointer_null;
option[2, 2] = pointer_null;
option[2, 3] = pointer_null;
option[2, 4] = pointer_null;

options_length = 0;



// collectible items
option_collectible[0, 0] = pointer_null;
option_collectible[0, 1] = pointer_null;
option_collectible[0, 2] = pointer_null;
option_collectible[0, 3] = pointer_null;
option_collectible[0, 4] = pointer_null;
option_collectible[1, 0] = pointer_null;
option_collectible[1, 1] = pointer_null;
option_collectible[1, 2] = pointer_null;
option_collectible[1, 3] = pointer_null;
option_collectible[1, 4] = pointer_null;
option_collectible[2, 0] = pointer_null;
option_collectible[2, 1] = pointer_null;
option_collectible[2, 2] = pointer_null;
option_collectible[2, 3] = pointer_null;
option_collectible[2, 4] = pointer_null;

options_collectible_length = 0;


menu_level = 0;
position = 0;