//
//  Snap.swift
//  SnapChat
//
//  Created by Vilmar Ferreira Gomes on 27/05/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import Foundation
class Snap{
    var identificador = ""
    var nome = ""
    var de = ""
    var descricao = ""
    var urlImagem = ""
    var idImagem = ""
    
    init(identificador: String = "", nome: String = "", de:String = "", descricao: String = "", urlImagem:String = "",idImagem:String = "") {
        self.identificador = identificador
        self.nome = nome
        self.de = de
        self.descricao = descricao
        self.urlImagem = urlImagem
        self.idImagem = idImagem
    }
}
