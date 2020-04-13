void() destroyWall;

void() func_destructablewall = {

	precache_model ("progs/gib1.mdl");
	precache_model ("progs/gib2.mdl");
	precache_model ("progs/gib3.mdl");

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

	ThrowGib("progs/gib1.mdl", self.health);
	ThrowGib("progs/gib2.mdl", self.health);
	ThrowGib("progs/gib3.mdl", self.health);

	self = wall;
	remove(gibspawner);
	remove(self);
}
