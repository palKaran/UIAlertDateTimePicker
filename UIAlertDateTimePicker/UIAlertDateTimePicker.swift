//
//  ViewController.swift
//  Date Picker
//
//  Created by Karan Pal on 26/02/19.
//  Copyright © 2019 Karan. All rights reserved.
//

import UIKit

public class UIAlertDateTimePicker: NSObject, UIAlertDateTimePickerDelegate, UITableViewDelegate {
    
    var dataStruct : UIAlertDataStruct = UIAlertDataStruct()
    var backgroundView : UIView = UIView()
    weak var view : UIView?
    var dateTimePickerView : UIAlertDateTimePickerView!
    weak open var delegate : UIAlertDateTimePickerDelegate?
    
    public init(withPickerMode pickerMode: UIDatePicker.Mode, pickerTitle: String?, showPickerOn view: UIView) {
        
        super.init()
        
        self.setup(withPickerMode: pickerMode, pickerTitle: pickerTitle, showPickerOn: view)
    }
    
    public init(withPickerMode pickerMode: UIDatePicker.Mode, pickerTitle: String?, minDate: Date?, maxDate: Date?, showPickerOn view: UIView) {
        
        super.init()
        
        self.dataStruct.maxDate = maxDate
        self.dataStruct.minDate = minDate
        self.setup(withPickerMode: pickerMode, pickerTitle: pickerTitle, showPickerOn: view)
    }
    
    func setup(withPickerMode pickerMode: UIDatePicker.Mode, pickerTitle: String?, showPickerOn view: UIView) {
        self.dataStruct.datePickerMode = pickerMode;
        if (pickerTitle == nil) || (pickerTitle == "") {
            
            switch pickerMode {
            case .date:
                self.dataStruct.pickerTitle = "Select Date"
                break
            case .time:
                self.dataStruct.pickerTitle = "Select Time"
                break
            case .dateAndTime:
                self.dataStruct.pickerTitle = "Select Date & Time"
                break
            case .countDownTimer:
                fatalError("UIAlertDateTimePicker: Count Down Timer is not supported in this version")
                break
            @unknown default:
                fatalError("Unknown Picker Mode")
            }
        }else {
            self.dataStruct.pickerTitle = pickerTitle!
        }
        
        self.view = view
        self.configureView()
    }
    
    func configureView() {
        
        backgroundView = UIView(frame: self.view!.bounds)
        backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0)
        
        
        self.dateTimePickerView = UIAlertDateTimePickerView(withframe: backgroundView.bounds, data: self.dataStruct)
        self.dateTimePickerView.center = self.backgroundView.center
        self.dateTimePickerView.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
        
    }
    
    public func showAlert() {
        
        if self.backgroundView.superview != nil {
            return
        }
        
        DispatchQueue.main.async {
            self.view?.addSubview(self.backgroundView)
            self.backgroundView.addSubview(self.dateTimePickerView!)
        }
        UIView.animate(withDuration: 0.2, delay: 0.1, options: .curveEaseIn, animations: {
            self.backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
            self.dateTimePickerView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: {(finished) in
            self.dateTimePickerView.delegate = self
        })
    }
    
    public func negativeButtonClicked() {
        self.dismissSelf()
        self.delegate?.negativeButtonClicked()
    }
    
    public func positiveButtonClicked(withDate date: Date) {
        self.dismissSelf()
        self.delegate?.positiveButtonClicked(withDate: date)
    }
    
    func dismissSelf() {
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.backgroundView.backgroundColor = UIColor.black.withAlphaComponent(0)
            self.dateTimePickerView?.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
        }, completion:{ (finished) in
            self.deinitialize()
        })
    }
    
    func deinitialize() {
        
        self.backgroundView.removeFromSuperview()
        self.dateTimePickerView?.removeFromSuperview()
        self.dateTimePickerView.delegate = nil
        self.dateTimePickerView = nil
    }
    
}

