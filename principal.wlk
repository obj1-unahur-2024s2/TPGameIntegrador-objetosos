import game.*
import pantallas.*
import personajes.*
import edificios.*

object principal{
    const ancho = 28
    const alto = 14
    const utilesQueTiene = []

    method restarGame(){
        game.allVisuals().forEach({visual => game.removeVisual(visual)})
    }

    method altoPantalla(){return alto}
    method anchoPantalla(){return ancho}

    method inicio(){
        self.restarGame()
        game.title("Rápido y estudioso")
        game.addVisual(pantallaInicioJuego)
	    game.height(alto)
	    game.width(ancho)
        game.addVisual(textoIniciarJuego)
        keyboard.space().onPressDo({self.instrucciones()})
    }

    method instrucciones(){
        self.restarGame()
        game.addVisual(pantallaInstrucciones)
        game.height(alto)
	    game.width(ancho)
        game.addVisual(textoIniciarJuego)
        keyboard.space().onPressDo({self.jugar()})
    }

    method jugar(){
        self.restarGame()
        game.height(alto)
	    game.width(ancho)
        game.addVisual(pantallaMapaCiudad)
        edificios.agregarEdificioAlJuego()
        game.addVisual(tomy)
        tomy.moverse()
        game.whenCollideDo(tomy, {elemento => elemento.colisionadoPor(tomy)})
        utiles.utilesNecesarios.forEach({u => game.addVisual(u)
            return self.ubicarAleatoriamente(u)})
        if(self.tieneUtilesNecesarios()){self.final()}
    }

    method final(){
        
            self.restarGame()
            game.height(alto)
	        game.width(ancho)
            game.addVisual(pantallaFinal)
            game.addVisual(textoFinJuego)
        
    }


    method tieneUtilesNecesarios(){return utilesQueTiene.size() == utiles.utilesNecesarios.size() }

    method ubicarAleatoriamente(visual) {
		const posicion = new Position(
			x = 1.randomUpTo(ancho),
			y = 1.randomUpTo(alto)
		)
		if (game.getObjectsIn(posicion).isEmpty()) visual.position(posicion)
		else self.ubicarAleatoriamente(visual)
	}
}