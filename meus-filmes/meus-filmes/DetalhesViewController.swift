//
//  DetalhesViewController.swift
//  meus-filmes
//
//  Created by Vilmar Ferreira Gomes on 07/03/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import Foundation
import UIKit

class DetalhesViewController:UIViewController{
    
    var filme:Filme!
    @IBOutlet weak var imgFilme: UIImageView!
    @IBOutlet weak var tituloFilme: UILabel!
    @IBOutlet weak var descricaoFilme: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgFilme.image = self.filme.imagem
        self.tituloFilme.text = self.filme.titulo
        self.descricaoFilme.text = self.filme.descricao
    }
}
