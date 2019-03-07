//
//  ResultadoViewController.swift
//  cara-coroa
//
//  Created by Vilmar Ferreira Gomes on 25/02/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit

class ResultadoViewController: UIViewController {
    @IBOutlet weak var imgResultado: UIImageView!
    
    var numeroRandomico: Int! = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        if numeroRandomico == 0
        {
            imgResultado.image = #imageLiteral(resourceName: "moeda_coroa")
 
        } else
        {
            imgResultado.image = #imageLiteral(resourceName: "moeda_cara")
        }
        print(numeroRandomico)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
