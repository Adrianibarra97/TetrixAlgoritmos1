import forma.*

object randomizador {
	const formas = [ {new FormaI()},
					 {new FormaL()},
					 {new FormaJ()},
					 {new FormaS()},
					 {new FormaZ()},
					 {new FormaO()},
					 {new FormaT()} ]
	
	method formaRandom() = formas.get(0.randomUpTo(7).roundUp() - 1).apply()
}