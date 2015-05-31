# SSValidationTextField
A UITextField class in Swift that helps the user show a validation message right under the textField. 

To use it, copy SSValidationTextField class to project. Either set this class as custom class in Storyboard or create an object programmatically. Set error and success messages for validations and you are good to go.

![Demo](https://github.com/shamasshahid/SSValidationTextField/blob/develop/SSValidationdemo.gif?raw=true)


###Sample Code
A sample code would look like this


```
var phoneValidationTextField = SSValidationTextField(frame: CGRectMake(200, 200, 150, 50))
phoneValidationTextField.validityFunction = self.isValidPhone
phoneValidationTextField.delaytime = 0.5
phoneValidationTextField.errorText = "Incorrect Format"
phoneValidationTextField.successText = "Valid Format"
phoneValidationTextField.borderStyle = UITextBorderStyle.RoundedRect
self.addSubview(phoneValidationTextField)
```

### Validity Function
Function to check validity is provided by the user. This function is called by SSValidationTextField. It should intake a String object and return Bool value based on whether the String was of valid format or not. For instance, it should be something like 
```
func isValidEmail(stringValue: String) ->Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluateWithObject(stringValue)
}
```

### Delay Timer
Set after how much delay of the last input by user, should the validity function be called. Setting it to 0 would never call the validity function and means you will manually call it. Default value is 0.5 secs.


```
phoneValidationTextField.delaytime = 1
```

### Manually check Validity
Manually check validity of the textField. Return true or false. 

```
var result = phoneValidationTextField.checkValidity()
```

### Set Error/Success Text
Set texts to be displayed in case of valid or invalid inputs. 
```
phoneValidationTextField.errorText = "Incorrect Format"
phoneValidationTextField.successText = "Valid Format"
```

### Customize Error/Success Label
Additionally you could set textColor and backgroundColor for Error and Success labels individually. 
```
phoneValidationTextField.errorTextColor = UIColor.blackColor()
phoneValidationTextField.errorBackgroundColor = UIColor.redColor()
phoneValidationTextField.successText = UIColor.whiteColor()
phoneValidation.successBackgroundColor = UIColor.greenColor()
```