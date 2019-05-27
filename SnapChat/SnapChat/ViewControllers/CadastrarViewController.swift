//
//  CadastrarViewController.swift
//  SnapChat
//
//  Created by Vilmar Ferreira Gomes on 10/05/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class CadastrarViewController: UIViewController {
    let firebase = Database.database().reference()
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    @IBOutlet weak var txtSenha2: UITextField!
    @IBOutlet weak var nomeCompleto: UITextField!
    
    @IBAction func cadastrar(_ sender: Any) {
        
        
        if let email = txtEmail.text{
            if let nomeCompleto = nomeCompleto.text{
                if let senha = txtSenha.text{
                    if let senhaConfirm = txtSenha2.text {
                        if senha == senhaConfirm{
                            Auth.auth().createUser(withEmail: email, password: senha) { (user, Error) in
                                if Error == nil {
                                    
                                    let database = Database.database().reference()
                                    let usuarios = database.child("usuarios")
                                    let usuarioDados = ["nome": nomeCompleto, "email": email]
                                    usuarios.child(user!.user.uid).setValue(usuarioDados)
                                    
                                    self.performSegue(withIdentifier: "cadastroLoginSegue", sender: nil)
                                }else {
                                   let erroR = Error! as NSError
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
                        }else{
                            let alerta = Alerta(titulo: "Senhas diferentes", mensagem: "Favor digitar as senhas iguais")
                            self.present(alerta.getAlerta(), animated: true, completion: nil)
                            
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
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }


}
