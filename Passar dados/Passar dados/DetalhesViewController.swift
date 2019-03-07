//
//  DetalhesViewController.swift
//  Passar dados
//
//  Created by Vilmar Ferreira Gomes on 20/02/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController {
    @IBOutlet weak var resultadoLabel: UILabel!
    
    var textoRecebido: String = "0"
   
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        resultadoLabel.text = textoRecebido
        // Do any additional setup after loading the view.
    }
    

}
