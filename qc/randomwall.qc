float pair1half;
float pair1solid;
float pair2half;
float pair2solid;
float pair3half;
float pair3solid;
float pair4half;
float pair4solid;

void() func_randomwall = {

	local float lotto;
	lotto = random();

	if(self.pair == 1){
		if(pair1half == TRUE && pair1solid != TRUE){
			func_wall();
		}else if(pair1half == FALSE){
			pair1half = TRUE;
			if(lotto <= .5){
				pair1solid = TRUE;
				func_wall();
			}
		}
	}else if(self.pair == 2){
		if(pair2half == TRUE && pair2solid != TRUE){
			func_wall();
		}else if(pair2half == FALSE){
			pair2half = TRUE;
			if(lotto <= .5){
				pair2solid = TRUE;
				func_wall();
			}
		}
	}else if(self.pair == 3){
		if(pair3half == TRUE && pair3solid != TRUE){
			func_wall();
		}else if(pair3half == FALSE){
			pair3half = TRUE;
			if(lotto <= .5){
				pair3solid = TRUE;
				func_wall();
			}
		}
	}else if(self.pair == 4){
		if(pair4half == TRUE && pair4solid != TRUE){
			func_wall();
		}else if(pair4half == FALSE){
			pair4half = TRUE;
			if(lotto <= .5){
				pair4solid = TRUE;
				func_wall();
			}
		}
	}else{
		if(lotto <= .5){
			func_wall();
		}
	}

}
