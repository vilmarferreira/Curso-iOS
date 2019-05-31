//
//  ViewController.swift
//  WhatsappClone
//
//  Created by Vilmar Ferreira Gomes on 28/05/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
class ViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBAction func logar(_ sender: Any) {
        let emailUser = email.text
        let senhaUser = senha.text
        Auth.auth().signIn(withEmail: emailUser!, password: senhaUser!) { (user, Error) in
            if Error == nil {
                //redirecionar
                print("OK")
                self.performSegue(withIdentifier: "loginAutomaticoSegue", sender: nil)
            }else {
                let alerta = Alerta(titulo: "Dados Incorreto", mensagem: "Verifique os dados digitado e tente novamente")
                self.present(alerta.getAlerta(), animated: true, completion: nil)
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let autenticacao = Auth.auth()
        
        autenticacao.addStateDidChangeListener { (autenticacao, user) in
            if let usuarioLogado = user{
                self.performSegue(withIdentifier: "loginAutomaticoSegue", sender: nil)
            }
        }
    }


}

