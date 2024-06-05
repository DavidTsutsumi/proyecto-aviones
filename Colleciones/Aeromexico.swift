//
//  Aeromexico.swift
//  Colleciones
//
//  Created by Cristian Cardoso on 18/04/24.
//

import Foundation

struct Aeromexico {
    
    private init() {    }

    static let aviones = [
        Avion(x: 0, y: 0, direccion: .east),
        Avion(x: 0, y: 1, direccion: .east),
        Avion(x: 0, y: 2, direccion: .east),
        Avion(x: 0, y: 3, direccion: .east),
        Avion(x: 3, y: 0, direccion: .west),
        Avion(x: 3, y: 1, direccion: .west),
        Avion(x: 3, y: 2, direccion: .west),
        Avion(x: 3, y: 3, direccion: .west),
        Avion(x: 4, y: 4, direccion: .north),
        Avion(x: 14, y: 14, direccion: .north),
        //Avion(x: 30, y: 30, direccion: .north)
   


    ]
}
