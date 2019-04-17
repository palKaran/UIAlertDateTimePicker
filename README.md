# UIAlertDateTimePicker
UIAlertDateTimePicker is a date and time picker in form of an Alert View. Which gives you a feels of a native alert view in iOS.


![screenshots](https://user-images.githubusercontent.com/27779489/56320756-70587980-6182-11e9-8842-a7bf237255a6.png)
![screenshots](https://user-images.githubusercontent.com/27779489/56320758-70f11000-6182-11e9-9d83-bac78bcc2b4a.png)

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
