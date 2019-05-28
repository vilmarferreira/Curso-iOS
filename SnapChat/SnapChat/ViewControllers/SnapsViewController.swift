//
//  SnapsViewController.swift
//  SnapChat
//
//  Created by Vilmar Ferreira Gomes on 21/05/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
class SnapsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var snaps:[Snap] = []
    
    @IBOutlet weak var dataTable: UITableView!
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
        let autenticacao = Auth.auth()
        
        
        
        if let idUsuarioLogado = autenticacao.currentUser?.uid{
            let database = Database.database().reference()
            let usuarios = database.child("usuarios")
            let snaps = usuarios.child(idUsuarioLogado).child("snaps")
            
            //Criar ouvintes para snaps
            snaps.observe(DataEventType.childAdded) { (DataSnapshot) in
                let dados = DataSnapshot.value as? NSDictionary
                let snap = Snap(identificador: DataSnapshot.key, nome: dados?["nome"] as! String, de: dados?["de"] as! String, descricao:dados?["descricao"] as! String,
                                urlImagem: dados?["urlImagem"] as! String, idImagem: dados?["idImagem"] as! String )
                
                self.snaps.append(snap)
                self.dataTable.reloadData()
                
            }
            snaps.observe(DataEventType.childRemoved) { (DataSnapshot) in
                var indice = 0
                for snap in self.snaps {
                    if snap.identificador == DataSnapshot.key{
                        self.snaps.remove(at: indice)
                    }
                    indice = indice + 1
                }
            }
            self.dataTable.reloadData()
            
        }
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let totalSnaps = snaps.count
        if totalSnaps == 0 {
            return 1
        }
        return snaps.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        let totalSnaps = snaps.count
        if totalSnaps == 0 {
            cell.textLabel?.text = "Nenhum snap para você :)"
        }
        else {
            let snap = self.snaps[indexPath.row]
            cell.textLabel?.text = snap.nome
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let totalSnaps = snaps.count
        if totalSnaps >= 0 {
            performSegue(withIdentifier: "detalhesSnapSegue", sender: self.snaps[indexPath.row])
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detalhesSnapSegue"{
            let detalhesSnapViewController = segue.destination as! DetalhesSnapsViewController
            detalhesSnapViewController.snap = sender as! Snap
        }
    }
    

}
