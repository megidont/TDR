void() func_randomdestructablewall = {

	local float lotto;
	lotto = random();

	if(lotto <= .5){
		func_destructablewall();
	}

}
