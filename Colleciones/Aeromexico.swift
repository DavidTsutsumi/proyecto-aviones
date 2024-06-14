
import Foundation

//Se define una estructura que contiene los aviones de Aeromexico.
struct Aeromexico {
    
    private init() {    }
    
    // Se define una lista de aviones con sus coordenadas y direcciones.
    
    static let aviones = [
        
        Avion(x: 0, y: 0, direccion: .south),
        Avion(x: 0, y: 3, direccion: .south),
        Avion(x: 0, y: 6, direccion: .south),
        Avion(x: 0, y: 9, direccion: .south),
        Avion(x: 0, y: 12, direccion: .south),
        Avion(x: 4, y: 0, direccion: .east),
        Avion(x: 4, y: 2, direccion: .north),
        Avion(x: 4, y: 4, direccion: .east),
        Avion(x: 4, y: 6, direccion: .north),
        Avion(x: 4, y: 8, direccion: .east),
        Avion(x: 4, y: 10, direccion: .north),
        Avion(x: 4, y: 14, direccion: .north),
        Avion(x: 8, y: 0, direccion: .north),
        Avion(x: 8, y: 2, direccion: .west),
        Avion(x: 8, y: 4, direccion: .north),
        Avion(x: 8, y: 6, direccion: .west),
        Avion(x: 8, y: 8, direccion: .north),
        Avion(x: 8, y: 10, direccion: .west),
        Avion(x: 8, y: 12, direccion: .north),
        Avion(x: 8, y: 14, direccion: .west),
        Avion(x: 12, y: 0, direccion: .north),
        Avion(x: 12, y: 3, direccion: .north),
        Avion(x: 12, y: 6, direccion: .north),
        Avion(x: 12, y: 9, direccion: .north),
        Avion(x: 12, y: 12, direccion: .north),
        Avion(x: 2, y: 1, direccion: .south),
        Avion(x: 2, y: 5, direccion: .east),
        Avion(x: 2, y: 9, direccion: .south),
        Avion(x: 2, y: 13, direccion: .east),
        Avion(x: 10, y: 1, direccion: .north),
        Avion(x: 10, y: 5, direccion: .west),
        Avion(x: 10, y: 9, direccion: .north),
        Avion(x: 10, y: 13, direccion: .west),
        Avion(x: 6, y: 2, direccion: .east),
        Avion(x: 6, y: 7, direccion: .south),
        Avion(x: 6, y: 11, direccion: .east),
        Avion(x: 14, y: 2, direccion: .west),
        Avion(x: 14, y: 7, direccion: .north),
        Avion(x: 14, y: 11, direccion: .west),
        Avion(x: 0, y: 14, direccion: .south),
        Avion(x: 14, y: 0, direccion: .north)

    ]
    

}
