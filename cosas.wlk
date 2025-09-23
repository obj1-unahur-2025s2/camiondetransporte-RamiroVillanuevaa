object knightrider {
  method peso() = 100
  
  method peligrosidad() = 10
}

object bumblebee {
  var estaEnAuto = true
  
  method estaEnAuto() = estaEnAuto
  
  method transformarse() {
    estaEnAuto = not estaEnAuto
  }
  
  method peligrosidad() = if (self.estaEnAuto()) 15 else 30
  
  method peso() = 800
}

object paqueteLadrillos {
  var cantidadLadrillos = 0
  
  method peso() = self.cantidadLadrillos() * 2 //2 peso por ladrillo
  
  method peligrosidad() = 2
  
  method cantidadLadrillos() = cantidadLadrillos
  
  method agregar(cantidad) {
    cantidadLadrillos += cantidad
  }
}

object arenaGranel {
  var peso = 1
  
  method peso() = peso
  
  method agregar(cantidad) {
    peso = cantidad
  }
  
  method peligrosidad() = 1
}

object bateriaAntiaerea {
  var peso = 200
  var estaConMisiles = false
  var peligrosidad = 0
  
  method estaConMisiles() = estaConMisiles
  
  method cambiarMisiles() {
    estaConMisiles = not estaConMisiles
  }

  method peso() = if (self.estaConMisiles()) {
    peso = 300
  } else {
    peso = 200
  }
  
  method peligrosidad() = if (self.estaConMisiles()) {
    peligrosidad = 100
  } else {
    peligrosidad = 0
  }
}

object contenedorPortuario {
  const contenido = []
 
  method peso() = 100 + contenido.sum({ o => o.peso() })
  
  method agregar(unObjeto) {
    contenido.add(unObjeto)
  }
  
  method peligrosidad() = if (contenido.isEmpty()) 0 else contenido.max({ o => o.peligrosidad() }).peligrosidad() //contenido.map({o => o.peligrosidad()}).max()
}

object resudiosRadioactivos {
  var peso = 0
  
  method setPeso(nuevoPeso) {
    peso = nuevoPeso
  }
  
  method peligrosidad() = 200
}

object embalajeSeguridad {
  var objetoEmbalado = null
  
  method embalar(unObjeto) {
    objetoEmbalado = unObjeto
  }
  
  method peso() = objetoEmbalado.peso()
  
  method peligrosidad() = objetoEmbalado.peligrosidad() / 2
}