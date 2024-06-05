//
//  ViewController.swift
//  Colleciones
//
//  Created by Cristian Cardoso on 18/04/24.
//  Modified by David Tsutsumi

import UIKit
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collection: UICollectionView!
    
    let reuseIdentifier = "miCelda"
    // Seleccionar la planificacion de ruta de la aerolinea de su preferencia
    
    var planificador = Planificador(aviones: Aeromexico.aviones)
//    var planificador = Planificador(aviones: AmericanAirlines.aviones)

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: reuseIdentifier,
            for: indexPath as IndexPath
        ) as! MiCollectionViewCell
        
        if let avion = planificador.plano.getAvion(row: indexPath.row, section: indexPath.section) {
            cell.direccion(avion: avion)
        } else {
            cell.none()
        }
        cell.style()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return planificador.plano.columnas
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return planificador.plano.filas
    }
    
    //Variable que contabiliza los movimientos
    
    @IBAction func tapBack(_ sender: Any) {
        
        
        planificador.back()
        movimientos.text = "Movimientos: \(planificador.plano.numMovimientos)"
        //coaliciones.text = "Coaliciones: \(planificador.plano.numCoaliciones)"
        actualizarCoaliciones()
        collection.reloadData()
    }
    
    @IBAction func tapNext(_ sender: Any) {
        
        planificador.next()
        movimientos.text = "Movimientos: \(planificador.plano.numMovimientos)"
        //coaliciones.text = "Coaliciones: \(planificador.plano.numCoaliciones)"
        actualizarCoaliciones()
        collection.reloadData()
    }
    
    @IBAction func tapReset(_ sender: Any) {
        planificador.reset()
        movimientos.text = "Movimientos: \(planificador.plano.numMovimientos)"
        //coaliciones.text = "Coaliciones: \(planificador.plano.numCoaliciones)"
        actualizarCoaliciones()
        collection.reloadData()
    }
    
    @IBOutlet weak var movimientos: UILabel!
    @IBOutlet weak var coaliciones: UILabel!
    
    private func actualizarCoaliciones() {
            var textoCoaliciones = "Coaliciones totales: \(planificador.totalCoaliciones)\n"
            for (turno, coaliciones) in planificador.coalicionesPorTurno.sorted(by: { $0.key < $1.key }) {
                textoCoaliciones += "Turno \(turno): \(coaliciones)\n"
            }
            coaliciones.text = textoCoaliciones
        }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size.width / CGFloat(planificador.plano.columnas)
        return CGSize(width: size, height: size)
    }
}
