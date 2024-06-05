import Foundation

class Analizador {
    
    static var memoria = [Int: [Avion]]()
    static var coalicionesPorPaso = [Int: Int]()
    
    public static func next(numPaso: Int, aviones: [Avion]) -> [Avion] {
        if let existe = Analizador.memoria[numPaso] {
            return existe
        } else {
            var temporal = [Avion]()
            for avion in aviones {
                var av = Avion()
                av.direccion = avion.direccion
                av.x = avion.x
                av.y = avion.y
                switch avion.direccion {
                case .north:
                    av.y = avion.y - 1
                case .south:
                    av.y = avion.y + 1
                case .east:
                    av.x = avion.x + 1
                case .west:
                    av.x = avion.x - 1
                }
                temporal.append(av)
            }
            Analizador.memoria[numPaso] = temporal
            Analizador.coalicionesPorPaso[numPaso] = calcularCoaliciones(aviones: temporal)
            return temporal
        }
    }
    
    public static func back(numPaso: Int, aviones: [Avion]) -> [Avion] {
        if numPaso == 0 {
            return []
        } else if let existe = Analizador.memoria[numPaso - 1] {
            return existe
        } else {
            var temporal = [Avion]()
            for avion in aviones {
                var av = Avion()
                av.direccion = avion.direccion
                av.x = avion.x
                av.y = avion.y
                switch avion.direccion {
                case .north:
                    av.y = avion.y + 1
                case .south:
                    av.y = avion.y - 1
                case .east:
                    av.x = avion.x - 1
                case .west:
                    av.x = avion.x + 1
                }
                temporal.append(av)
            }
            Analizador.memoria[numPaso - 1] = temporal
            Analizador.coalicionesPorPaso[numPaso - 1] = calcularCoaliciones(aviones: temporal)
            return temporal
        }
    }

    public static func calcularCoaliciones(aviones: [Avion]) -> Int {
        var posiciones = [String: Int]()
        for avion in aviones {
            let key = "\(avion.x),\(avion.y)"
            posiciones[key, default: 0] += 1
        }
        return posiciones.values.filter { $0 > 1 }.count
    }
}
