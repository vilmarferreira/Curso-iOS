//
//  ViewController.swift
//  firebaseConfiguracao
//
//  Created by Vilmar Ferreira Gomes on 30/04/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    let firebase = Database.database().reference()
    override func viewDidLoad() {
        super.viewDidLoad()
        //LOGOUT
        /*
        do {
            try Auth.auth().signOut() // linha para deslogar
        } catch  {
            print("Errooo")
        }
        */
        //Logar usuario
        Auth.auth().signIn(withEmail: "vilmar2@gmail.com", password: "admin123") { (user, Error) in
            if Error == nil {
                print(" Sucesso")
            }else {
                print("Erro ao cadastrar usuario:  \(Error?.localizedDescription) ")
            }
        }
        
        
        // CADASTRAR USUARIO
        /*
        Auth.auth().createUser(withEmail: "vilmar2@gmail.com", password: "admin123") { (user, Error) in
            if Error == nil {
                print(" Sucesso")
            }else {
                print("Erro ao cadastrar usuario:  \(Error?.localizedDescription) ")
            }
        
        
        //VERIFICAR SE USUÁRIO ESTÁ LOGADO
        
        Auth.auth().addStateDidChangeListener { (Auth, User) in
            if let usuarioLogado = User{
                print("Logado :" + String(describing: usuarioLogado.email))
            }else{
                print("Não logado!")
            }
        }*/
        
        
        //SETAR VALOR NO FIREBASE
        // Do any additional setup after loading the view.
//        let pontuacao = firebase.child("pontuacao")
//        pontuacao.child("002").child("nome").setValue("Teste2")
        
        //recuperar dados do Firebase
//        pontuacao.observe(.value, with: {(dados) in
//            print(dados.value)
//        })
        
    }


}

