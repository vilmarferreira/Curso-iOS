//
//  EntrarViewController.swift
//  SnapChat
//
//  Created by Vilmar Ferreira Gomes on 10/05/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit
import Firebase
class EntrarViewController: UIViewController {
    let firebase = Database.database().reference()
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    
    @IBAction func logar(_ sender: Any) {
        let email = txtEmail.text
        let senha = txtSenha.text
        //Logar usuario
        Auth.auth().signIn(withEmail: email!, password: senha!) { (user, Error) in
            if Error == nil {
                //redirecionar
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }else {
                let alerta = Alerta(titulo: "Dados Incorreto", mensagem: "Verifique os dados digitado e tente novamente")
                self.present(alerta.getAlerta(), animated: true, completion: nil)
                
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
