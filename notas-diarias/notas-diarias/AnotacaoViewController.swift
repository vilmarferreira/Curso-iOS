//
//  AnotacaoViewController.swift
//  notas-diarias
//
//  Created by Vilmar Ferreira Gomes on 09/04/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit
import CoreData
class AnotacaoViewController: UIViewController {
    @IBOutlet weak var txtAnotacao: UITextView!
    var context: NSManagedObjectContext!
    
    @IBAction func salvar(_ sender: Any) {
        self.salvarAnotacao()
        
        //voltar para a tela principal
        self.navigationController?.popToRootViewController(animated: true)
    }
    func salvarAnotacao(){
        let novaAnotacao = NSEntityDescription.insertNewObject(forEntityName: "Anotacao", into: context)
        //configurar anotacao
        novaAnotacao.setValue(self.txtAnotacao.text, forKey:"texto")
        novaAnotacao.setValue(Date(), forKey:"data")
        
        do {
            try context.save()
            print("Sucesso ao salvar anotação")
            
        } catch let erro as Error{
            print(erro.localizedDescription)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtAnotacao.text = ""
        
        //abrir o teclado automaticamente
        self.txtAnotacao.becomeFirstResponder()
        
        //configurando context
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
    }
    

    
}
