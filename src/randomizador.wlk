import forma.*

object randomizador {
	const formas = [ {new FormaI()},
					 {new FormaL()},
					 {new FormaJ()},
					 {new FormaS()},
					 {new FormaZ()},
					 {new FormaO()},
					 {new FormaT()} ]
	var property proximasFormas = []
	
	method formaRandomInt(){
		const rand = 0.randomUpTo(7).roundUp() - 1
		if(not proximasFormas.contains(rand))
			return rand
		return self.formaRandomInt()
	}
	
	method formas(index) = formas.get(index).apply()
	
	method inicializarListaDeFormas(){
		proximasFormas.add(self.formaRandomInt())
		proximasFormas.add(self.formaRandomInt())
		proximasFormas.add(self.formaRandomInt())
	}
	
	method proximaForma(){	//Metodo a utilizar para el Tetris
		if(proximasFormas.isEmpty())
			self.inicializarListaDeFormas()
		const proxForma = proximasFormas.first()
		proximasFormas.remove(proxForma)
		proximasFormas.add(self.formaRandomInt())
		return self.formas(proxForma)
	}
}