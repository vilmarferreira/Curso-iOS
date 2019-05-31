//
//  AjustesViewController.swift
//  WhatsappClone
//
//  Created by Vilmar Ferreira Gomes on 30/05/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class AjustesViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var nome: UILabel!
    @IBOutlet weak var email: UILabel!
    var idImagem = NSUUID().uuidString
    
    var imagePicker = UIImagePickerController()
    
    @IBAction func sair(_ sender: Any) {
        let autenticacao = Auth.auth()
        do {
            try autenticacao.signOut()
            dismiss(animated: true, completion: nil)
        } catch  {
            print("Erroo")
        }
    }
    
    @IBAction func alterarImagem(_ sender: Any) {
        imagePicker.sourceType = .savedPhotosAlbum
        present(imagePicker, animated: true, completion:nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imagemRecuperada = info[ UIImagePickerController.InfoKey.originalImage ] as! UIImage
        imagem.image = imagemRecuperada
        
        //database
        let database = Database.database().reference()
        let usuarios = database.child("usuarios")
        //informações de usuarios
        let autenticacao = Auth.auth()
        let idUsuarioLogado = autenticacao.currentUser?.uid
        //storage
        let armazenamento = Storage.storage().reference()
        let imagens = armazenamento.child("imagens")
        
        if let imagemDados = imagemRecuperada.jpegData(compressionQuality: 0.5){
            imagens.child("\(self.idImagem).jpg").putData(imagemDados, metadata: nil, completion: { (metaDados, error) in
                if error != nil{
                    print(metaDados)
                    let url = metaDados?.dictionaryRepresentation()["mediaLink"] as! String
                    let usuarioLogado = usuarios.child(idUsuarioLogado!)
                    usuarioLogado.child("imagem").setValue(url)
                }else{
                    let alerta = Alerta(titulo: "Upload Falhou", mensagem: "Erro ao salvar o arquivo, tente novamente !!")
                    self.present(alerta.getAlerta(), animated: true, completion: nil)
                }
            }
                
            )
        }
        
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self

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
