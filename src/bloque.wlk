import wollok.game.*
import color.*
import extras.*

/**
 * Bloque Class.
 * Generates the block for its operation in wollok game and the TETRIS.
 */
class Bloque {
	var property color = azul					//Color Object
	
	//wollok game methods
	/**
	 *	Position property for wollok game position on grid.
	 */
	var property position = game.at(4,19)		//Default value: Center up
	/**
	 *	Image for representing the block.
	 */
	method image() = color.imagen()
	
	//Function methods
	/**
	 *	Decrement the Y block position by 1.
	 */
	method bajar() { position = position.down(1) }
	
	/**
	 *	Increment the Y block position by 1.
	 */
	method subir() { position = position.up(1) }
	
	/**
	 *	Increment the X block position by 1.
	 */
	method irDerecha() { position = position.right(1) }
	
	/**
	 *	Decrement the X block position by 1.
	 */
	method irIzquierda() { position = position.left(1) }
	
	/**
	 *	Move the block in the _direction direction by 1.  
	 */
	method mover(_direccion) { _direccion.mover(self) }
	
	/**
	 *	Move the block in the _direction direction by _cant.  
	 */
	method mover(_direccion,cant) { _direccion.mover(self,cant) }
}