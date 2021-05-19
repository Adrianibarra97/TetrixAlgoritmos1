import wollok.game.*
import color.*
import bloque.*
import forma.*
import extras.*

object manipuladorDeFormas {
	var property forma
	var position = game.at(4,20)
	
	method position() = position
	
	/**
	 *	Update the manipuladorDeFormas position
	 */
	method position(_pos){
		position = _pos
		self.actualizarPosicionForma()
	}
	
	
	method bajar(){
		if(not forma.colisionaConPiso()){
			forma.bajar()
			position.down(1)
		} else forma.estancar()
	}
	method moverDerecha(){
		if(not forma.colisionaConPared(derecha)){
			forma.moverDerecha()
			position.right(1)
		}
	}
	method moverIzquierda(){
		if(not forma.colisionaConPared(izquierda)){
			forma.moverIzquierda()
			position.left(1)
		}
	}
	
	method rotar(_lado){ forma.rotar(_lado) }
	
	method caer(){ forma.caer() }
	
	/**
	 *	Update the Tetromino position based on manipuladorDeForma position
	 */
	method actualizarPosicionForma(){ forma.posicionar(game.at(position.x(),position.y())) }
	
}
