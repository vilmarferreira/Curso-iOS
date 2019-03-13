//
//  AdicionarAnotacaoController.swift
//  lista-anotacoes
//
//  Created by Vilmar Ferreira Gomes on 07/03/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import Foundation
import UIKit

class AdicionarTarefaController: UIViewController {
    
    @IBOutlet weak var txtTarefa: UITextField!
    @IBAction func btnAdd(_ sender: Any) {
        print("OKKK")
    }
    @IBAction func btnSalvar(_ sender: Any) {
        print("btn")
        if let texto = txtTarefa.text {
            let tarefa = TarefasUserDefaults()
            tarefa.salvar(tarefa: texto)
            txtTarefa.text = ""
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}
