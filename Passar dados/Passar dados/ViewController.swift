//
//  ViewController.swift
//  Passar dados
//
//  Created by Vilmar Ferreira Gomes on 20/02/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtCampo: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enviarDados"
        {
            let viewDestino = segue.destination as! DetalhesViewController
            viewDestino.textoRecebido = txtCampo.text!
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

