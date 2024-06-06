
import UIKit
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collection: UICollectionView!
    
    let reuseIdentifier = "miCelda"
    
    // Seleccionar la planificacion de ruta de la aerolinea de su preferencia
    var planificador = Planificador(aviones: Aeromexico.aviones)
    var columnas: Int = 0
    var filas: Int = 0

    override func viewDidLoad() {
        
        columnas = planificador.plano.columnas
        filas = planificador.plano.filas
        movimientos.text = "Movimientos: \(planificador.numMovimientos)"
        coaliciones.text = "Colisiones: \(planificador.numColisiones)"
    }

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
        if let _ = planificador.plano.getColision(row: indexPath.row, section: indexPath.section) {
            cell.colision()
        }
        cell.style()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return columnas
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return filas
    }
    
    //Variable que contabiliza los movimientos
    
    @IBAction func tapBack(_ sender: Any) {
        
        
        planificador.back()
        movimientos.text = "Movimientos: \(planificador.numMovimientos)"
        coaliciones.text = "Colisiones: \(planificador.numColisiones)"
        collection.reloadData()
    }
    
    @IBAction func tapNext(_ sender: Any) {
        
        planificador.next()
        movimientos.text = "Movimientos: \(planificador.numMovimientos)"
        coaliciones.text = "Colisiones: \(planificador.numColisiones)"
        collection.reloadData()
        
    }
    
    @IBAction func tapReset(_ sender: Any) {
        planificador.reset()
        movimientos.text = "Movimientos: \(planificador.numMovimientos)"
        coaliciones.text = "Colisiones: \(planificador.numColisiones)"
        collection.reloadData()
    }
    
    @IBOutlet weak var movimientos: UILabel!
    @IBOutlet weak var coaliciones: UILabel!
    

}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.size.width / CGFloat(planificador.plano.columnas)
        return CGSize(width: size, height: size)
    }
}
