import wollok.game.*

/**
 * Direction Objects.
 */
object derecha{
	const property alLado = 1
	method mover(_objeto){ _objeto.position(_objeto.position().right(1)) }
	method mover(_objeto,_cant){ _objeto.position(_objeto.position().right(_cant)) }
	method rotar(_objeto){
		(_objeto.bloques()).forEach({
			Elemento =>
			var posPrimerBloque = _objeto.posicionActual()
			var posBloque = Elemento.position()
			
			var desplazamiento = game.at((posPrimerBloque.x() - posBloque.x()), (posPrimerBloque.y() - posBloque.y()))
			var posFinal = game.at((-desplazamiento.y() + posPrimerBloque.x()), (desplazamiento.x()  + posPrimerBloque.y()))
			Elemento.position(posFinal)	
			})
	
	}
}
object izquierda{
	const property alLado = -1
	method mover(_objeto){ _objeto.position(_objeto.position().left(1)) }
	method mover(_objeto,_cant){ _objeto.position(_objeto.position().left(_cant)) }
	method rotar(_objeto){ 
		(_objeto.bloques()).forEach({
			Elemento =>
			var posPrimerBloque = _objeto.posicionActual()
			var posBloque = Elemento.position()
			
			var desplazamiento = game.at((posBloque.x() - posPrimerBloque.x()), (posBloque.y() - posPrimerBloque.y()))
			var posFinal = game.at((-desplazamiento.y() + posPrimerBloque.x()), (desplazamiento.x()  + posPrimerBloque.y()))
			Elemento.position(posFinal)	
			})
	
	}
}

object arriba{
	method mover(_objeto){ _objeto.position(_objeto.position().up(1)) }
	method mover(_objeto,_cant){ _objeto.position(_objeto.position().up(_cant)) }
}
object abajo{
	method mover(_objeto){ _objeto.position(_objeto.position().down(1)) }
	method mover(_objeto,_cant){ _objeto.position(_objeto.position().down(_cant)) }
}

/**
 * Configuration of game, keyboard, collisions, timers, etc...
 */
object configuracion{
	/**
	 *	Configure the keys for focus the block.
	 */
	/*
	method configurarTeclasPara(_tetromino) { // Configuracion de las teclas 
		keyboard.up().onPressDo		{_tetromino.rotar(derecha)	}		//Up Arrow
		keyboard.down().onPressDo	{_tetromino.bajar()			}		//Down Arrow
		keyboard.right().onPressDo	{_tetromino.moverDerecha()	}		//Right Arrow
		keyboard.left().onPressDo	{_tetromino.moverIzquierda()}		//Left Arrow
		keyboard.space().onPressDo	{_tetromino.caer()			}		//Space
		keyboard.z().onPressDo		{_tetromino.rotar(izquierda)}		//z
	}*/
	
	method configurarTeclasPara(_manipulador) { // Configuracion de las teclas 
		keyboard.up().onPressDo		{_manipulador.rotar(derecha)	}		//Up Arrow
		keyboard.down().onPressDo	{_manipulador.bajar()			}		//Down Arrow
		keyboard.right().onPressDo	{_manipulador.moverDerecha()	}		//Right Arrow
		keyboard.left().onPressDo	{_manipulador.moverIzquierda()}		//Left Arrow
		keyboard.space().onPressDo	{_manipulador.caer()			}		//Space
		keyboard.z().onPressDo		{_manipulador.rotar(izquierda)}		//z
	}
	
	method desConfigurarTeclasPara(_tetromino) { /* Configuracion de las teclas */
		keyboard.up().onPressDo{}		//Up Arrow
		keyboard.down().onPressDo{}		//Down Arrow
		keyboard.right().onPressDo{}	//Right Arrow
		keyboard.left().onPressDo{}		//Left Arrow
		keyboard.space().onPressDo{}	//Space
		keyboard.z().onPressDo{}		//z
	}
	
	method configurarMusica(_music){
		const music = game.sound(_music)
		music.shouldLoop(true)
		music.volume(0.5)
		game.onTick(100, "MUSICA", {
			if(not music.played())
				music.play()
		})
	}
	
}