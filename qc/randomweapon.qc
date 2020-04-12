/*

Super Shotgun
Nailgun
Super Nailgun
Grenade Launcher
Rocket Launcher
Mr. Thunderbolt

*/

void () weapon_random = {

	local float lotto;

	lotto = random();
	//equal weight because life's too short

	if(lotto <= .166){
		self.classname = "weapon_lightning";
		weapon_lightning();
	}else if(lotto > .166 && lotto <= .333){
		self.classname = "weapon_supershotgun";
		weapon_supershotgun();
	}else if(lotto > .333 && lotto <= .5){
		self.classname = "weapon_nailgun";
		weapon_nailgun();
	}else if(lotto > .5 && lotto <= .666){
		self.classname = "weapon_supernailgun";
		weapon_supernailgun();
	}else if(lotto > .666 && lotto <= .833){
		self.classname = "weapon_grenadelauncher";
		weapon_grenadelauncher();
	}else if(lotto > .833 && lotto <= 1){
		self.classname = "weapon_rocketlauncher";
		weapon_rocketlauncher();
	}
}
