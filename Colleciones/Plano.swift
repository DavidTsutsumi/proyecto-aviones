import Foundation

struct Plano {
    
    var numMovimientos = 0
    let avionesOriginales: [Avion]
    var aviones: [Avion] 
    
    var maxColumnas: Int
    var maxFilas: Int
    
    
    init(aviones: [Avion]) {
        self.avionesOriginales = aviones
        self.aviones = aviones
        self.maxColumnas = 0
        self.maxFilas = 0
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
    // FIN Funciones para calcular el máximo de columnas y filas

    var columnas: Int {
        return maxColumnas
    }
    
    var filas: Int {
        return maxFilas
    }

    var numCoaliciones: Int {
        return Analizador.calcularCoaliciones(aviones: aviones)
    }

    func getAvion(row: Int, section: Int) -> Avion? {
        return aviones.first { avion in
            avion.x == row && avion.y == section
        }
    }
    
    mutating func next() -> Self {
        numMovimientos += 1
        aviones = Analizador.next(numPaso: numMovimientos, aviones: aviones) // Cambié esta línea
        return self
    }
    
    mutating func back() -> Self {
        guard numMovimientos - 1 > 0 else { return self }
        numMovimientos -= 1
        aviones = Analizador.back(numPaso: numMovimientos, aviones: aviones) // Cambié esta línea
        return self
    }
}
