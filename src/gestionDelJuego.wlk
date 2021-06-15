import wollok.game.*
import color.*
import bloque.*
import forma.*
import extras.*
import manipuladorDeFormas.*

/**
 * gestionDelJuego Object.
 */
object gestionDelJuego {
	var puntos = 0
	
	// Funciones Auxiliares:
	
	/**
	 *	puntos getter. 
	 */
	method puntos() = puntos
	
	/**
	 *	Return a list of blocks in a line. 
	 */
	method bloquesEnLinea(ejeY){
		return new Range(start = 0, end = 9, step = 1).map({
	 		ejeX => game.getObjectsIn(game.at(ejeX,ejeY))
	 	}).flatten()
	}
	
	/**
	 *	Clear the screen removing all the blocks. 
	 */
	method limpiarPantalla(ejeY) {
		const linea = self.bloquesEnLinea(ejeY)
		if(linea.size() == 0) {
			return 0
		}
		self.BorrarLinea(linea)
		return self.limpiarPantalla(ejeY + 1)
	}
	
	/**
	 *	Move down all blocks from a specific line.   
	 */
	method bajarObjetosAPartir(ejeY) {
		if(self.bloquesEnLinea(ejeY).size() == 0) {
			return 0
		}
		self.bloquesEnLinea(ejeY).forEach({bloque => bloque.bajar()})
	 	return self.bajarObjetosAPartir(ejeY + 1)
	}
 
	 
	// Funciones Necesarias: 
	
	/**
	 *	Verify if the player lost.   
	 */
	method yaPerdio(){
		return self.bloquesEnLinea(21).size() > 2
	} 
	
	/**
	 *	Reset the game.   
	 */
	method resetear() {
		self.limpiarPantalla(0) 
		puntos = 0
	}
	
	/**
	 *	Delete a line.   
	 */
	method BorrarLinea(linea) {
		linea.forEach({
	 		elemento => game.removeVisual(elemento)
	 	})
	}
	
	/**
	 *	Verify if the line is complete.   
	 */
	method verificarLineasCompletas(ejeY) {
		return (self.bloquesEnLinea(ejeY)).size() >= 10
	}
	
	/**
	 *	Delete all the complete lines and add points.   
	 */
	method borrarLineasCompletas(ejeY) {
		if((self.bloquesEnLinea(ejeY)).size() == 0) {
			return null
		}
		
	 	if(self.verificarLineasCompletas(ejeY)){
	 		self.BorrarLinea(self.bloquesEnLinea(ejeY))
	 		self.bajarObjetosAPartir(ejeY + 1)
	 		puntos += 100
	 	}	
	 	
	 	if(self.verificarLineasCompletas(ejeY)) {
	 		return self.borrarLineasCompletas(ejeY)
	 	}
	 	return self.borrarLineasCompletas(ejeY + 1)
	}
}