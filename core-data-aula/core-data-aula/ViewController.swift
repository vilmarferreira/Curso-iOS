//
//  ViewController.swift
//  core-data-aula
//
//  Created by Vilmar Ferreira Gomes on 04/04/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //utilizando core data
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context=appDelegate.persistentContainer.viewContext
        
        //Criar uma requisicao
        let requisicao = NSFetchRequest<NSFetchRequestResult>(entityName: "Usuario")
        //Ordenar de A-Z ou Z-A
        let ordenacaoAZ = NSSortDescriptor(key: "nome", ascending: true)
        //aplicar ordenacao a requisicao
        requisicao.sortDescriptors = [ordenacaoAZ]
        
        //Aplicar filtros
        //primeiro parametro : nome do atributo e opcao de busca, segundo parametro : valor pra buscar
        //let filtroNome = NSPredicate(format: "nome contains [c] %@", "jose")
        //let filtroIdade = NSPredicate(format: "idade > %@", "20")
        //combinar filtros
        //let combinacaoFiltro = NSCompoundPredicate(andPredicateWithSubpredicates: [filtroNome,filtroIdade])
//        let filtroNome = NSPredicate(format: "nome contains [c] %@", "Ana maria")
//        requisicao.predicate = filtroNome
        do {
            let usuarios = try context.fetch(requisicao)
            if usuarios.count > 0 {
                for usuario in usuarios as! [NSManagedObject]{
                    if let nome = usuario.value(forKey: "nome"){
                        print(nome)
                        //atualizar
//                        usuario.setValue("Ana Emilia", forKey: "nome")
//                        do {
//                            try context.save()
//                                    print("dados salvos")
//                                }catch{
//                                    print("erro")
//                                }
                        //remover
                        context.delete(usuario)
                        do {
                            try context.save()
                                    print("dados excluidos")
                                }catch{
                                    print("erro")
                                }
                        
                    }
                    let login = usuario.value(forKey: "login")
                    
                }

            }else {
                print("Nenhum usuario encontrado!")
            }
        }catch{
                print("Erro ao recuperar usuarios")
            }
        
        
        
        
        //criando entidade
        let usuario = NSEntityDescription.insertNewObject(forEntityName: "Usuario", into: context)
        
        //configurar objeto
        usuario.setValue("Jose", forKey: "nome")
        usuario.setValue(23, forKey: "idade")
        usuario.setValue("vilmar.ferreira", forKey: "login")
        usuario.setValue("1234", forKey: "senha")
        
        //salvar objeto
        
//        do {
//            try context.save()
//            print("dados salvos")
//        }catch{
//            print("erro")
//        }
 
        
    }


}

