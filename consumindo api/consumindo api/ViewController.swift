//
//  ViewController.swift
//  consumindo api
//
//  Created by Vilmar Ferreira Gomes on 10/04/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelPreco: UILabel!
    
    @IBOutlet weak var btnAtualizar: UIButton!
    @IBAction func atualizarPreco(_ sender: Any) {
        self.recuperarPrecoBitCoin()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.recuperarPrecoBitCoin()
        
    }
    func formatarPreco(preco: NSNumber) -> String{
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.locale = Locale(identifier: "pt_BR")
        if let precoFinal = nf.string(from: preco){
            return precoFinal
        }else{
            return "0,00"
        }
        
    }
    func recuperarPrecoBitCoin(){
        self.btnAtualizar.setTitle("Atualizando...", for: .normal)
        if let url = URL(string: "https://blockchain.info/ticker"){
            let tarefa = URLSession.shared.dataTask(with: url){(dados, requisicao, erro)
                in
                if erro == nil{
                    if let dadoRetorno = dados {
                        
                        do {
                            if let objetoJson = try  JSONSerialization.jsonObject(with: dadoRetorno, options: []) as? [String: Any]{
                                
                                if let brl = objetoJson["BRL"] as? [String: Any]{
                                    
                                    if let preco = brl["buy"] as? Double{
                                        let precoFormatado = self.formatarPreco(preco: NSNumber(value:preco))
                                        
                                        DispatchQueue.main.async(execute: {
                                            self.labelPreco.text = "R$ "+precoFormatado
                                            self.btnAtualizar.setTitle("Atualizar", for: .normal)
                                        })
                                        
                                    }
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

