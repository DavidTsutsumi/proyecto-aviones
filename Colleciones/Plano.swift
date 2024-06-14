import Foundation

//Se define una estructura que representa el plano y los aviones actuales en él.
struct Plano {
    
    var numMovimientos = 0 //Contador de movimientos realizados en el juego.
    let avionesOriginales: [Avion] //Lista de aviones original en el plano.
    var aviones: [Avion]  //Lista de aviones actual en el plano.
    var colisiones: Set<Colision>  //Lista de aviones actual en el plano.
    var maxColumnas: Int //Número máximo de columnas en el plano.
    var maxFilas: Int //Número máximo de filas en el plano.
    
    
    // Se inicializa el plano con una lista de aviones y calcula su tamaño máximo en columnas y filas.
    init(aviones: [Avion], colisiones: Set<Colision>) {
        self.avionesOriginales = aviones
        self.aviones = aviones
        self.maxColumnas = 0
        self.maxFilas = 0
        self.colisiones = colisiones
        self.maxColumnas = calcularMaxColumnas(aviones: aviones)
        self.maxFilas = calcularMaxFilas(aviones: aviones)
    }
    
    
    // Funciones para calcular el máximo de columnas y filas
    public func calcularMaxColumnas(aviones: [Avion]) -> Int {
        var maxCol = -1
        for avion in aviones {
            if avion.x > maxCol {
                maxCol = avion.x
            }
        }
        return maxCol + 1
    }
    
    public func calcularMaxFilas(aviones: [Avion]) -> Int {
        var maxFil = -1
        for avion in aviones {
            if avion.y > maxFil {
                maxFil = avion.y
            }
        }
        return maxFil + 1
    }
    
    //Calcula el número de columnas en el plano.
    var columnas: Int {
        return maxColumnas
    }
    
    //Calcula el número de filas en el plano.
    var filas: Int {
        return maxFilas
    }
    
    //Calcula el número de coaliciones entre los aviones.
    var numColisiones: Int {
        return colisiones.count
    }

    func getAvion(row: Int, section: Int) -> Avion? {
        return aviones.first { avion in
            avion.x == row && avion.y == section
        }
    }
    
    func getColision(row: Int, section: Int) -> Colision? {
        return colisiones.first { avion in
            avion.x == row && avion.y == section
        }
    }
    
    //Avanza un movimiento en el juego y devuelve el plano actualizado.
    mutating func next(numMovimientos: Int) -> Self {
        return Analizador.next(numPaso: numMovimientos, aviones: aviones)
    }
    
    //Retrocede un movimiento en el juego y devuelve el plano actualizado.
    mutating func back(numMovimientos: Int) -> Self {
        return Analizador.back(numPaso: numMovimientos, aviones: aviones)
    }

}
