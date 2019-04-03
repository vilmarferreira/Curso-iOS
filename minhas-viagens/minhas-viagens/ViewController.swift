//
//  ViewController.swift
//  minhas-viagens
//
//  Created by Vilmar Ferreira Gomes on 25/03/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var dados: [Dictionary<String,String>] = armazenamentoDados().listarViagem()
    var controleNavecao = "adicionar"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //atualizar a tabela e recarregar
    func atualizarListaViagens(){
        self.dados = armazenamentoDados().listarViagem()
        tableView.reloadData()
    }
    //metodo chamado toda vez que a tabela é exibida
    override func viewDidAppear(_ animated: Bool) {
        controleNavecao = "adicionar"
        atualizarListaViagens()
    }
    //metodo para adicionar o botao de remover
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        armazenamentoDados().removerViagem(indice: indexPath.row)
        atualizarListaViagens()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dados.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celulaModelo = "celulaModelo"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaModelo, for: indexPath)
        celula.textLabel?.text = dados[indexPath.row]["local"]
        return celula
    }
    
    //startar uma segue
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.controleNavecao = "listar"
        performSegue(withIdentifier: "verLocal", sender: indexPath.row)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verLocal"{
            let viewControllerDestino = segue.destination as! ViewControllerMapa
            if self.controleNavecao == "listar"{
                if let indiceRecuperado = sender{
                    let indice = indiceRecuperado as! Int
                    viewControllerDestino.viagem = dados[indice]
                    viewControllerDestino.indiceSelecionado = indice
                    
                }
            }else{
                viewControllerDestino.viagem = [:]
                viewControllerDestino.indiceSelecionado = -1
            }
            
        }
    }


}

