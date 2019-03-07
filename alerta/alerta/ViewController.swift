//
//  ViewController.swift
//  alerta
//
//  Created by Vilmar Ferreira Gomes on 27/02/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBAction func btnAbrirAlerta(_ sender: Any) {
        let alerta = UIAlertController(title: "Adicionar", message: "Deseja salver esse novo item?", preferredStyle: .alert)
        let confirmar = UIAlertAction(title: "Confirmar", style: .default, handler: nil)
        let cancelar = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil)
        alerta.addAction(confirmar)
        alerta.addAction(cancelar)
        present(alerta, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

