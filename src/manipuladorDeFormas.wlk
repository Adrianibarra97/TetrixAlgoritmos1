import wollok.game.*
import color.*
import bloque.*
import forma.*
import extras.*

/**
 * manipuladorDeFormas Object.
 */
object manipuladorDeFormas {
	var property forma				//Contain the actual Tetromino for its manipulation
	var position = game.at(4,20)	//maipulador Position
	
	/**
	 *	manipuladorDeFormas position getter
	 */
	method position() = position
	
	/**
	 *	Update the manipuladorDeFormas position
	 */
	method position(_pos){
		position = _pos
		self.actualizarPosicionForma()
	}
	
	/**
	 *	Move down the actual tetromino if it can.
	 */
	method bajar(){
		if(not forma.colisionaConPiso()){
			forma.bajar()
			position.down(1)
		} else forma.estancar()
	}
	
	/**
	 *	Move to the right the actual tetromino if it can.
	 */
	method moverDerecha(){
		if(not forma.colisionaConPared(derecha)){
			forma.moverDerecha()
			position.right(1)
		}
	}
	
	/**
	 *	Move to the left the actual tetromino if it can.
	 */
	method moverIzquierda(){
		if(not forma.colisionaConPared(izquierda)){
			forma.moverIzquierda()
			position.left(1)
		}
	}
	
	/**
	 *	Try rotate the actual Tetromino.
	 */
	method rotar(_lado){ forma.rotar(_lado) }
	
	/**
	 *	Drop the actual Tetromino.
	 */
	method caer(){ forma.caer() }
	
	/**
	 *	Update the Tetromino position based on manipuladorDeForma position
	 */
	method actualizarPosicionForma(){ forma.posicionar(game.at(position.x(),position.y())) }
	
}
