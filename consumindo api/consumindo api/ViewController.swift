//
//  ViewController.swift
//  consumindo api
//
//  Created by Vilmar Ferreira Gomes on 10/04/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: "https://blockchain.info/ticker"){
            let tarefa = URLSession.shared.dataTask(with: url){(dados, requisicao, erro)
                in
                if erro == nil{
                    if let dadoRetorno = dados {
                        
                        do {
                            let objetoJson = try  JSONSerialization.jsonObject(with: dadoRetorno, options: []) as? [String: Any]
                            
                            if let brl = objetoJson?["BRL"] as? [String: Any]{
                                print(brl)
                                if let preco = brl["buy"] as? Float{
                                    print(preco)
                                }
                            }
                            
                        } catch  {
                        }
                        
                        
                        
                    }
                    
                }else{
                    print("Erro")
                }
            }
            tarefa.resume()
        }
    }


}

