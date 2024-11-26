import pantallas.*
import game.*
import visual.*
import principal.*
import edificios.*
import personajes.*

class Utiles inherits Visuales{

    const property nombre  

    override method colisionadoPor(personaje){
        if(utilesNecesarios.contains(self)){
            game.say(personaje,personaje.mensajeMeSirve())
            game.removeVisual(self)
            textoScoreUtiles.actualizarScore()
            if(textoScoreUtiles.cantUtilesTiene() == utilesNecesarios.size()){
                game.addVisual(universidadNueva)
                game.say(personaje, personaje.mensajePuedoRendir())
            }
        }
        else{game.say(personaje,personaje.mensajeNoMeSirve())}
    }

}

const auriculares = new Utiles(nombre = "Auriculares", position = game.origin(), image = "auriculares75.png")
const borrador = new Utiles(nombre = "Borrador", position = game.origin(), image = "borrador75.png")
const cuaderno = new Utiles(nombre = "Cuaderno", position = game.origin(), image = "cuaderno75.png")
const lapicera = new Utiles(nombre = "Lapicera", position = game.origin(), image = "lapicer75.png")
const laptop = new Utiles(nombre = "Laptop", position = game.origin(), image = "laptop75.png")
const mochila = new Utiles(nombre = "Mochila", position = game.origin(), image = "mochila75.png")
const resaltador = new Utiles(nombre = "Resaltador", position = game.origin(), image = "resaltador75.png")

const utilesNecesarios = [cuaderno, lapicera, laptop, mochila]
const noNecesarios = [auriculares, borrador, resaltador]


object parcial inherits Visuales(
    position = profesor.position(), 
    image = "examen50.png")
    {
        method posicionar(){position = profesor.position()}
        method iniciar(){
            self.posicionar()
            game.onTick(velocidad, "moverParcial", {self.mover()})
        }

        method mover(){
            position = position.left(1)
            if (position.x() == -1) self.posicionar()
        }

        override method colisionadoPor(personaje){
        juego.gameOver()
    }
    }