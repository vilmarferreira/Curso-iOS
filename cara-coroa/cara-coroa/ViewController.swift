//
//  ViewController.swift
//  cara-coroa
//
//  Created by Vilmar Ferreira Gomes on 25/02/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueJogar"
        {
            let viewDestino = segue.destination as! ResultadoViewController
            viewDestino.numeroRandomico = Int.random(in: 0 ... 2)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

