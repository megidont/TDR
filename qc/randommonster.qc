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
			monster_army();
		}else if(littleo > .33 && littleo <= .66){
			monster_dog();
		}else{
			monster_knight();
		}
	}else if(lotto > .5 && lotto <= .75){
		if(littleo <= .25){
			monster_ogre();
		}else if(littleo > .25 && littleo <= .5){
			monster_wizard();
		}else if(littleo > .5 && littleo <= .75){
			monster_enforcer();
		}else{
			monster_zombie();
		}
	}else if(lotto > .75 && lotto <= .95){
		if(littleo <= .33){
			monster_demon1();
		}else if(littleo > .33 && littleo <= .66){
			monster_hell_knight();
		}else{
			monster_tarbaby();
		}
	}else if(lotto > .95 && lotto <= 1){
		if(littleo < .5){
			monster_shambler();
		}else{
			monster_shalrath();
		}
	}

}
