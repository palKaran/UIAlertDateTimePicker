# UIAlertDateTimePicker
UIAlertDateTimePicker is a date and time picker in form of an Alert View. Which gives you a feels of a native alert view in iOS.


![screenshots](https://user-images.githubusercontent.com/27779489/55546902-d1e20800-56ed-11e9-89ba-aa61147145ab.png)
![screenshots](https://user-images.githubusercontent.com/27779489/55546903-d1e20800-56ed-11e9-88c3-741f7bbd065b.png)

###### UIAlertDateTimePicker works on iOS 10+  


# Adding UIAlertDateTimePicker to your project
## CocoaPods
1. Add a pod entry for UIAlertDateTimePicker to your Podfile ```pod 'UIAlertDateTimePicker', '~> 1.0'```
2. Install the pod(s) by running ```pod install```.
3. Include UIAlertDateTimePicker wherever you need it with ```import UIAlertDateTimePicker```.

# Usage
You can setup your UIAlertDateTimePicker in the following ways  
```UIAlertDateTimePicker(withPickerMode: .dateAndTime, pickerTitle: "Select Date & Time", showPickerOn: self.view)```  
and  
```UIAlertDateTimePicker(withPickerMode: .dateAndTime, pickerTitle: "Select Date & Time", minDate: minDate, maxDate: maxDate, showPickerOn: self.view)```  

Set delegate to receive callbacks of Alert buttons with dates  
```datePicker.delegate = self```  
  
Add Protocol to your class ```UIAlertDateTimePickerDelegate```  
  
The code below will present your UIAlertDateTimePicker on the screen  
```datePicker.showAlert()```  


###### Your suggestions are important for me please feel free to put up your suggestions for this project.
