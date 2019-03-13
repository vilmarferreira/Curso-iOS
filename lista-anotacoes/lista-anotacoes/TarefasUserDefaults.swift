//
//  TarefasUserDefaults.swift
//  lista-anotacoes
//
//  Created by Vilmar Ferreira Gomes on 07/03/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit
class TarefasUserDefaults{
    let chave = "chave"
    var lista: [String] = []
    func salvar(tarefa:String){
        //pegar dados ja salvos
        lista = listar()
        lista.append( tarefa )
        print(lista)
        print(tarefa)
        UserDefaults.standard.set(lista,forKey:chave)
    }
    func listar() -> Array<String>{
        let dados = UserDefaults.standard.object(forKey: chave)
        if dados != nil {
            return dados as! Array<String>
        }
        else{
            return []
        }
        
    }
    func remover (indice: Int){
        lista = listar()
        lista.remove(at: indice)
        UserDefaults.standard.set(lista, forKey: chave)
        
    }
}
