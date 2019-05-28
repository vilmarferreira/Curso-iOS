//
//  DetalhesSnapsViewController.swift
//  SnapChat
//
//  Created by Vilmar Ferreira Gomes on 27/05/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit
import SDWebImage
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase
class DetalhesSnapsViewController: UIViewController {
    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var detalhes: UILabel!
    @IBOutlet weak var contador: UILabel!
    
    var snap = Snap()
    var tempo = 11
    override func viewDidLoad() {
        super.viewDidLoad()

        detalhes.text = snap.descricao
        let url = URL(string: snap.urlImagem)
        imagem.sd_setImage(with: url) { (imagem, erro, cache, url) in
            //Iniciar o timer
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
                self.tempo = self.tempo - 1
                self.contador.text = String(self.tempo)
                
                if self.tempo == 0 {
                    timer.invalidate()
                    self.dismiss(animated: true, completion:nil)
                }
            })
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        let autenticacao = Auth.auth()
        
        if let idUsuarioLogado = autenticacao.currentUser?.uid{
            //remover no do database
            let database = Database.database().reference()
            let usuarios = database.child("usuarios")
            let snaps = usuarios.child(idUsuarioLogado).child("snaps")
            snaps.child(snap.identificador).removeValue()
            
            //storage
            let storage = Storage.storage().reference()
            let imagens = storage.child("imagens")
            imagens.child("\(snap.idImagem).jpg").delete { (error) in
                if error == nil {
                    print("Sucesso")
                }else {
                    print("erro")
                }
            }
            
        }
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
