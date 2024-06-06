
import Foundation

struct Planificador {
    
    var plano: Plano //Instancia de la estructura Plano
    var numMovimientos: Int //Contador de movimientos realizados.
    var numColisiones: Int
    
    //Inicializador que recibe una lista de aviones.
    init(aviones: [Avion]) {
        plano = Plano(aviones: aviones, colisiones: Set<Colision>()) //Inicializa el plano con los aviones.
        numMovimientos = 0 //Inicializa el contador de movimientos a 0.
        numColisiones = 0
    }
    
    //Método que avanza el estado del plano al siguiente movimiento.
    mutating func next() {
        numMovimientos += 1
        plano = plano.next(numMovimientos: numMovimientos)
        numColisiones += plano.numColisiones
    }
    
    //Método que retrocede el estado del plano al movimiento anterior.
    mutating func back() {
        guard numMovimientos > 0 else { return }
        numMovimientos -= 1
        plano = plano.back(numMovimientos: numMovimientos)
        numColisiones -= plano.numColisiones
    }
    
    //Método que reinicia el estado del plano al inicial.
    mutating func reset() {
        numMovimientos = 0
        Analizador.flush()
        plano = Plano(aviones: Aeromexico.aviones, colisiones: Set<Colision>())
        
        //Agregue esto para que se reiniciaran los valores
        numColisiones = 0
        numMovimientos = 0
    }
}

