//
//  ViewController.swift
//  sons de animais
//
//  Created by Vilmar Ferreira Gomes on 29/04/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var player = AVAudioPlayer()
    
    @IBAction func cachorro(_ sender: Any) {
        playerSom(som: "cao")
    }
    @IBAction func gato(_ sender: Any) {
        playerSom(som: "gato")
    }
    @IBAction func leao(_ sender: Any) {
        playerSom(som: "leao")
    }
    @IBAction func macaco(_ sender: Any) {
        playerSom(som: "macaco")
    }
    @IBAction func ovelha(_ sender: Any) {
        playerSom(som: "ovelha")
    }
    @IBAction func vaca(_ sender: Any) {
        playerSom(som: "vaca")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func playerSom (som:String){
        if let path = Bundle.main.path(forResource: som, ofType: "mp3"){
            let  url = URL(fileURLWithPath: path)
            
            //            player = AVAudioPlayer(contentsOf: url)
            do {
                player = try AVAudioPlayer(contentsOf: url)
                
                player.prepareToPlay()
                player.play()
            }catch{
                print("Erro")
            }
            
            //            player.play()
            
        }
    }

}

