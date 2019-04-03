//
//  armazenamento-dados.swift
//  minhas-viagens
//
//  Created by Vilmar Ferreira Gomes on 29/03/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//


import UIKit

class armazenamentoDados{
    let chaveArmazenamento = "locaisViagens"
    var viagens : [Dictionary<String,String>] = []
    func getDefaults()->UserDefaults {
        return UserDefaults.standard
    }
    
    func salvarViagem(viagem : Dictionary<String,String>){
        viagens = listarViagem()
        viagens.append(viagem)
        getDefaults().set(viagens, forKey:chaveArmazenamento)
        getDefaults().synchronize()
    }
    func listarViagem() -> [Dictionary<String,String>]{
        let dados = getDefaults().object(forKey: chaveArmazenamento)
        if dados != nil{
            return dados as! Array
        }else{
            return []
        }
    }
    func removerViagem(indice: Int){
        viagens = listarViagem()
        viagens.remove(at: indice)
        getDefaults().set(viagens, forKey:chaveArmazenamento)
        getDefaults().synchronize()
        
    }
}

