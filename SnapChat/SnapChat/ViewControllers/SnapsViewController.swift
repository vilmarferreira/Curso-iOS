//
//  SnapsViewController.swift
//  SnapChat
//
//  Created by Vilmar Ferreira Gomes on 21/05/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit
import FirebaseAuth
class SnapsViewController: UIViewController {
    
    @IBAction func sair(_ sender: Any) {
        let autenticacao = Auth.auth()
        do {
            try autenticacao.signOut()
            dismiss(animated: true, completion: nil)
        } catch  {
            print("Erroo")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    

}
