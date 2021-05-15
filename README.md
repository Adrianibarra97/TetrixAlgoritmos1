# [**Tetris**](https://tetris.fandom.com/wiki/Tetromino) Wollog Game. By **_GRUPONG_**.
> *The famous Tetris game programmed with Wollok Game.*<br/>
> El famoso juego de Tetris programado con Wollok Game.

## Integrantes del grupo (El orden de los mismos se lo dio una [*web randomizadora de listas*](https://www.random.org/lists/) para no dar prioridad a nadie):
* Mateo Pastorini
* Ezequiel Oyola
* Nicolás Matías Villamonte
* Ezequiel Iozzia
* Adrían Ibarra

## Datos sobre el juego
### Dimensiones
La pantalla se encuentra fragmentada en una cuadrilla de 10x20, teniendo cada una de ellas las dimensiones de 50x50px. Por lo tanto, la ventan del juego en total será de 500x1000.
Cada uno de los cuadros de la cuadrilla será un bloque que forme parte de un [*tetromino*](https://tetris.fandom.com/wiki/Tetromino) en el Tetris.

### Bloques
Los bloques pueden crearse por separado en cualquier posicion de la pantalla y con el color que se desee de los 7 disponibles en [*Tetris*](https://tetris.fandom.com/wiki/Tetromino). Tienen sus propios controles, con los que podremos posicionarlo o moverlo por el área de juego en cualquier momento.

<img align="center" src="/assets/blue_block.png"/> <img align="center" src="/assets/green_block.png"/> <img align="center" src="/assets/lightBlue_block.png"/> <img align="center" src="/assets/orange_block.png"/> <img align="center" src="/assets/purple_block.png"/> <img align="center" src="/assets/red_block.png"/> <img align="center" src="/assets/yellow_block.png"/>

### Tetrominos
Se le llama [**Tetromino**](https://tetris.fandom.com/wiki/Tetromino) a cada una de las formas del juego que caen. Cada una de ellas tiene asignado un color específico y se las suele llamar con sus equivalentes en letras del abecedario.

<img align="center" src="/img/Tetromino_image.png"/>

#### [**Forma I**](https://tetris.fandom.com/wiki/Tetromino#I)
El color de esta forma siempre será el celeste y se la llama I por su forma de palo:<br/>
<img align="center" src="/assets/TetrominoI.png"/>
#### [**Forma J**](https://tetris.fandom.com/wiki/Tetromino#J)
El color de esta forma siempre será el azul y se la llama J por su forma:<br/>
<img align="center" src="/assets/TetrominoJ.png"/>
#### [**Forma L**](https://tetris.fandom.com/wiki/Tetromino#L)
El color de esta forma siempre será el naranja y se la llama L por su forma:<br/>
<img align="center" src="/assets/TetrominoL.png"/>
#### [**Forma O**](https://tetris.fandom.com/wiki/Tetromino#O)
El color de esta forma siempre será el amarillo y se la llama O ya que el cuadrado es la forma más parecida a una O alfabética:<br/>
<img align="center" src="/assets/TetrominoO.png"/>
#### [**Forma S**](https://tetris.fandom.com/wiki/Tetromino#S)
El color de esta forma siempre será el verde y se la llama S por su forma:<br/>
<img align="center" src="/assets/TetrominoS.png"/>
#### [**Forma T**](https://tetris.fandom.com/wiki/Tetromino#T)
El color de esta forma siempre será el verde y se la llama T por su forma:<br/>
<img align="center" src="/assets/TetrominoT.png"/>
#### [**Forma Z**](https://tetris.fandom.com/wiki/Tetromino#Z)
El color de esta forma siempre será el verde y se la llama Z por su forma:<br/>
<img align="center" src="/assets/TetrominoZ.png"/>

### manipuladorDeForma
Por cómo trabaja Wollok en el asignado de teclas no podemos asignarle unas teclas a un Tetromino y luego desvincularselas para asignarselas a otro, entonces vamos a aplicar lo que hemos llamado como "solución del cocinero", en la cuál un objeto se encarga de tomar el bloque que tiene el Focus y manipularlo a su manera. Por lo que la asignación de las teclas solo se le dá a éste objeto de tipo cocinero una vez al principio del programa.
Lo llamamos de esa manera porque nos basamos en otro juego de Wollok que por suerte encontramos llamado [*Cooking Ralf*](https://youtu.be/PJ72TtMsqxE), en el que un cocinero puede tomar la comida y dejarla en otra parte del mapa, lo que nos inspiró a realiza nuestro propio cocinero invisible que lleve a nuestros Tetrominos por el mapa.

### Controles
Tecla | Funcion
------------ | -------------
Flecha Derecha | Mover hacia la derecha
Flecha Izquierda | Mover hacia la izquierda
Flecha Arriba | Rotar hacia la derecha
Z | Rotar hacia la izquierda
Flecha Abajo | Caer suavemente
Espacio | Dejar caer

## Division y organización de Tareas
Para la división y organización de tareas utilizamos un software en una página web llamada [*Jira*](https://tetris.fandom.com/wiki/Tetromino), en la cuál manipulamos una hoja de ruta y backlogs de la siguiente manera:

<img src="DistribucionDeTareas.png"/>
<img src="DistribucionDeTareas2.png"/>

## Información sobre el Grupong
El grupong es un grupo de trabajo que surgió en el año 2020 en la Universidad de San Martin mientras la mayoría de sus integrantes se encontraban cursando la materia "Sistema de Procesamiento de Datos" (SPD), en la cuál se aprendía lo básico de programación en assembler de 8086. Sin embargo el Grupong subió la apuesta y llevó los temas de la materia a otro nivel, intentado programar un Pong en este lenguaje de bajo nivel (Idea del docente y referente del equipo, Fabio Bruschetti). Lo que finalmente se logró con éxito, sacando 5 versiones diferentes del Pong hechas con las mismas librerías que se programaron entre todos los integrantes, para lo que tuvieron que aprender por su cuenta conceptos un poco más avanzados como el uso de estructuras de datos en lenguaje ensamblador.
En sus inicios, los integrantes eran 5 personas de las cuales 4 se encuentran actualmente trabajando en proyectos del estilo en la actualidad, más la grata adición de un nuevo participante al mismo. Hoy en día **Nicolás Villamonte**, **Adrián Ibarra**, **Ezequiel Iozzia**, **Ezequiel Oyola** y **Mateo Pastorini** son los integrantes del grupo, los cuales decidieron pasar del programado de un Pong en Assembler a principios del 2020 al programado de un Tetris en Wollok a mitades del 2021.

_ACA DEBERIAMOS AGREGAR LAS FOTOS RETRATO DE CADA UNO DE LOS PARTICIPANTES._
