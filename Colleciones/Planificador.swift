
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
        plano = plano.next(numMovimientos: numMovimientos)
        
        //Actualiza el contador de colisiones sumando el número de colisiones en el nuevo estado del plano
        numColisiones += plano.numColisiones
        
        //Recalcula el tamaño máximo de columnas y filas del plano actualizado
        plano.maxColumnas = plano.calcularMaxColumnas(aviones: plano.aviones)
        plano.maxFilas = plano.calcularMaxFilas(aviones: plano.aviones)
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

