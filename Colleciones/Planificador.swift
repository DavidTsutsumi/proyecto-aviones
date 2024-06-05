//
//  Generador.swift
//  Colleciones
//
//  Created by Cristian Cardoso on 18/04/24.
//  Modified by David Tsutsumi

import Foundation

struct Planificador {
    
    var plano: Plano
    var numMovimientos: Int
    var totalCoaliciones: Int
    var coalicionesPorTurno: [Int: Int]
    
    init(aviones: [Avion]) {
        plano = Plano(aviones: aviones)
        numMovimientos = 0
        totalCoaliciones = 0
        coalicionesPorTurno = [:]
    }
    
    mutating func next() {
        numMovimientos += 1
        plano = plano.next()
        let coaliciones = Analizador.calcularCoaliciones(aviones: plano.aviones)
        totalCoaliciones += coaliciones
        coalicionesPorTurno[numMovimientos] = coaliciones
    }
    
    mutating func back() {
        guard numMovimientos > 0 else { return }
        numMovimientos -= 1
        plano = plano.back()
        if let coaliciones = coalicionesPorTurno[numMovimientos + 1] {
            totalCoaliciones -= coaliciones
            coalicionesPorTurno[numMovimientos + 1] = nil
        }
    }
    
    mutating func reset() {
        numMovimientos = 0
        totalCoaliciones = 0
        coalicionesPorTurno.removeAll()
        plano = Plano(aviones: Aeromexico.aviones)
    }
}

