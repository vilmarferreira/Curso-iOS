//
//  ViewController.swift
//  SnapChat
//
//  Created by Vilmar Ferreira Gomes on 10/05/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit
import FirebaseAuth
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let autenticacao = Auth.auth()
        
        autenticacao.addStateDidChangeListener { (autenticacao, user) in
            if let usuarioLogado = user{
                self.performSegue(withIdentifier: "loginAutomaticoSegue", sender: nil)
            }
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    


}

