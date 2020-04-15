void () CCam;

void () CCamChasePlayer =
{
//	makevectors(self.v_angle);
//	we initialize three vectors so that we can place the camera based on head location. It's easier.
	local vector tempx;
	tempx_x = 1;
	tempx_y = self.view_ofs_y;
	tempx_z = self.view_ofs_z;
	local vector tempy;
	tempy_x = self.view_ofs_x;
	tempy_y = 1;
	tempy_z = self.view_ofs_z;
	local vector tempz;
	tempz_x = self.view_ofs_x;
	tempz_y = self.view_ofs_y;
	tempz_z = 1;
	local vector test;
	test = (((self.origin + self.view_ofs) + (tempz * self.camview_z)) + (tempx * self.camview_x)) + (tempy * self.camview_y);
	traceline ((self.origin + self.view_ofs),((((self.origin + self.view_ofs)
		 + (tempz * self.camview_z)) + (tempx * self.camview_x)) + (tempy * self.camview_y)),TRUE,self);
//	setorigin (self.trigger_field,trace_endpos);
	setorigin (self.trigger_field, test);
	WriteByte (MSG_ONE,5);
	WriteEntity (MSG_ONE,self.trigger_field);
	if(self.v_angle_x != 90){
		WriteByte(MSG_ONE, 10);
		WriteAngle(MSG_ONE, 90);		//hacky force lookdown
		WriteAngle(MSG_ONE, self.v_angle_y);
		WriteAngle(MSG_ONE, self.v_angle_z);
	}
	self.weaponmodel = "";
	self.v_angle_x = 0;			//super hacky way to force shooting forward only when ccam active!
};

void () CCam =
{
	 local entity camera;
//	 local entity spot;

	 if (self.aflag == FALSE)
	 {
		self.aflag = TRUE;
		camera = spawn ();
//		spot = spawn ();
		self.trigger_field = camera;
		camera.classname = "camera";
		camera.movetype = MOVETYPE_FLY;
		camera.solid = SOLID_NOT;
		setmodel (camera,"progs/eyes.mdl");
		setsize (camera,'0 0 0','0 0 0');
		makevectors (self.v_angle);
		traceline ((self.origin + self.view_ofs),(((self.origin + self.view_ofs)
			+ (v_forward * -64.000))),TRUE,self);
		self.camview = '0 0 256';	//using this to set the offset from self.view_ofs
		setorigin (camera,trace_endpos);
		self.weaponmodel = "";
		msg_entity = self;
		WriteByte (MSG_ONE,5);
		WriteEntity (MSG_ONE,camera);
		WriteByte (MSG_ONE,10.000);
		WriteAngle (MSG_ONE,camera.angles_x);
		WriteAngle (MSG_ONE,camera.angles_y);
		WriteAngle (MSG_ONE,camera.angles_z);
		self.shouldCCam = FALSE;
//		sprint (self,"Chase Cam On\n");
	}else{
		self.aflag = FALSE;
		msg_entity = self;
		WriteByte (MSG_ONE,5);
		WriteEntity (MSG_ONE,self);
		WriteByte (MSG_ONE,10);
		WriteAngle (MSG_ONE,self.angles_x);
		WriteAngle (MSG_ONE,self.angles_y);
		WriteAngle (MSG_ONE,self.angles_z);
		remove (self.trigger_field);
		sprint (self,"First Person Enabled\n");
		W_SetCurrentAmmo ();
	 }
};
