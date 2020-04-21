void() destroyWall;

void() func_destructablewall = {

	precache_model ("progs/wall1.bsp");
	precache_model ("progs/wall2.bsp");
	precache_model ("progs/wall3.bsp");
	precache_model ("progs/wall4.bsp");
	precache_model ("progs/wall5.bsp");
	precache_model ("progs/wall6.bsp");
	precache_model ("progs/rubble.bsp");

	self.classname = "destructablewall";
	self.angles = '0 0 0';
        self.movetype = MOVETYPE_PUSH;
        self.solid = SOLID_BSP;
        setmodel (self, self.model);

	self.takedamage = DAMAGE_AIM;
	self.th_die = destroyWall;


};

void() destroyWall = {

	local entity gibspawner;
	local entity wall;
	local float i;
	local vector sizes;
	local vector gibspawnpoint;

	sizes_x = self.absmax_x - self.absmin_x;
	sizes_y = self.absmax_y - self.absmin_y;
	sizes_z = self.absmax_z - self.absmin_z;

	gibspawner = spawn();
	gibspawnpoint_x = (self.absmin_x + self.absmax_x) /2;
	gibspawnpoint_y = (self.absmin_y + self.absmax_y) /2;
	gibspawnpoint_z = (self.absmin_z + self.absmax_z) /2;
	gibspawner.origin = gibspawnpoint;
	gibspawner.health = self.health;

	wall = self;
	self = gibspawner;

	i = sizes_x * sizes_y * sizes_z;
	i = ceil(i / 100000);					//lower is unreasonable. trust me.

	do{

		local float lotto;
		local vector randomval;

		randomval_x = random();
		randomval_y = random();
		randomval_z = random();
		randomval_x = randomval_x - 0.5;
		randomval_y = randomval_y - 0.5;
		randomval_z = randomval_z - 0.5;

		lotto = randomval_z;

		self.origin_x = self.origin_x + (randomval_x * sizes_x);
		self.origin_y = self.origin_y + (randomval_y * sizes_y);
		self.origin_z = self.origin_z + (randomval_z * sizes_z);

		if(lotto <= 0.167){
			ThrowGib("progs/wall1.bsp", self.health);
		}else if(lotto > 0.167 && lotto <= 0.333){
			ThrowGib("progs/wall2.bsp", self.health);
		}else if(lotto > 0.333 && lotto <= 0.500){
			ThrowGib("progs/wall3.bsp", self.health);
		}else if(lotto > 0.500 && lotto <= 0.667){
			ThrowGib("progs/wall4.bsp", self.health);
		}else if(lotto > 0.667 && lotto <= 0.833){
			ThrowGib("progs/wall5.bsp", self.health);
		}else if(lotto > 0.833 && lotto <= 1.000){
			ThrowGib("progs/wall6.bsp", self.health);
		}
		i = i - 1;

		self.origin = gibspawnpoint;

	}while(i > 0);

	self = wall;
	remove(gibspawner);
	remove(self);
}
