/*

Super Shotgun
Nailgun
Super Nailgun
Grenade Launcher
Rocket Launcher
Mr. Thunderbolt

*/

void () weapon_random = {

	local float INCLUDE_SUPERSHOTGUN = 1;
	local float INCLUDE_NAILGUN = 2;
	local float INCLUDE_SUPERNAILGUN = 4;
	local float INCLUDE_GRENADELAUNCHER = 8;
	local float INCLUDE_ROCKETLAUNCHER = 16;
	local float INCLUDE_LIGHTNING = 32;

	local float lotto;
	local float spawned;

	lotto = random();
	spawned = FALSE;

	if(self.weaponlist == 0){
		self.weaponlist = 63;
	}

	if(self.weaponlist == INCLUDE_SUPERSHOTGUN){
		self.classname = "weapon_supershotgun";
		weapon_supershotgun();
		spawned = TRUE;
	}else if(self.weaponlist == INCLUDE_NAILGUN){
		self.classname = "weapon_nailgun";
		weapon_nailgun();
		spawned = TRUE;
	}else if(self.weaponlist == INCLUDE_SUPERNAILGUN){
		self.classname = "weapon_supernailgun";
		weapon_supernailgun();
		spawned = TRUE;
	}else if(self.weaponlist == INCLUDE_GRENADELAUNCHER){
		self.classname = "weapon_grenadelauncher";
		weapon_grenadelauncher();
		spawned = TRUE;
	}else if(self.weaponlist == INCLUDE_ROCKETLAUNCHER){
		self.classname = "weapon_rocketlauncher";
		weapon_rocketlauncher();
		spawned = TRUE;
	}else if(self.weaponlist == INCLUDE_LIGHTNING){
		self.classname = "weapon_lightning";
		weapon_lightning();
		spawned = TRUE;
	}

	do{
		if(((self.weaponlist & INCLUDE_SUPERSHOTGUN) == INCLUDE_SUPERSHOTGUN) && lotto <= 0.166){
			self.classname = "weapon_supershotgun";
			weapon_supershotgun();
			spawned = TRUE;
		}else if(((self.weaponlist & INCLUDE_NAILGUN) == INCLUDE_NAILGUN) && lotto > 0.166 && lotto <= 0.333){
			self.classname = "weapon_nailgun";
			weapon_nailgun();
			spawned = TRUE;
		}else if(((self.weaponlist & INCLUDE_SUPERNAILGUN) == INCLUDE_SUPERNAILGUN) && lotto > 0.333 && lotto <= 0.500){
			self.classname = "weapon_supernailgun";
			weapon_supernailgun();
			spawned = TRUE;
		}else if(((self.weaponlist & INCLUDE_GRENADELAUNCHER) == INCLUDE_GRENADELAUNCHER) && lotto > 0.500 && lotto <= 0.667){
			self.classname = "weapon_grenadelauncher";
			weapon_grenadelauncher();
			spawned = TRUE;
		}else if(((self.weaponlist & INCLUDE_ROCKETLAUNCHER) == INCLUDE_ROCKETLAUNCHER) && lotto > 0.667 && lotto <= 0.833){
			self.classname = "weapon_rocketlauncher";
			weapon_rocketlauncher();
			spawned = TRUE;
		}else if(((self.weaponlist & INCLUDE_LIGHTNING) == INCLUDE_LIGHTNING) && lotto > 0.833 && lotto <= 1.000){
			self.classname = "weapon_lightning";
			weapon_lightning();
			spawned = TRUE;
		}

		lotto = random();
	}while(spawned == FALSE);
}
