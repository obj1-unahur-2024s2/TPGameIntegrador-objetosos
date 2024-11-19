import principal.*
import game.*


object paleta{
  const property negro = "000000" 
}

object pantallaInicioJuego{
  method position() = game.origin()
  method image() = "principal_700.png"
}

object textoIniciarJuego {
  method position() = game.at(14,0)
  method text() = "P R E S I O N A   L A   B A R R A   E S P A C I A D O R A   P A R A   J U G A R"
  method textColor() = paleta.negro()
}

object textoFinJuego {
  method position() = game.center()
  method text() = "F E L I C I D A D E S .  A P R O B A S T E   E L   P A R C I A L"
  method textColor() = paleta.negro()
}

object pantallaInstrucciones{
  method position() = game.origin()
  method image() = "instrucciones_700.png"
}

object pantallaMapaCiudad{
  method position() = game.origin()
  method image() = "mapaCiudad_700.png"
}

object pantallaFinal{
  method position() = game.origin()
  method image() = "final700.png"
}


