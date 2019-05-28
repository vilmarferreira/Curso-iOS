//
//  FotoViewController.swift
//  SnapChat
//
//  Created by Vilmar Ferreira Gomes on 21/05/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit
import FirebaseStorage
class FotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var descricao: UITextField!
    @IBOutlet weak var btnProximo: UIButton!
    @IBAction func proximoPasso(_ sender: Any) {
        self.btnProximo.isEnabled = false
        self.btnProximo.setTitle("Carregando...", for: .normal)
        
        let armazenamento = Storage.storage().reference()
        let imagens = armazenamento.child("imagens")
        
        //recuperar imagens
        if let imagemSelecionada = imagem.image {
            
            
            if let imagemDados = imagemSelecionada.jpegData(compressionQuality: 0.5){
                imagens.child("\(self.idImagem).jpg").putData(imagemDados, metadata: nil, completion: { (metaDados, error) in
                    if error != nil{
                        let url = metaDados?.dictionaryRepresentation()["mediaLink"] as! String
                        self.performSegue(withIdentifier: "selecionarUsuarioSegue", sender: url)
                        self.btnProximo.isEnabled = true
                        self.btnProximo.setTitle("Próximo...", for: .normal)
                    }else{
                        let alerta = Alerta(titulo: "Upload Falhou", mensagem: "Erro ao salvar o arquivo, tente novamente !!")
                        self.present(alerta.getAlerta(), animated: true, completion: nil)
                    }
                }
                
            )}
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selecionarUsuarioSegue"{
            let usuarioViewController = segue.destination as! UsersTableViewController
            usuarioViewController.descricao = self.descricao.text!
            usuarioViewController.urlImagem = sender as! String
            usuarioViewController.idImagem = self.idImagem
            
            
        }
    }
    
    
    var imagePicker = UIImagePickerController()
    var idImagem = NSUUID().uuidString
    @IBAction func selecionarFoto(_ sender: Any) {
        imagePicker.sourceType = .savedPhotosAlbum
        present(imagePicker, animated: true, completion:nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imagemRecuperada = info[ UIImagePickerController.InfoKey.originalImage ] as! UIImage
        imagem.image = imagemRecuperada
        
        self.btnProximo.isEnabled = true
        self.btnProximo.backgroundColor = UIColor(red: 0.553, green: 0.369, blue: 0.749, alpha: 1)
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        btnProximo.isEnabled = false
        btnProximo.backgroundColor = UIColor.gray
        
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
