import Foundation

class Analizador {
    
    //Diccionario para almacenar la memoria de los estados de los aviones.
    static var memoria = [Int: Plano]()
    
    public static func initialize(aviones: [Avion]) -> Plano {
        let plano = Plano(aviones: aviones, colisiones: Set<Colision>())
        memoria[0] = plano
        return plano
    }
    
    //Método para avanzar al siguiente movimiento y actualizar la posición de los aviones.
    public static func next(numPaso: Int, aviones: [Avion]) -> Plano {
        //Verifica si el estado para el movimiento actual ya está en memoria.
        if let existe = Analizador.memoria[numPaso] {
            //Si existe lo retorna.
            return existe
        } else {
            //Si no existe crea una lista temporal para los aviones actualizados.
            var temporal = [Avion]()
            //Itera sobre cada avión y actualiza su posición según su dirección.
            for avion in aviones {
                var av = Avion()
                av.direccion = avion.direccion
                av.x = avion.x
                av.y = avion.y
                //Actualiza la posición del avión según su dirección.
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
                //Agrega el avión actualizado a la lista temporal.
                temporal.append(av)
            }
            
            let colisiones = calcularCoaliciones(aviones: temporal)

            for colision in colisiones {
                temporal.removeAll { avion in
                    avion.x == colision.x && avion.y == colision.y
                }
            }
    
            
            let plano = Plano(aviones: temporal, colisiones: colisiones)
            //Almacena el nuevo estado de los aviones en memoria.
            Analizador.memoria[numPaso] = plano
            //Retorna la lista de aviones actualizada.
            return plano
        }
    }
    
    //Método para avanzar al retroceder movimiento y actualizar la posición de los aviones.
    public static func back(numPaso: Int, aviones: [Avion]) -> Plano {
        //Si el movimiento es 0, retorna una lista vacía.
        if let existe = Analizador.memoria[numPaso] {
            //Si el estado del movimiento anterior está en memoria lo retorna.
            return existe
        } else {
            //Si no existe crea una lista temporal para los aviones actualizados.
            var temporal = [Avion]()
            //Itera sobre cada avión y actualiza su posición al contrario según su dirección.
            for avion in aviones {
                var av = Avion()
                av.direccion = avion.direccion
                av.x = avion.x
                av.y = avion.y
                //Actualiza la posición del avión según su dirección contraria.
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
                //Agrega el avión actualizado a la lista temporal.
                temporal.append(av)
            }
            let colisiones = calcularCoaliciones(aviones: temporal)
            let plano = Plano(aviones: temporal, colisiones: colisiones)
            //Almacena el nuevo estado de los aviones en memoria para el movimiento anterior.
            Analizador.memoria[numPaso] = plano
            //Retorna la lista de aviones actualizada.
            return plano
        }
    }
    
    //Método para calcular el número de coaliciones entre aviones.
    public static func calcularCoaliciones(aviones: [Avion]) -> Set<Colision>{
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
        return colisiones
    }
    
    public static func flush() -> Plano {
        guard let plano = Analizador.memoria[0] else { return Plano(aviones: [], colisiones: Set<Colision>())}
        memoria.removeAll()
        memoria[0] = plano
        return plano
    }
        
}
