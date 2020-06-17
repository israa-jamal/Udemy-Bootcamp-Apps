//
//  ViewController.swift
//  Xylophone
//
//  Created by mac on 4/22/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle!)
        
        sender.alpha = 0.7 // reduce the opacity of a button when it's pressed to 0.7
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            //Bring's sender's opacity back up to fully opaque.
            sender.alpha = 1.0 // make the opacity 1 again after 0.3 second
        }
    }
    
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        //play the sound file from the addressed url 
            player = try! AVAudioPlayer(contentsOf: url!)
        
        player.play()
    
}
}
