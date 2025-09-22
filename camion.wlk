object camion {
    const carga = []

    method getCarga() = carga

    method peso() = 1000 //en kilogramos

    method pesoTotal() = self.peso() + carga.peso()// falta codear 

    method pesoTotalCarga() = carga.sum({a => a.peso()}) 

    method todosLosPesosPares() = carga.all({a => a.peso() % 2 == 0}) 

    method algunaCosaPesa(peso) {
        const salida = carga.filter({a => a.peso() == peso})
        return(salida.size() > 0)
    }

    method primerCosaCargadaConPeligrosidad(nivelDePeligrosidad) {
        const salida = carga.filter({a => a.peligrosidad() == nivelDePeligrosidad})
        return salida[0] 
    }

    method todasLasCosasConNivelDePeligrosidad(nivelDePeligrosidad) {
        const salida = carga.filter({a => a.peligrosidad() == nivelDePeligrosidad})
        return salida 
    }

    method todasLasCosasQueSuperanElNivelDePeligrosidad(nivelDePeligrosidad) {
        const salida = carga.filter({a => a.peligrosidad() > nivelDePeligrosidad})
        return salida
    }

    method estaExedido() = self.pesoTotal() > 2500 //en Kilogramos

    method puedeCircular(nivelDePeligrosidad) {
        return not(self.estaExedido()) && self.todasLasCosasConNivelDePeligrosidad(nivelDePeligrosidad).isEmpty()
        }

    method tieneAlgunaCosaEntre(valor1, valor2) {
        const salida = carga.filter({a => a.peso().between(valor1, valor2)})
    }

    method cosaMasPesadaCargada() = carga.max({a => a.peso()})

    method cargar(algo) {
      carga.add(algo)
    }

    method cargarVariasCosas(listaDeCosas) {
      carga.addAll(listaDeCosas)
    }

    method descargar(algo) {
      carga.remove(algo)
    }

    method descargarTodo() {
      carga.clear()
    }


}