
import UIKit
class MiCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imagen: UIImageView!
    
    func style(){
        layer.borderColor = UIColor.blue.withAlphaComponent(0.5).cgColor
        layer.borderWidth = 1.0
    }
    
    
    //Configura la dirección de la imagen según la dirección del avión.
    func direccion(avion: Avion){
        switch avion.direccion {
        case .north:
            north()
        case .south:
            south()
        case .east:
            east()
        case .west:
            west()
        }
    }
    
    //Asigna la imagen correspondiente a cada una de las direcciones.
    private func north() {
        imagen.image = UIImage(named: "north")
    }
    
    private func south() {
        imagen.image = UIImage(named: "south")
    }
    
    private func east(){
        imagen.image = UIImage(named: "east")
    }
    
    private func west(){
        imagen.image = UIImage(named: "west")
    }
    
    //Elimina cualquier imagen de la celda.
    func none(){
        imagen.image = nil
    }
    
    func colision() {
        imagen.image =  UIImage(named: "colision")
    }
}
