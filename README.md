# UIAlertDateTimePicker
UIAlertDateTimePicker is a date and time picker in form of an Alert View. Which gives you a feels of a native alert view in iOS.


![screenshots](https://user-images.githubusercontent.com/27779489/56321097-52d7df80-6183-11e9-9042-33c4c3af88b6.png)
![screenshots](https://user-images.githubusercontent.com/27779489/56321098-52d7df80-6183-11e9-99ef-12834ed1af6e.png)

###### UIAlertDateTimePicker works on iOS 10+  


# Adding UIAlertDateTimePicker to your project
## CocoaPods
1. Add a pod entry for UIAlertDateTimePicker to your Podfile ```pod 'UIAlertDateTimePicker', '~> 1.0'```
2. Install the pod(s) by running ```pod install```.
3. Include UIAlertDateTimePicker wherever you need it with ```import UIAlertDateTimePicker```.

# Usage
You can setup your UIAlertDateTimePicker in the following ways  
1. ```UIAlertDateTimePicker(withPickerMode: .dateAndTime, pickerTitle: "Select Date & Time", showPickerOn: self.view)```  
2. ```UIAlertDateTimePicker(withPickerMode: .dateAndTime, pickerTitle: "Select Date & Time", minDate: minDate, maxDate: maxDate, showPickerOn: self.view)```  

Set delegate to receive callbacks of Alert buttons with dates  
```datePicker.delegate = self```  
  
Add Protocol to your class ```UIAlertDateTimePickerDelegate```  
  
The code below will present your UIAlertDateTimePicker on the screen  
```datePicker.showAlert()```  

### Note: UIAlertDateTimePicker doesn't supports countDownTimer mode.

###### Your suggestions are important for me please feel free to put up your suggestions for this project.
