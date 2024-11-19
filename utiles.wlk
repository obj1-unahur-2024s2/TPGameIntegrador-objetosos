import game.*
import visual.*
import principal.*

class Utiles inherits Visuales{

    override method colisionadoPor(personaje){
        game.say(personaje,personaje.mensajeMeSirve())
        game.removeVisual(self)
        principal.utilesQueTiene.add(self)
    }

}

const auriculares = new Utiles(position = game.origin(), image = "auriculares75.png")
const borrador = new Utiles(position = game.origin(), image = "borrador75.png")
const cuaderno = new Utiles(position = game.origin(), image = "cuaderno75.png")
const lapicera = new Utiles(position = game.origin(), image = "lapicer75.png")
const laptop = new Utiles(position = game.origin(), image = "laptop75.png")
const mochila = new Utiles(position = game.origin(), image = "mochila75.png")
const resaltador = new Utiles(position = game.origin(), image = "resaltador75.png")

const utilesNecesarios = [auriculares, borrador, cuaderno, lapicera, laptop, mochila, resaltador]

