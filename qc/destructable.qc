void() destroyWall;

void() func_destructablewall = {

	precache_model ("maps/wall1.bsp");
	precache_model ("maps/wall2.bsp");
	precache_model ("maps/wall3.bsp");
	precache_model ("maps/wall4.bsp");
	precache_model ("maps/wall5.bsp");
	precache_model ("maps/wall6.bsp");

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

	gibspawner = spawn();
	gibspawner.origin_x = (self.absmin_x + self.absmax_x) / 2;
	gibspawner.origin_y = (self.absmin_y + self.absmax_y) / 2;
	gibspawner.origin_z = (self.absmin_z + self.absmax_z) / 2;
	gibspawner.health = self.health;
	wall = self;
	self = gibspawner;

	ThrowGib("maps/wall1.bsp", self.health);
	ThrowGib("maps/wall2.bsp", self.health);
	ThrowGib("maps/wall3.bsp", self.health);
	ThrowGib("maps/wall4.bsp", self.health);
	ThrowGib("maps/wall5.bsp", self.health);
	ThrowGib("maps/wall6.bsp", self.health);

	self = wall;
	remove(gibspawner);
	remove(self);
}
