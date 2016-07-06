//
//  ViewController.swift
//  FitnessTracker
//
//  Created by Pollux on 06/07/16.
//  Copyright © 2016 Pollux. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle the text field's user input through delegate callbacks.
        
        nameTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        // Hide the keyboard
        
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        deviceNameLabel.text = textField.text
    }
    
    
    // MARK: Actions
    
    @IBAction func setDefaultLAbelText(sender: UIButton) {
        deviceNameLabel.text = "Default text"
    }
    

}
