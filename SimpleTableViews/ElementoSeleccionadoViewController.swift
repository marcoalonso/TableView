//
//  ElementoSeleccionadoViewController.swift
//  SimpleTableViews
//
//  Created by marco rodriguez on 24/01/22.
//

import UIKit

class ElementoSeleccionadoViewController: UIViewController {
    var recibirElemento: String = ""
    
    @IBOutlet weak var tituloLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tituloLabel.text = recibirElemento
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
