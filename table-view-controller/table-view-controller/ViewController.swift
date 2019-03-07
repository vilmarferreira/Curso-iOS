//
//  ViewController.swift
//  table-view-controller
//
//  Created by Vilmar Ferreira Gomes on 27/02/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var dados: [String] = ["Lasanha","Pizza","Torta","Bolo"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
        celula.textLabel?.text = dados[indexPath.row]
        return celula
    }

}

