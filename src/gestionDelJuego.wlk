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
	 
	method limpiarPantalla() {
		new Range(start = 0, end = 22, step = 1).forEach({
	 		ejeY => self.BorrarLinea(self.bloquesEnLinea(ejeY))
	 	})
	}
	/*
     
	method bajarObjetosAPartir(valor_inicial) {
		new Range(start = valor_inicial, end = 22, step = 1).forEach({
	 		ejeY => (self.bloquesEnLinea(ejeY)).forEach({
	 			bloque => 
	 			if(not ((manipuladorDeFormas.forma()).bloques()).contains(bloque)) {
	 				bloque.bajar()
	 			}
	 		})
	 	})
	}
	
	*/
	 
	// Version recursiva:
	method bajarObjetosAPartir(valor_inicial) {
		var linea = self.bloquesEnLinea(valor_inicial)
		
		if(linea.size() == 0) {
			 return 0
		}
		
		linea.forEach({bloque => 
	 		if(not ((manipuladorDeFormas.forma()).bloques()).contains(bloque)) {
	 			bloque.bajar()
	 		}
	 	})
	 	
	 	return self.bajarObjetosAPartir(valor_inicial + 1)
	}
 
	 
	// Funciones Necesarias: 
	 
	method yaPerdio(){
		return new Range(start = 15, end = 19, step = 1).all({
	 		ejeY => self.bloquesEnLinea(ejeY).size() > 0
	 	}) 
	} 
	 
	method resetear() {
	    game.removeTickEvent("CLOCK_PRINCIPAL")
	 	game.removeTickEvent("CLOCK_CONTROL")
	 	
	 	game.schedule(1000, {
	 	   	self.limpiarPantalla()
	 		game.addVisual(gameOver)
	 	}) 
	 	
	 	game.schedule(5000, {
	 		self.limpiarPantalla()
	 	})	
	}
	 
	method BorrarLinea(linea) {
		linea.forEach({
	 		elemento => game.removeVisual(elemento)
	 	})
	}
	 
	method verificarLineasCompletas(ejeY) {
		return (self.bloquesEnLinea(ejeY)).size() >= 10
	}
	 
	/*
	method puntosDelJuego() {
		var puntos = 0
	 	new Range(start = 0, end = 22, step = 1).forEach({
	 		ejeY => 
	 		if(self.verificarLineasCompletas(ejeY)){
	 			self.BorrarLinea(self.bloquesEnLinea(ejeY))
	 			self.bajarObjetosAPartir(ejeY)
	 			puntos += 1000
	 		}
	 	})
	 	return puntos
	}
	*/
	  
	// Version recursiva: 
	 
	method puntosDelJuego(ejeY) {
		if((self.bloquesEnLinea(ejeY)).size() == 0) return puntos
		
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