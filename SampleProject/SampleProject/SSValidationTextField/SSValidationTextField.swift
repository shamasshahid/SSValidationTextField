//
//  SSValidationTextField.swift
//  SampleProject
//
//  Created by Al Shamas Tufail on 29/05/2015.
//  Copyright (c) 2015 Shamas Shahid. All rights reserved.
//

import UIKit
@IBDesignable
class SSValidationTextField: UITextField {
    /**
        Validity Function to check whether the input string is valid or not. Such a function should take a String parameter and return Bool.
    
        :param: validityFunction A function that would intake a String and return Bool
    */
    var validityFunction: ((String) -> Bool)?
    /**
        After how much delay (in seconds) since last input to textField should the validity check be performed. Default value is 0.5. Setting this value to 0 would never automatically call the validity function and users is expected to call it themselves.
    */
    var delaytime: NSTimeInterval = 0.5
    private var delayTimer: NSTimer? = nil
    private var errorLabel: UILabel? = nil

    @IBInspectable var errorText: String = "Invalid"
    /**
        Set color for error text message label.
    */
    var errorTextColor: UIColor = UIColor.redColor()
    /**
        Set background color for error text message label.
    */
    var errorBackgroundColor: UIColor = UIColor.clearColor()
    @IBInspectable var successText: String = "Ok"
    /**
        Set color for success text message label.
    */
    var successTextColor: UIColor = UIColor.greenColor()
    /** 
        Set background color for success text message label.
    */
    var successBackgroundColor: UIColor = UIColor.clearColor()

    private var animationDuration: NSTimeInterval = 0.1

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setup()
    }

    private func setup() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "textFieldEdited:", name: UITextFieldTextDidChangeNotification, object: nil)
    }

    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    func textFieldEdited(aNotificaiton: NSNotification) {
        if self == aNotificaiton.object! as! SSValidationTextField {
            var currentString = self.text
            if self.validityFunction != nil {
                if delaytime != 0 {
                    setTimerForValidation()
                }
            }
        }
    }

    private func setTimerForValidation() {
        if delayTimer != nil {
            delayTimer?.invalidate()
            delayTimer = nil
        }
        delayTimer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(delaytime), target: self, selector: "checkValidity", userInfo: nil, repeats: false)
    }
/**
    When called manually, performs the validity check, sets the appropriate label and returns bool whether validation was successful or not.

    :returns: A Bool whether validation was successful or not.
*/
    func checkValidity() -> Bool {
        var currentString = self.text
        if currentString.isEmpty {
            if errorLabel != nil {
                errorLabel!.hidden = true
            }
            return false
        }
        if self.validityFunction!(currentString) {
            println("yes is valid")
            self.setLabel(true)
            return true
        } else {
            println("no not valid")
            self.setLabel(false)
            return false
        }
    }

    private func setLabel(isValid: Bool) {
        if errorLabel == nil {
            errorLabel = UILabel(frame: CGRectMake(8, self.frame.height - 8, self.frame.width - 16, 8))
            errorLabel?.font = UIFont.systemFontOfSize(10)
            self.addSubview(errorLabel!)
        }
        errorLabel!.hidden = false
        if isValid {
            errorLabel?.textColor = successTextColor
            errorLabel?.backgroundColor = successBackgroundColor
            errorLabel!.text = successText
        } else {
            errorLabel?.textColor = errorTextColor
            errorLabel?.backgroundColor = errorBackgroundColor
            errorLabel!.text = errorText
        }
        self.animationLabel()
    }

    private func animationLabel() {
        if errorLabel != nil {
            UIView.animateWithDuration(animationDuration, animations: { () -> Void in
                self.errorLabel!.transform = CGAffineTransformMakeScale(1.1, 1.1)
                }) { (completed) -> Void in
                    UIView.animateWithDuration(self.animationDuration, animations: { () -> Void in
                        self.errorLabel!.transform = CGAffineTransformMakeScale(1.0, 1.0)
                    })
            }
        }
    }

    override func prepareForInterfaceBuilder() {
        setup()
    }
}
