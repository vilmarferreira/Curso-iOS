//
//  ViewController.swift
//  star-wars-info
//
//  Created by Vilmar Ferreira Gomes on 27/02/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var dados : [String] = ["Darth Vader","Obi-Wan","Darth Sidious","Luke Skywalker","Yoda","Leia Skywalker","Chewbacca","C-3PO","R2D2"]
    var info: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        info.append("Darth Vader, nascido como Anakin Skywalker, é o protagonista da trilogia prequela e antagonista da trilogia original da série de filmes Star Wars, tendo participado de seis episódios e também participou do spin-off Rogue One.")
        info.append("Obi-Wan Kenobi é um personagem da série Star Wars, tendo participado dos seis primeiros filmes. Na trilogia original, foi interpretado por Sir Alec Guiness e nos outro três por Ewan McGregor, que interpretou a versão jovem do personagem.")
        info.append("Darth Sidious, nascido Sheev Palpatine, é, juntamente com Darth Vader, o principal vilão da saga Star Wars. É interpretado pelo ator Ian McDiarmid. Assim como Yoda, Palpatine tem muitos detalhes de seu passado não revelados")
        info.append("4 - ....")
        info.append("5 - ....")
        info.append("6 - ....")
        info.append("7 - ....")
        info.append("8 - ....")
        info.append("9 - ....")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dados.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celulaBase = "celulaBase"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaBase, for: indexPath)
        celula.textLabel?.text = dados[indexPath.row]
        return celula
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alerta = UIAlertController(title: "Informações", message: info[indexPath.row], preferredStyle: .alert)
        let ok = UIAlertAction(title: "Confirmar", style: .default, handler: nil)
        
        alerta.addAction(ok)
        
        present(alerta, animated: true, completion: nil)
        
    }


}

