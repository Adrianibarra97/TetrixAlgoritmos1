import wollok.game.*
import color.*
import bloque.*
import extras.*

/**
 * Forma Class.
 * Collection of blocks that form Tetrominos and behave in a similar way to each other.
 */
class Forma {
	/**
	 *	Attributtes for manipulating the shape or Tetromino.
	 */
	var property bloques		//El primer bloque en la lista sera el central de la figura
	var estancado = false
	
	/**
	 *	Forma class Constructor. 
	 */
	 
	constructor(){}
	
	/**
	 *	Specify the Tetromino's color.
	 */
	method color() = azul
	
	/**
	 *	Returns the Tetromino's center block.
	 */
	method bloqueCentral() = bloques.first()
	
	/**
	 *	Return if the Tetromino can rotate to the right or left.
	 */
	method puedeCambiarRotacion(_direction) = true /*Programar para cada forma por separado.*/
	
	/**
	 *	Rotate the tetromino to the right or left.
	 */
	method rotar(_direction){/*Metodo para rotar la pieza*/
		if(self.puedeRotar(_direction)){
			_direction.rotar(self)
			return 0	
		}
		bloques.forEach({
			bloque => _direction.mover(bloque, -1)
		})
		return self.rotar(_direction)
	}
	/**
	 *	Return if the Tetromino can rotate to the right or left.
	 */
	
	method puedeRotar(_direction) {
		return self.puedeCambiarRotacion(_direction)// and 
			   //not self.colisionaConPared(_direction) and 
			   //not self.colisionaConPiso()
	}
	
	
	
	/**
	 *	Move to the right the tetromino if it can.
	 */
	method moverDerecha(){
		if(not self.colisionaConPared(derecha))
			bloques.forEach{_bloque => _bloque.irDerecha()}
	}
	
	/**
	 *	Move to the left the tetromino if it can.
	 */
	method moverIzquierda(){
		if(not self.colisionaConPared(izquierda))
			bloques.forEach{_bloque => _bloque.irIzquierda()}
	}
	
	/**
	 *	  Move down the tetromino if it can.
	 */
	method bajar(){
		if(not self.colisionaConPiso())
			bloques.forEach{_bloque => _bloque.bajar()}
		else self.estancar()
	}
	
	/**
	 *	Drop the Tetromino until it collides with the ground.
	 */
	method caer(){/*Metodo para dejar caer la pieza del todo hasta colisionar (Todos los bloques)*/
		new Range(start = 0, end = 22, step = 1).forEach{_r => 
			if(self.colisionaConPiso()){
				self.estancar()	
				return 0
			} self.bajar()
		}
	}
	
	/**
	 *	Move the Tetromino to another position on the map, _pos is the center block position
	 */
	method posicionar(_pos){
		const deltaX = _pos.x() - self.bloqueCentral().position().x()
    	const deltaY = _pos.y() - self.bloqueCentral().position().y()
    	bloques.forEach{_bloque => _bloque.mover(derecha,deltaX)}
		bloques.forEach{_bloque => _bloque.mover(arriba,deltaY)}	
	}
	
	/**
	 *	Stall the tetromino in its current position.
	 */
	method estancar(){ estancado = true }
	
	/**
	 *	Return if the Tetrimonio is stalled
	 */
	method estaEstancado() = estancado
	
	/**
	 *	Returns if there is another object in a position that is not part of our Tetromino.
	 */									
	method hayOtroObjetoEn(pos) =
			game.getObjectsIn(pos).isEmpty() or
			bloques.contains(game.getObjectsIn(pos).first())
	
	/**
	 *	Returns if the tetromino can move to the left or right without collide with a wall or another object.
	 */
	method colisionaConPared(_lado) =
			not bloques.all{ _bloque => (_bloque.position().x() + _lado.alLado()).between(0,9) and
										self.hayOtroObjetoEn(_bloque.position().right(_lado.alLado())) }
	
	/**
	 *	Returns if the tetromino can go down without collide with the ground or with another blocks in the ground or another object
	 */
	method colisionaConPiso() =
			not bloques.all{ _bloque => _bloque.position().y() != 0 and
										self.hayOtroObjetoEn(_bloque.position().down(1)) }
	
	//wollok game
	/**
	 *	Create the image and appear in the specified position for that Tetromino.
	 */
	method aparecer(){ 
		self.crearForma()
		bloques.forEach{_bloque => game.addVisual(_bloque)}
	}
	
	method crearForma(){}
}

//------Different Tetrominos---------------
class FormaI inherits Forma{
	/* Forma I */
	override method color() = celeste
	
	override method crearForma(){
		bloques = [	new Bloque(position = game.at(4,20)),
				  	new Bloque(position = game.at(5,20)),
				  	new Bloque(position = game.at(3,20)),
				  	new Bloque(position = game.at(6,20))]
		bloques.forEach{_bloque => _bloque.color(self.color())}
	}
	
	override method puedeCambiarRotacion(_direction) {
		return true
	}
}
class FormaJ inherits Forma{
	override method crearForma(){
		bloques = [	new Bloque(position = game.at(4,20)),
				  	new Bloque(position = game.at(3,20)),
				  	new Bloque(position = game.at(2,20)),
				  	new Bloque(position = game.at(2,21))]
		bloques.forEach{_bloque => _bloque.color(self.color())}
	}
}
class FormaL inherits Forma{
	override method color() = naranja
	
	override method crearForma(){
		bloques = [	new Bloque(position = game.at(4,20)),
				  	new Bloque(position = game.at(4,21)),
				  	new Bloque(position = game.at(3,20)),
				  	new Bloque(position = game.at(2,20))]
		bloques.forEach{_bloque => _bloque.color(self.color())}
	}
}

/**
 * FormaO Class.
 * square Tetromino, yellow.
 */
class FormaO inherits Forma{
	override method color() = amarillo
	
	override method crearForma(){
		bloques = [	new Bloque(position = game.at(4,20)),
				  	new Bloque(position = game.at(5,20)),
				  	new Bloque(position = game.at(4,19)),
				  	new Bloque(position = game.at(5,19))]
		bloques.forEach{_bloque => _bloque.color(self.color())}
	}
}

class FormaS inherits Forma{/* Forma S */}
class FormaT inherits Forma{
	/* Forma T */
	override method color() = violeta
	
	override method crearForma(){
		bloques = [	new Bloque(position = game.at(4,20)),
				  	new Bloque(position = game.at(5,20)),
				  	new Bloque(position = game.at(3,20)),
				  	new Bloque(position = game.at(4,21))]
		bloques.forEach{_bloque => _bloque.color(self.color())}
	}
	
	/*override method puedeCambiarRotacion(_direction) {
			if(_direction == izquierda){
				var posB1 = self.posicionActual()
				var posB3 = bloques.get(2).position()
				var desplazamiento = game.at((posB3.x() - posB1.x()), (posB3.y() - posB1.y()))
				var posFinal = game.at((-desplazamiento.y() + posB1.x()), (desplazamiento.x()  + posB1.y()))
				
				return self.hayOtroObjetoEn(posFinal)	
			}
			
			var posB1 = self.posicionActual()
			var posB2 = bloques.get(1).position()
			var desplazamiento = game.at((posB1.x() - posB2.x()), (posB1.y() - posB2.y()))
			var posFinal = game.at((-desplazamiento.y() + posB1.x()), (desplazamiento.x()  + posB1.y()))
				
			return self.hayOtroObjetoEn(posFinal)
	}*/
}
class FormaZ inherits Forma{/* Forma Z */}
