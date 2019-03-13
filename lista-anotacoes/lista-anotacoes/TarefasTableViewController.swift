//
//  TarefasTableViewController.swift
//  lista-anotacoes
//
//  Created by Vilmar Ferreira Gomes on 07/03/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit

class TarefasTableViewController: UITableViewController {
    var tarefas: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete
        {
            let tarefa = TarefasUserDefaults()
            tarefa.remover(indice: indexPath.row)
            atualizarListaTarefas()
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        atualizarListaTarefas()
    }
    func atualizarListaTarefas(){
        let tarefa = TarefasUserDefaults()
        tarefas = tarefa.listar()
        tableView.reloadData()
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return tarefas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listView", for: indexPath)
        cell.textLabel?.text = tarefas[indexPath.row]
        // Configure the cell...

        return cell
    }
    

    

}
