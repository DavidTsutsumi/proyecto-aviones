
import Foundation

struct Planificador {
    
    var plano: Plano //Instancia de la estructura Plano
    var numMovimientos: Int = 0 //Contador de movimientos realizados.
    var numColisiones: Int { //Contador de colisiones realizados.
        var num = 0
        for valor in colisiones.values {
            num += valor
        }
        return num
    }
    //Guardar paso con el número de colisiones en ese paso.
    var colisiones: [Int: Int] = [:]

    //Inicializador que recibe una lista de aviones.
    init(aviones: [Avion]) {
        plano = Analizador.initialize(aviones: aviones)
    }
    
    var gridSize: Int {
        Analizador.memoria[0]?.maxColumnas ?? 0
    }
    
    
    //Método que avanza el estado del plano al siguiente movimiento.
    mutating func next() {
        
        //Actualiza el estado del plano al siguiente movimiento
        numMovimientos += 1
        plano = plano.next(numMovimientos: numMovimientos)
        colisiones[numMovimientos] = plano.numColisiones
    }
    
    //Método que retrocede el estado del plano al movimiento anterior.
    mutating func back() {
        
        //Habia puesto una condición que si la posición es igual a 1 haga un reset
        guard numMovimientos > 0 else { return }
        colisiones[numMovimientos] = 0
        numMovimientos -= 1
        plano = plano.back(numMovimientos: numMovimientos)
    }
    
    //Método que reinicia el estado del plano al inicial.
    mutating func reset() {
        plano = Analizador.flush()
        //Agregue esto para que se reiniciaran los valores
        numMovimientos = 0
        colisiones = [:]
    }
}

