//
//  ViewController.swift
//  PlayerSom
//
//  Created by Vilmar Ferreira Gomes on 29/04/19.
//  Copyright © 2019 Vilmar Ferreira Gomes. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var player = AVAudioPlayer()
    @IBOutlet weak var sliderVolume: UISlider!
    
    @IBAction func atualizarVolume(_ sender: Any) {
        
        player.volume = sliderVolume.value
        
    }
    @IBAction func play(_ sender: Any) {
        player.play()
    }
    @IBAction func stop(_ sender: Any) {
        player.stop()
        player.currentTime = 0
        
    }
    @IBAction func pause(_ sender: Any) {
        player.pause()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let path = Bundle.main.path(forResource: "bach", ofType: "mp3"){
            let  url = URL(fileURLWithPath: path)
        
//            player = AVAudioPlayer(contentsOf: url)
            do {
                player = try AVAudioPlayer(contentsOf: url)
                
                player.prepareToPlay()
                
            }catch{
                print("Erro")
            }
            
//            player.play()
            
        }
        
    }


}

