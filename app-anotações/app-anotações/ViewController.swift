//
//  ViewController.swift
//  app-anotações
//
//  Created by Vilmar Ferreira Gomes on 07/03/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtAnotacao: UITextView!
    
    @IBAction func btnSalvar(_ sender: Any) {
        let text:String = txtAnotacao.text
        UserDefaults.standard.set(text, forKey: "anotacao")
        print(text)
    }
    func recuperaTexto() -> String {
        if let texto = UserDefaults.standard.object(forKey: "anotacao"){
            return texto as! String
        }
        return ""
    }
    //esconder barra de status
    override var prefersStatusBarHidden: Bool{
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true) // para esconder o teclado ao sair da caixa de texto
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let text:String = recuperaTexto()
        txtAnotacao.text = text
        // Do any additional setup after loading the view, typically from a nib.
    }


}

