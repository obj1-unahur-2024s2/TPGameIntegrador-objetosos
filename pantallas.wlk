import principal.*
import game.*
import utiles.*

class Pantallas{
  var property position 
  var property image 
}

const pantallaInicioJuego = new Pantallas(position = game.origin(), image = "principal_700.png")
const pantallaInstrucciones = new Pantallas(position = game.origin(), image ="instrucciones_controles.png")
const pantallaMapaCiudad = new Pantallas(position = game.origin(), image = "mapaCiudad_700.png")
const pantallaSalon = new Pantallas(position = game.origin(), image = 'salon.png')
const pantallaGameOver = new Pantallas(position = game.origin(), image = "gameOver.png")
const pantallaGanador = new Pantallas(position = game.origin(), image = "aprobado.png")

object paleta{
  const property negro = "000000" 
}

class Texto{
  var property position
  var property text
  var property textColor
}

object textoIniciarJuego inherits Texto
  (position = game.at(14,0), 
  text = "P R E S I O N A   L A   B A R R A   E S P A C I A D O R A   P A R A   J U G A R", 
  textColor = paleta.negro()){

  }


object textoScoreUtiles inherits Texto
  (position = game.at(juego.anchoPantalla() -3, juego.altoPantalla() -1),
  text = "UTILES QUE NECESITA " + 0 + " / " + utiles.utilesNecesarios.size(),
  textColor = paleta.negro()){

    var cantUtiles = 0

    method cantUtilesTiene(){return cantUtiles}

    method actualizarScore(){
      game.removeVisual(self)
      cantUtiles += 1
      text = "UTILES QUE NECESITA " + cantUtiles + " / " + utiles.utilesNecesarios.size()
      game.addVisual(self)
    }

    var ubicacionLista = self.position()
    method siguientePosicion(){
      ubicacionLista = game.at(ubicacionLista.x(), ubicacionLista.y()-1)  
      return ubicacionLista
      }

    method ubicarLista(){
      utilesNecesarios.forEach({
        g => 
        const nombre = new Texto(position = self.siguientePosicion(),
          text = g.nombre(),
          textColor = paleta.negro())
        game.addVisual(nombre)})
    }
  }

const cuadernoLista = new Texto(
  position = game.at(juego.anchoPantalla() -3, juego.altoPantalla() -3),
  text = cuaderno.nombre(),
  textColor = paleta.negro())

object textoScoreParcial inherits Texto
  (position = game.at(juego.anchoPantalla()/2, 0),
  text = "PREGUNTAS RESPONDIDAS " + 0 + " / PREGUNTAS PARA APROBAR " + self.cantPreguntasAprobar(),
  textColor = paleta.negro()){

    const cantPreguntas = 3
    var cantPreguntasRespondidas = 0

    method cantRespondidas(){return cantPreguntasRespondidas}
    method cantPreguntasAprobar(){return cantPreguntas}

    method actualizarScore(){
      game.removeVisual(self)
      cantPreguntasRespondidas += 1
      text = "PREGUNTAS RESPONDIDAS " + cantPreguntasRespondidas + " / PREGUNTAS PARA APROBAR " + cantPreguntas
      game.addVisual(self)
    }
    
  }
 




