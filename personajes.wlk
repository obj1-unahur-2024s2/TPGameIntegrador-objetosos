import game.*
import principal.*
import edificios.*

class Personajes{
    var property position
    var property image
    method moverse(){
        keyboard.up().onPressDo({self.subir()})
        keyboard.down().onPressDo({self.bajar()})
        keyboard.right().onPressDo({self.derecha()})
        keyboard.left().onPressDo({self.izquierda()})
    }
    method subir(){if(position.y() < principal.altoPantalla() ){position = position.up(1)}}
    method bajar(){if(position.y() > 0 ){position = position.down(1)}}
    method derecha(){if(position.x() < principal.anchoPantalla() ){position = position.right(1)}}
    method izquierda(){if(position.x() > 0){position = position.left(1)}}

    method mensajeChoca(){}
    method mensajeMeSirve(){}
    method mensajeRendir(){}
}

object tomy inherits Personajes(
	position = game.at(principal.anchoPantalla()/2 -1, principal.altoPantalla()/2),
	image = "tomyCompu100.png"
) {
    override method mensajeChoca() = "Auch!! No era por ahí"
    override method mensajeMeSirve() = "Esto me sirve!!"
    override method mensajeRendir() = "Ya puedo rendir el parcial!!"
}