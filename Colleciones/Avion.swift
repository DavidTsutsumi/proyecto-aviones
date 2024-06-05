
import Foundation

//Se define una estructura con las coordenas (x,y) y la dirección de cada uno de los aviones en el plano.
struct Avion {
    
    var x: Int //Coordenada X del avión.
    var y: Int //Coordenada Y del avión.
    var direccion: Direccion //Dirección a la que apunta el avión.
    
    // Se inicializa un avión con valores de posición (0, 0) y su dirección hacia el este.
    init(x: Int = 0, y: Int = 0, direccion: Direccion = .east) {
        self.x = x
        self.y = y
        self.direccion = direccion
    }
}
