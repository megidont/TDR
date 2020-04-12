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

void () monster_randomeasy = {

	local float lotto;
	local float littleo;
	lotto = random();
	littleo = random();
	if(lotto <= .5){
		if(littleo <= .33){
			self.classname = "monster_army";
			monster_army();
		}else if(littleo > .33 && littleo <= .66){
			self.classname = "monster_dog";
			monster_dog();
		}else{
			self.classname = "monster_knight";
			monster_knight();
		}
	}else if(lotto > .5 && lotto <= .75){
		if(littleo <= .25){
			self.classname = "monster_ogre";
			monster_ogre();
		}else if(littleo > .25 && littleo <= .5){
			self.classname = "monster_wizard";
			monster_wizard();
		}else if(littleo > .5 && littleo <= .75){
			self.classname = "monster_enforcer";
			monster_enforcer();
		}else{
			self.classname = "monster_zombie";
			monster_zombie();
		}
	}else if(lotto > .75 && lotto <= .95){
		if(littleo <= .33){
			self.classname = "monster_demon1";
			monster_demon1();
		}else if(littleo > .33 && littleo <= .66){
			self.classname = "monster_hell_knight";
			monster_hell_knight();
		}else{
			self.classname = "monster_tarbaby";
			monster_tarbaby();
		}
	}else if(lotto > .95 && lotto <= 1){
		if(littleo < .5){
			self.classname = "monster_shambler";
			monster_shambler();
		}else{
			self.classname = "monster_shalrath";
			monster_shalrath();
		}
	}

}
