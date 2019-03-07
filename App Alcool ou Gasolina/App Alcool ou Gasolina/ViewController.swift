//
//  ViewController.swift
//  App Alcool ou Gasolina
//
//  Created by Vilmar Ferreira Gomes on 03/02/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtAlcool: UITextField!
    @IBOutlet weak var txtGasolina: UITextField!
    @IBOutlet weak var labelResultado: UILabel!
    @IBAction func btnCalcular(_ sender: Any) {
        
        if let valorAlcool = txtAlcool.text{
            if let valorGasolia = txtGasolina.text{
                let validado = self.validarCampo(valorAlcool: valorAlcool, valorGasolia: valorGasolia)
                if validado {
                    self.calcularMelhorPreco(valorAlcool: valorAlcool, valorGasolina: valorGasolia)
                } else {
                    labelResultado.text = "Digite os valores para calcular"
                }
            }
        }
    }
    func validarCampo(valorAlcool:String, valorGasolia: String) ->Bool{
        var camposValidados = true
        if valorAlcool.isEmpty{
            camposValidados = false
        } else if valorGasolia.isEmpty
        {
            camposValidados = false
        }
        return camposValidados
    }
    func calcularMelhorPreco(valorAlcool:String, valorGasolina: String){
        if let alcool = Double(valorAlcool){
            if let gasolina = Double(valorGasolina){
                let resultadoPreco = alcool / gasolina
                if resultadoPreco >= 0.7{
                    self.labelResultado.text = "Melho utilizar Gasolina"
                }else{
                    self.labelResultado.text = "Melho utilizar alcool"
                }
            }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

