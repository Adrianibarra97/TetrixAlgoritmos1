import wollok.game.*
import color.*
import bloque.*
import forma.*
import extras.*
import manipuladorDeFormas.*

object gestionDelJuego {
	var puntos = 0
	
	/** Hacer metodos:
		* resetear => borrar todos los bloques game.clear()
		* verificar si perdio => true o false 
		* verificar lineas completas
		* Borrar lineas completas
	*/
	// Funciones Auxiliares:
	 
	method bloquesEnLinea(ejeY){
		return new Range(start = 0, end = 9, step = 1).map({
	 		ejeX => game.getObjectsIn(game.at(ejeX,ejeY))
	 	}).flatten()
	}
	 
	method limpiarPantalla(ejeY) {
		const linea = self.bloquesEnLinea(ejeY)
		if(linea.size() == 0) {
			return 0
		}
		self.BorrarLinea(linea)
		return self.limpiarPantalla(ejeY + 1)
	}
	
	method bajarObjetosAPartir(valor_inicial) {
		const linea = self.bloquesEnLinea(valor_inicial)
		if(linea.size() == 0) {
			return 0
		}
		linea.forEach({bloque => bloque.bajar()})
	 	return self.bajarObjetosAPartir(valor_inicial + 1)
	}
 
	 
	// Funciones Necesarias: 
	 
	method yaPerdio(){
		return self.bloquesEnLinea(21).size() > 2
	} 
	
	method resetear() {
		self.limpiarPantalla(0) 
		puntos = 0
		/*
		game.addVisual(gameOver)
		puntos = 0
		self.limpiarPantalla(0)
		*/
	}
	 
	method BorrarLinea(linea) {
		linea.forEach({
	 		elemento => game.removeVisual(elemento)
	 	})
	}
	 
	method verificarLineasCompletas(ejeY) {
		return (self.bloquesEnLinea(ejeY)).size() >= 10
	}
	 
	method puntosDelJuego(ejeY) {
		if((self.bloquesEnLinea(ejeY)).size() == 0) {
			return puntos
		}
		
	 	if(self.verificarLineasCompletas(ejeY)){
	 		self.BorrarLinea(self.bloquesEnLinea(ejeY))
	 		self.bajarObjetosAPartir(ejeY + 1)
	 		puntos += 100
	 	}	
	 	
	 	if(self.verificarLineasCompletas(ejeY)) {
	 		return self.puntosDelJuego(ejeY)
	 	}
	 	return self.puntosDelJuego(ejeY + 1)
	}
}

object gameOver {

    const image = "green_block.png"
	var property position = game.origin()
	
	method image(){
		return image
	}
}