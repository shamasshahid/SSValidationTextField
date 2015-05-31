//
//  ViewController.swift
//  SampleProject
//
//  Created by Al Shamas Tufail on 29/05/2015.
//  Copyright (c) 2015 Shamas Shahid. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet var emailValidationTextField: SSValidationTextField!
    var phoneValidationTextField: SSValidationTextField?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        emailValidationTextField.validityFunction = self.isValidEmail
        emailValidationTextField.delaytime = 1
        emailValidationTextField.becomeFirstResponder()

        phoneValidationTextField = SSValidationTextField(frame: CGRectMake(200, 200, 150, 50))
        phoneValidationTextField!.validityFunction = self.isValidPhone
        phoneValidationTextField!.delaytime = 0.5
        phoneValidationTextField!.errorText = "Incorrect Format"
        phoneValidationTextField!.successText = "Valid Format"
        phoneValidationTextField!.borderStyle = UITextBorderStyle.RoundedRect
        phoneValidationTextField!.placeholder = "Phone Validation"
        phoneValidationTextField!.font = UIFont.systemFontOfSize(14)
//        self.view.addSubview(phoneValidationTextField!)

//        layout(emailValidationTextField, phoneValidationTextField!) { view1, view2 in
//            view2.height == 50
//            view2.width == 150
//            view2.centerX == view2.superview!.centerX
//            view2.centerY == view2.superview!.centerY
//        }
    }

    func isValidPhone(stringValue: String) -> Bool {
        let phoneRegEx = "^\\d{10}$"
        var phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegEx)
        return phoneTest.evaluateWithObject(stringValue)
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

