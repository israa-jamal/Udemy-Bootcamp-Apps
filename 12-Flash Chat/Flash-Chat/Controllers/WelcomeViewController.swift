//
//  ViewController.swift
//  Flash-Chat
//
//  Created by Esraa Gamal on 5/13/20.
//  Copyright © 2020 Esraa. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    //hides the navigation bar in the welcome view
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    //display the navigation bar before going to the next views
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*making an animation where it shows the title
        letter by letter */
        
        let title = K.appName
        var counter = 0.0
        for char in title {
            Timer.scheduledTimer(withTimeInterval: 0.1 * counter, repeats: false) { (Timer) in
                
                self.titleLabel?.text?.append(char)
            }
            counter += 1
            
        }
    }
}

