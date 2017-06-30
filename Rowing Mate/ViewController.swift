//
//  ViewController.swift
//  Rowing expert
//
//  Created by Yusuf Soliman on 4/27/17.
//  Copyright © 2017 GradProj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var usernameNameLabel: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hello world")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Actions
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        usernameNameLabel.text = "Default Text"
    }
}

