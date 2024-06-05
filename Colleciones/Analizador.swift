import Foundation

class Analizador {
    
    //Diccionario para almacenar la memoria de los estados de los aviones.
    static var memoria = [Int: [Avion]]()
    
    //Diccionario para almacenar el número de coaliciones.
    static var coalicionesPorPaso = [Int: Set<Colision>]()
    
    //Método para avanzar al siguiente movimiento y actualizar la posición de los aviones.
    public static func next(numPaso: Int, aviones: [Avion]) -> [Avion] {
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
            //Almacena el nuevo estado de los aviones en memoria.
            Analizador.memoria[numPaso] = temporal
            //Retorna la lista de aviones actualizada.
            return temporal
        }
    }
    
    //Método para avanzar al retroceder movimiento y actualizar la posición de los aviones.
    public static func back(numPaso: Int, aviones: [Avion]) -> [Avion] {
        //Si el movimiento es 0, retorna una lista vacía.
        if numPaso == 0 {
            return []
        } else if let existe = Analizador.memoria[numPaso - 1] {
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
            //Almacena el nuevo estado de los aviones en memoria para el movimiento anterior.
            Analizador.memoria[numPaso - 1] = temporal
            //Calcula y almacena el número de coaliciones para el nuevo estado para el movimiento anterior.
            //Retorna la lista de aviones actualizada.
            return temporal
        }
    }
        
}
