//
//  Filme.swift
//  meus-filmes
//
//  Created by Vilmar Ferreira Gomes on 01/03/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit

class Filme{
    var titulo: String!
    var descricao: String!
    var imagem: UIImage!
    
    init(titulo:String,descricao:String, imagem:UIImage) {
        self.titulo = titulo
        self.descricao = descricao
        self.imagem = imagem
    }
}
