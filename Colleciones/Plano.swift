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
    init(aviones: [Avion]) {
        self.avionesOriginales = aviones
        self.aviones = aviones
        self.maxColumnas = 0
        self.maxFilas = 0
        self.colisiones = Set<Colision>()
        self.maxColumnas = calcularMaxColumnas(aviones: aviones)
        self.maxFilas = calcularMaxFilas(aviones: aviones)
    }
    
    
    // Funciones para calcular el máximo de columnas y filas
    private func calcularMaxColumnas(aviones: [Avion]) -> Int {
        var maxCol = -1
        for avion in aviones {
            if avion.x > maxCol {
                maxCol = avion.x
            }
        }
        return maxCol + 1
    }
    
    private func calcularMaxFilas(aviones: [Avion]) -> Int {
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
    var numCoaliciones: Int {
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
    mutating func next() -> Self {
        numMovimientos += 1
        aviones = Analizador.next(numPaso: numMovimientos, aviones: aviones)
        calcularCoaliciones()
        return self
    }
    
    //Retrocede un movimiento en el juego y devuelve el plano actualizado.
    mutating func back() -> Self {
        guard numMovimientos > 0 else { return self } // Verifica que aún haya movimientos para retroceder
        aviones = Analizador.back(numPaso: numMovimientos, aviones: aviones)
        numMovimientos -= 1
        return self
    }
    
    //Método para calcular el número de coaliciones entre aviones.
    mutating func calcularCoaliciones() {
        //Diccionario para contar las posiciones de los aviones.
        var posiciones = [String: Int]()
        
        var colisiones = Set<Colision>()
        //Itera sobre cada avión y cuenta cuántos aviones hay en cada posición.
        for avion in aviones {
            let key = "\(avion.x)|\(avion.y)"
            posiciones[key, default: 0] += 1
        }
        
        // Cuenta cuántas posiciones tienen más de un avión y retorna ese número.
        for colision in posiciones {
            if colision.value > 1 {
                let x = colision.key.split(separator: "|")[0]
                let y = colision.key.split(separator: "|")[1]
                colisiones.insert(Colision(x: Int(x)!, y: Int(y)!))
            }
        }
        self.colisiones = colisiones
    }

}
