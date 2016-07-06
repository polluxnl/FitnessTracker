//
//  ViewController.swift
//  FitnessTracker
//
//  Created by Pollux on 06/07/16.
//  Copyright © 2016 Pollux. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: Actions
    
    @IBAction func setDefaultLAbelText(sender: UIButton) {
        deviceNameLabel.text = "Default text"
    }
    

}

