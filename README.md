# SSValidationTextField
A UITextField class in Swift that helps the user show an validation message right under the textField. 

To use it, copy SSValidationTextField class to project. Either set this class as custom class in Storyboard or create an object programmatically. Set error and success messages for validations and you are good to go.

###Sample Code
A sample code would look like this


```
var radioButtonController = SSRadioButtonsController()
radioButtonController.setButtonsArray([button1!,button2!,button3!])
```

### Add or Remove buttons
You can add/remove buttons from controller by 

```
radioButtonController.addButton(button1!)
radioButtonController.removeButton(button3!)
```

### Get currently selected button
To get the currently selected button, you can use 

```
var currentButton = radioButtonController.selectedButton()
```