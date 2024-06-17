//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBAction func reg(_ sender: UIButton) {
        performSegue(withIdentifier: "register", sender: self)
    }
    @IBAction func log(_ sender: UIButton) {
        performSegue(withIdentifier: "login", sender: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.isNavigationBarHidden=true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.isNavigationBarHidden=false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
let title="⚡️FlashChat"
        var index=0.0
        titleLabel.text=""
        for item in title {
            Timer.scheduledTimer(withTimeInterval: 0.1*index, repeats: false){
                (timer) in
                self.titleLabel.text?.append(item)
                
            }
            index += 1
           
        }
       
    }
    

}
