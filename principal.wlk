import utiles.*
import game.*
import pantallas.*
import personajes.*
import edificios.*

const velocidad = 150

object juego{
    const ancho = 28
    const alto = 14

    method restartGame(){
        game.allVisuals().forEach({visual => game.removeVisual(visual)})
    }

    method altoPantalla(){return alto}
    method anchoPantalla(){return ancho}

    method inicio(){
        self.restartGame()
        game.title("Rápido y estudioso")
        game.addVisual(pantallaInicioJuego)
	    game.height(alto)
	    game.width(ancho)
        game.addVisual(textoIniciarJuego)
        keyboard.space().onPressDo({self.instrucciones()})
    }

    method instrucciones(){
        self.restartGame()
        game.addVisual(pantallaInstrucciones)
        game.height(alto)
	    game.width(ancho)
        game.addVisual(textoIniciarJuego)
        keyboard.space().onPressDo({self.jugarMapa()})
    }

    method jugarMapa(){
        self.restartGame()
        game.height(alto)
	    game.width(ancho)
        game.addVisual(pantallaMapaCiudad)
        edificios.agregarEdificioAlJuego()
        game.addVisual(tomy)
        tomy.moverse()
        utiles.utilesNecesarios.forEach({u => game.addVisual(u)
            return self.ubicarAleatoriamente(u)})
        utiles.noNecesarios.forEach(({nn => game.addVisual(nn)
            return self.ubicarAleatoriamente(nn)}))
        game.whenCollideDo(tomy, {elemento => elemento.colisionadoPor(tomy)})
        game.addVisual(textoScoreUtiles)
        textoScoreUtiles.ubicarLista()
    }

    method rendirParcial(){
        self.restartGame()
        game.height(alto)
        game.width(ancho)
        game.addVisual(pantallaSalon)
        game.addVisual(tomyRinde)
        tomyRinde.saltar()
        game.addVisual(profesor)
        game.addVisual(parcial)
        parcial.iniciar()
        game.addVisual(textoScoreParcial)
        game.whenCollideDo(tomyRinde, {parcial => parcial.colisionadoPor(tomyRinde)})
    }

    method finalGanador(){
            self.restartGame()
            game.height(alto)
	        game.width(ancho)
            game.addVisual(pantallaGanador) 
    }

    method gameOver(){
        self.restartGame()
        game.height(alto)
        game.width(ancho)
        game.addVisual(pantallaGameOver)
    }

    method ubicarAleatoriamente(visual) {
		const posicion = new Position(
			x = 1.randomUpTo(ancho -1),
			y = 1.randomUpTo(alto -1)
		)
		if (game.getObjectsIn(posicion).isEmpty()) visual.position(posicion)
		else self.ubicarAleatoriamente(visual)
	}
}