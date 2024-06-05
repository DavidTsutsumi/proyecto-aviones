
import Foundation

struct Planificador {
    
    var plano: Plano //Instancia de la estructura Plano
    var numMovimientos: Int //Contador de movimientos realizados.
    var totalCoaliciones: Int //Contador de coaliciones totales.
    var coalicionesPorTurno: [Int: Int] //Diccionario que almacena el numero de coalicones por turno.
    
    
    //Inicializador que recibe una lista de aviones.
    init(aviones: [Avion]) {
        plano = Plano(aviones: aviones) //Inicializa el plano con los aviones.
        numMovimientos = 0 //Inicializa el contador de movimientos a 0.
        totalCoaliciones = 0 //Inicializa el contador total de coaliciones a 0.
        coalicionesPorTurno = [:] //Inicializa el diccionario de coaliciones vacío.
    }
    
    //Método que avanza el estado del plano al siguiente movimiento.
    mutating func next() {
        numMovimientos += 1
        plano = plano.next()
        let coaliciones = Analizador.calcularCoaliciones(aviones: plano.aviones)
        totalCoaliciones += coaliciones
        coalicionesPorTurno[numMovimientos] = coaliciones
    }
    
    //Método que retrocede el estado del plano al movimiento anterior.
    mutating func back() {
        guard numMovimientos > 0 else { return }
        numMovimientos -= 1
        plano = plano.back()
        if let coaliciones = coalicionesPorTurno[numMovimientos + 1] {
            totalCoaliciones -= coaliciones
            coalicionesPorTurno[numMovimientos + 1] = nil
        }
    }
    
    //Método que reinicia el estado del plano al inicial.
    mutating func reset() {
        numMovimientos = 0
        totalCoaliciones = 0
        coalicionesPorTurno.removeAll()
        plano = Plano(aviones: Aeromexico.aviones)
    }
}

