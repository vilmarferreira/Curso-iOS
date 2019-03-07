//
//  ViewController.swift
//  App Frase do Dia
//
//  Created by Vilmar Ferreira Gomes on 03/02/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelFrase: UILabel!
    @IBAction func btnNovaFrase(_ sender: Any) {
        var frases: [String] = []
        frases.append("Olá Mundo")
        frases.append("Tudo bem ?")
        frases.append("Como você está ?")
        frases.append("Não Desista do seu futuro!!!")
        frases.append("Hoje o dia pode ser radiante, só depente de você")
        frases.append("Faça hoje o seu melhor")
        
//        let frase = frases.randomElement()
        labelFrase.text = frases.randomElement()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

