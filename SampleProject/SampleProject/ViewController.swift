//
//  ViewController.swift
//  SampleProject
//
//  Created by Al Shamas Tufail on 29/05/2015.
//  Copyright (c) 2015 Shamas Shahid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var validationTextField: SSValidationTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        validationTextField.validityFunction = self.isValidEmail
        validationTextField.delaytime = 1
        validationTextField.becomeFirstResponder()
    }

    func isValidEmail(stringValue: String) ->Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(stringValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

