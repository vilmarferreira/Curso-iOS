//
//  CadastroViewController.swift
//  WhatsappClone
//
//  Created by Vilmar Ferreira Gomes on 30/05/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class CadastroViewController: UIViewController {

    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha: UITextField!
    @IBAction func cadastrar(_ sender: Any) {
        if let emailUser = email.text{
            if let senhaUser = senha.text{
                if let nomeCompleto = nome.text{
                    Auth.auth().createUser(withEmail: emailUser, password: senhaUser) { (user, error) in
                        if error == nil{
                            let database = Database.database().reference()
                            let usuarios = database.child("usuarios")
                            let usuarioDados = ["nome": nomeCompleto, "email": emailUser]
                            usuarios.child(user!.user.uid).setValue(usuarioDados)
                            self.performSegue(withIdentifier: "cadastroLoginSegue", sender: nil)
                        }else{
                            let erroR = error! as NSError
                            if let codigoErro = erroR.userInfo["error_name"]{
                                let erroTexto = codigoErro as! String
                                var mensagemErro = ""
                                switch erroTexto {
                                case "ERROR_INVALID_EMAIL":
                                    mensagemErro = "E-mail inválido, digite um e-mail válido!"
                                    break
                                case "ERROR_WEAK_PASSWORD":
                                    mensagemErro = "Senha precisa ter no mínimo 6 caracteres, com letras e números."
                                    break
                                case "ERROR_EMAIL_ALREADY_IN_USE":
                                    mensagemErro = "E-mail já cadastrado"
                                    break
                                default:
                                    mensagemErro = "Dados incorretos"
                                }
                                let alerta = Alerta(titulo: "Dados inválidos", mensagem: mensagemErro)
                                self.present(alerta.getAlerta(), animated: true, completion: nil)
                                
                            }
                        }
                    }
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
