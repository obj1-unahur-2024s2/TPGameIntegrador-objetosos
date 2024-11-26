import pantallas.*
import game.*
import principal.*
import edificios.*
import utiles.*

class Personajes{
    var property position
    var property image
    method moverse(){}
    method saltar(){}

    method subir(){if(position.y() < juego.altoPantalla() ){position = position.up(1)}}
    method bajar(){if(position.y() > 0 ){position = position.down(1)}}
    method derecha(){if(position.x() < juego.anchoPantalla() ){position = position.right(1)}}
    method izquierda(){if(position.x() > 0){position = position.left(1)}}

    method mensajeChoca(){}
    method mensajeMeSirve(){}
    method mensajeRendir(){}
    method mensajeNoMeSirve(){}
    method mensajePuedoRendir(){}
}

object tomy inherits Personajes(
	position = game.at(juego.anchoPantalla()/2 -1, juego.altoPantalla()/2),
	image = "tomyCompu100.png"
) {
    override method moverse(){
        keyboard.up().onPressDo({self.subir()})
        keyboard.down().onPressDo({self.bajar()})
        keyboard.right().onPressDo({self.derecha()})
        keyboard.left().onPressDo({self.izquierda()})
    }

    override method mensajeChoca() = "Auch!! No era por ahí"
    override method mensajeMeSirve() = "Esto me sirve!!"
    override method mensajeRendir() = "Ya puedo rendir el parcial!!"
    override method mensajeNoMeSirve() = "Esto no me sirve!"
    override method mensajePuedoRendir() = "Tengo todo para rendir!!"
}

object tomyRinde inherits Personajes(
    position = game.at(1,1),
    image = "tomyCorrer50.png"
){
    override method subir(){position = position.up(3)}
    override method bajar(){position = position.down(3)}
    override method derecha(){position = position.right(3)}
    override method izquierda(){position = position.left(3)}
    override method saltar(){
        keyboard.up().onPressDo({
            if(position.y() == 1) {
			    self.hacerElSalto()
			    game.schedule(velocidad*3,{self.bajarElSalto()})
		    }
        if(parcial.position().x() < self.position().x()) {textoScoreParcial.actualizarScore()}
        if(textoScoreParcial.cantRespondidas() == textoScoreParcial.cantPreguntasAprobar()){juego.finalGanador()}
        })
    }
    method hacerElSalto(){
        self.subir()
        self.derecha()
    }
    method bajarElSalto(){
        self.bajar()
        self.izquierda()
    }
}

object profesor inherits Personajes(
    position = game.at(juego.anchoPantalla() - 3, 1),
    image = "profe50.png"
){

}