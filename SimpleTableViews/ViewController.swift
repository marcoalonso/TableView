//
//  ViewController.swift
//  SimpleTableViews
//
//  Created by marco rodriguez on 24/01/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let secciones = ["Carros", "Animales", "Frutas", "Paises"]
    let renglones: [[String]] = [
        ["Seat", "Mazda","VW","Audi"],
        ["Leon", "Jirafa", "Tigre", "Oso"],
        ["Piña","Melon","Mango", "Pepino"],
        ["Mexico","Brasil", "India", "USA", "Francia"]
    ]
    let imagenes = [
        #imageLiteral(resourceName: "3"), #imageLiteral(resourceName: "cupraLeon"),  #imageLiteral(resourceName: "cupra"), #imageLiteral(resourceName: "4"), #imageLiteral(resourceName: "cupra"), #imageLiteral(resourceName: "emoji"), #imageLiteral(resourceName: "cupra"), #imageLiteral(resourceName: "cupra"), #imageLiteral(resourceName: "camino"), #imageLiteral(resourceName: "2")
    ]
    
    var elementoEnviar: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: - TableView Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        secciones.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        renglones[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "MiCelda") as! MiCelda
        let titulo = renglones[indexPath.section][indexPath.row]
        celda.celdaLabel.text = titulo
        celda.celdaImageView.image = imagenes[indexPath.row]
        return celda
    }
    
    //Titulos
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return secciones[section]
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("Seleccionaste: \(renglones[indexPath.section][indexPath.row])")
        
        //Guardamos el elemento seleccionado
        elementoEnviar = renglones[indexPath.section][indexPath.row]
        
        //CReamos el nuevo viewController
        let controlador = storyboard?.instantiateViewController(withIdentifier: "Seleccionado") as! ElementoSeleccionadoViewController
        
        controlador.recibirElemento = elementoEnviar ?? "No selecciono nada"
        controlador.modalTransitionStyle = .coverVertical
        //controlador.modalPresentationStyle = .fullScreen
        
        //Presentamos el nuevo controlador
        self.present(controlador, animated: true)

        //performSegue(withIdentifier: "enviar", sender: self)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "enviar" {
//            let destino = segue.destination as! ElementoSeleccionadoViewController
//            destino.recibirElemento = elementoEnviar!
//        }
//    }
    
    
}

class MiCelda: UITableViewCell {
    
    @IBOutlet weak var celdaImageView: UIImageView!
    @IBOutlet weak var celdaLabel: UILabel!
}
