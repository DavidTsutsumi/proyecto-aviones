
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
    
    
    //Método que avanza el estado del plano al siguiente movimiento.
    mutating func next() {
        
        //Crea un nuevo arreglo para almacenar los aviones que no están involucrados en una colisión.
        var newAviones = [Avion]()
        
        //Itera sobre cada avión en el plano actual
        for avion in plano.aviones {
            //Verifica si el avión actual no está en una posición que cause una colisión
            if !plano.colisiones.contains(Colision(x: avion.x, y: avion.y)) {
                //Si no está en colisión, se agrega al nuevo arreglo de aviones
                newAviones.append(avion)
            }
        }
        //Actualiza el arreglo de aviones del plano con los aviones que no están en colisión
        plano.aviones = newAviones
        
        //Actualiza el estado del plano al siguiente movimiento
        numMovimientos += 1
        plano = plano.next(numMovimientos: numMovimientos)
        colisiones[numMovimientos] = plano.numColisiones
        
        //Actualiza el contador de colisiones sumando el número de colisiones en el nuevo estado del plano
        
        //Recalcula el tamaño máximo de columnas y filas del plano actualizado
        plano.maxColumnas = plano.calcularMaxColumnas(aviones: plano.aviones)
        plano.maxFilas = plano.calcularMaxFilas(aviones: plano.aviones)
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

