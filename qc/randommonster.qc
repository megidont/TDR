/*

Easy List:

Grunt
Dog
Knight

*/

/*

Medium List:

Ogre
Scrag
Enforcer
Zombie

*/

/*

Hard list:

Fiend
Hell Knight
Tarbaby

*/

/*

Nightmare list:

Shambler
Shalrath

*/

void() monster_random = {

	local float INCLUDES_ARMY = 1;
	local float INCLUDES_DOG = 2;
	local float INCLUDES_OGRE = 4;
	local float INCLUDES_KNIGHT = 8;
	local float INCLUDES_HELL_KNIGHT = 16;
	local float INCLUDES_WIZARD = 32;
	local float INCLUDES_DEMON1 = 64;
	local float INCLUDES_SHAMBLER = 128;
	local float INCLUDES_ENFORCER = 256;
	local float INCLUDES_SHALRATH = 512;
	local float INCLUDES_TARBABY = 1024;
	local float INCLUDES_ZOMBIE = 2048;

	local float lotto;
	local float spawned;

	lotto = random();

	spawned = FALSE;

	if(self.monsterlist == 0){
		dprint("empty monster list on monster_random at ");
		dprint(vtos(self.origin));
		dprint("\n");
		remove(self);
		spawned = TRUE;
	}

	if(self.monsterlist == INCLUDES_ARMY ){
		self.classname = "monster_army";
		monster_army();
		spawned = TRUE;
	}
	if(self.monsterlist == INCLUDES_DOG ){
		self.classname = "monster_dog";
		monster_dog();
		spawned = TRUE;
	}
	if(self.monsterlist == INCLUDES_OGRE ){
		self.classname = "monster_ogre";
		monster_ogre();
		spawned = TRUE;
	}
	if(self.monsterlist == INCLUDES_KNIGHT ){
		self.classname = "monster_knight";
		monster_knight();
		spawned = TRUE;
	}
	if(self.monsterlist == INCLUDES_HELL_KNIGHT ){
		self.classname = "monster_hell_knight";
		monster_hell_knight();
		spawned = TRUE;
	}
	if(self.monsterlist == INCLUDES_WIZARD ){
		self.classname = "monster_wizard";
		monster_wizard();
		spawned = TRUE;
	}
	if(self.monsterlist == INCLUDES_DEMON1 ){
		self.classname = "monster_demon1";
		monster_demon1();
		spawned = TRUE;
	}
	if(self.monsterlist == INCLUDES_SHAMBLER ){
		self.classname = "monster_shambler";
		monster_shambler();
		spawned = TRUE;
	}
	if(self.monsterlist == INCLUDES_ENFORCER ){
		self.classname = "monster_enforcer";
		monster_enforcer();
		spawned = TRUE;
	}
	if(self.monsterlist == INCLUDES_SHALRATH ){
		self.classname = "monster_shalrath";
		monster_shalrath();
		spawned = TRUE;
	}
	if(self.monsterlist == INCLUDES_TARBABY ){
		self.classname = "monster_tarbaby";
		monster_tarbaby();
		spawned = TRUE;
	}
	if(self.monsterlist == INCLUDES_ZOMBIE ){
		self.classname = "monster_zombie";
		monster_zombie();
		spawned = TRUE;
	}

	do{
		if(((self.monsterlist & INCLUDES_ARMY) == INCLUDES_ARMY) && lotto <= 0.083){
			self.classname = "monster_army";
			monster_army();
			spawned = TRUE;
		}else if(((self.monsterlist & INCLUDES_DOG) == INCLUDES_DOG) && lotto > 0.083 && lotto <= 0.167){
			self.classname = "monster_dog";
			monster_dog();
			spawned = TRUE;
		}else if(((self.monsterlist & INCLUDES_OGRE) == INCLUDES_OGRE) && lotto > 0.167 && lotto <= 0.250){
			self.classname = "monster_ogre";
			monster_ogre();
			spawned = TRUE;
		}else if(((self.monsterlist & INCLUDES_KNIGHT) == INCLUDES_KNIGHT) && lotto > 0.250 && lotto <= 0.333){
			self.classname = "monster_knight";
			monster_knight();
			spawned = TRUE;
		}else if(((self.monsterlist & INCLUDES_HELL_KNIGHT) == INCLUDES_HELL_KNIGHT) && lotto > 0.333 && lotto <= 0.417){
			self.classname = "monster_hell_knight";
			monster_hell_knight();
			spawned = TRUE;
		}else if(((self.monsterlist & INCLUDES_WIZARD) == INCLUDES_WIZARD) && lotto > 0.417 && lotto <= 0.500){
			self.classname = "monster_wizard";
			monster_wizard();
			spawned = TRUE;
		}else if(((self.monsterlist & INCLUDES_DEMON1) == INCLUDES_DEMON1) && lotto > 0.500 && lotto <= 0.583){
			self.classname = "monster_demon1";
			monster_demon1();
			spawned = TRUE;
		}else if(((self.monsterlist & INCLUDES_SHAMBLER) == INCLUDES_SHAMBLER) && lotto > 0.583 && lotto <= 0.667){
			self.classname = "monster_shambler";
			monster_shambler();
			spawned = TRUE;
		}else if(((self.monsterlist & INCLUDES_ENFORCER) == INCLUDES_ENFORCER) && lotto > 0.667 && lotto <= 0.750){
			self.classname = "monster_enforcer";
			monster_enforcer();
			spawned = TRUE;
		}else if(((self.monsterlist & INCLUDES_SHALRATH) == INCLUDES_SHALRATH) && lotto > 0.750 && lotto <= 0.833){
			self.classname = "monster_shalrath";
			monster_shalrath();
			spawned = TRUE;
		}else if(((self.monsterlist & INCLUDES_TARBABY) == INCLUDES_TARBABY) && lotto > 0.833 && lotto <= 0.917){
			self.classname = "monster_tarbaby";
			monster_tarbaby();
			spawned = TRUE;
		}else if(((self.monsterlist & INCLUDES_ZOMBIE) == INCLUDES_ZOMBIE) && lotto > 0.917 && lotto <= 1.000){
			self.classname = "monster_zombie";
			monster_zombie();
			spawned = TRUE;
		}
		lotto = random();
	}while(spawned == FALSE);

}

void() monster_randomeasy = {

	self.monsterlist = 11;
	monster_random();

}

void() monster_randomnormal = {

	self.monsterlist = 2340;
	monster_random();

}

void() monster_randomhard = {

	self.monsterlist = 1104;
	monster_random();

}

void() monster_randomnightmare = {

	self.monsterlist = 640;
	monster_random();

}
