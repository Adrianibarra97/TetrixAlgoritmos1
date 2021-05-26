import forma.*

object randomizador {
	method formaRandom(){
		const randNum = 0.randomUpTo(7).roundUp()
		if(randNum == 1) return new FormaI()
		else if(randNum == 2) return new FormaL()
		else if(randNum == 3) return new FormaJ()
		else if(randNum == 4) return new FormaS()
		else if(randNum == 5) return new FormaZ()
		else if(randNum == 6) return new FormaO()
		else return new FormaT()
	}
}
