/**
 * Color Class
 * For each existing color in the game, save the image of the block that represents it.
 */
class Color{
	/**
	 *	Each colour represent an image of a block in Tetris.
	 */
	const imagen
	
	/**
	 *	Getter of the image.
	 */
	method imagen() = imagen
}

//-------Color objects to use in Tetris------------------
const verde 	= 	new Color(imagen = "green_block.png") 
const azul 		=	new Color(imagen = "blue_block.png")
const celeste 	= 	new Color(imagen = "lightBlue_block.png")
const naranja 	= 	new Color(imagen = "orange_block.png")
const violeta 	= 	new Color(imagen = "purple_block.png")
const rojo 		= 	new Color(imagen = "red_block.png")
const amarillo 	= 	new Color(imagen = "yellow_block.png")