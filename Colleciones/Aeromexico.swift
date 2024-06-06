
import Foundation

//Se define una estructura que contiene los aviones de Aeromexico.
struct Aeromexico {
    
    private init() {    }
    
    // Se define una lista de aviones con sus coordenadas y direcciones.
    static let aviones = [
        Avion(x: 0, y: 0, direccion: .east),
        Avion(x: 0, y: 1, direccion: .east),
        Avion(x: 0, y: 2, direccion: .east),
        Avion(x: 0, y: 3, direccion: .east),
        Avion(x: 4, y: 0, direccion: .west),
        Avion(x: 4, y: 1, direccion: .west),
        Avion(x: 4, y: 2, direccion: .west),
        Avion(x: 4, y: 3, direccion: .west),
        Avion(x: 4, y: 4, direccion: .north),
        Avion(x: 14, y: 14, direccion: .north),
        Avion(x: 0, y: 5, direccion: .east),
        Avion(x: 0, y: 6, direccion: .east),
        Avion(x: 0, y: 7, direccion: .east),
        Avion(x: 0, y: 8, direccion: .east),
        Avion(x: 4, y: 5, direccion: .west),
        Avion(x: 4, y: 6, direccion: .west),
        Avion(x: 4, y: 7, direccion: .west),
        Avion(x: 4, y: 8, direccion: .west),
        Avion(x: 4, y: 9, direccion: .north),
        Avion(x: 14, y: 13, direccion: .north),
        Avion(x: 1, y: 0, direccion: .east),
        Avion(x: 1, y: 1, direccion: .east),
        Avion(x: 1, y: 2, direccion: .east),
        Avion(x: 1, y: 3, direccion: .east),
    ]

}
