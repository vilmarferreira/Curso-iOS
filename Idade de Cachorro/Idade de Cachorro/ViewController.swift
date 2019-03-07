//
//  ViewController.swift
//  Idade de Cachorro
//
//  Created by Vilmar Ferreira Gomes on 02/02/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelResultado: UILabel!
    @IBOutlet weak var txtIdade: UITextField!
    
    @IBAction func btnIdade(_ sender: Any) {
//        print("Botão precionado")
        
        let idade = Int(txtIdade.text!)! * 7
        labelResultado.text = "A idade do cachorro é :"+String(idade);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

