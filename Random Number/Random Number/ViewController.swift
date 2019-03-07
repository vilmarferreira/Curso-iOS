//
//  ViewController.swift
//  Random Number
//
//  Created by Vilmar Ferreira Gomes on 03/02/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelResultado: UILabel!
    @IBAction func btnGerarNumero(_ sender: Any) {
        let number = Int.random(in: 0 ... 100)
        labelResultado.text = String(number)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

