import personajes.*
import game.*
import principal.*
import visual.*

class Construcciones inherits Visuales{
    override method colisionadoPor(personaje){
        personaje.position(game.at(principal.anchoPantalla()/2 -1, principal.altoPantalla()/2)) 
        game.say(personaje,personaje.mensajeChoca())
    }
}

const universidad = new Construcciones(position = game.at(12,10), image = "universidad.png")
const edificioRojo = new Construcciones(position = game.at(0,5), image = "edificioRojo_150.png")
const edificioRojo1 = new Construcciones(position = game.at(0,2), image = "edificioRojo_150.png")
const edificioRojo2 = new Construcciones(position = game.at(1,5), image = "edificioRojo_150.png")
const edificioRojo3 = new Construcciones(position = game.at (1,2), image = "edificioRojo_150.png")
const edificioRojo4 = new Construcciones(position = game.at(8,2), image = "edificioRojo_150.png")
const edificioNaranja = new Construcciones(position = game.at(6,5), image = "edificioNaranja_150.png")
const edificioNaranja1 = new Construcciones(position = game.at(8,5), image = "edificioNaranja_150.png")
const edificioNaranja2 = new Construcciones(position = game.at(10,5), image = "edificioNaranja_150.png")
const edificioAzul = new Construcciones(position = game.at(19,2), image = "edificioAzul.png")
const edificioAzul1 = new Construcciones(position = game.at(24,2), image = "edificioAzul.png")
const edificioVerde = new Construcciones(position = game.at(0,10), image = "edificioVerde200.png")
const edificioVerde1 = new Construcciones(position = game.at(24,10), image = "edificioVerde200.png")
const edificioRojo5 = new Construcciones(position = game.at(22,2), image = "edificioRojo_150.png")
const arbol = new Construcciones(position = game.at(16,6), image = "arbol100.png")
const arbol1 = new Construcciones(position = game.at(18,6), image = "arbol100.png")
const arbol2 = new Construcciones(position = game.at(20,6), image = "arbol100.png")
const arbol3 = new Construcciones(position = game.at(22,6), image = "arbol100.png")
const arbol4 = new Construcciones(position = game.at(24,6), image = "arbol100.png")
const arbol5 = new Construcciones(position = game.at(26,6), image = "arbol100.png")

object edificios{

    const edificios = [universidad, edificioRojo, edificioRojo1, edificioRojo2, edificioRojo3, edificioRojo4, edificioRojo5,
        edificioNaranja, edificioNaranja1, edificioNaranja2,
        edificioAzul, edificioAzul1, edificioVerde, edificioVerde1,
        arbol, arbol1, arbol2, arbol3, arbol4, arbol5]
    
    method agregarEdificioAlJuego(){edificios.forEach({e => game.addVisual(e)})}

}