import forma.*

/**
 * Randomizador Object.
 */
object randomizador {
	const formas = [ {new FormaI()},			//Every existing Tetromino instance creation
					 {new FormaL()},
					 {new FormaJ()},
					 {new FormaS()},
					 {new FormaZ()},
					 {new FormaO()},
					 {new FormaT()} ]
	var property proximasFormas = []			//Wait list for the 3 next Tetrominos
	
	/**
	 *	Return random int representing an tetromino without duplicates in the wait list.
	 */
	method formaRandomInt(){
		const rand = 0.randomUpTo(7).roundUp() - 1
		if(not proximasFormas.contains(rand))
			return rand
		return self.formaRandomInt()
	}
	
	/**
	 *	formas Getter.
	 */
	method formas(index) = formas.get(index).apply()
	
	/**
	 *	Initializer for the Tetrominos wait list with 3 different random Tetrominos.
	 */
	method inicializarListaDeFormas(){
		new Range(start = 1, end = 3).forEach{_=>proximasFormas.add(self.formaRandomInt())}
	}
	
	/**
	 *	Return the next Tetromino for use. Remove it from the wait list and add another one. 
	 */
	method proximaForma(){
		if(proximasFormas.isEmpty())
			self.inicializarListaDeFormas()
		const proxForma = proximasFormas.first()
		proximasFormas.remove(proxForma)
		proximasFormas.add(self.formaRandomInt())
		return self.formas(proxForma)
	}
}