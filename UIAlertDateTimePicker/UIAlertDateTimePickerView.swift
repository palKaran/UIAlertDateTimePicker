//
//  UIAlertDateTimePickerView.swift
//  Date Picker
//
//  Created by Karan Pal on 04/04/19.
//  Copyright © 2019 Karan. All rights reserved.
//

import UIKit

class UIAlertDateTimePickerView : UIView {
    
    var datePicker : UIDatePicker!
    var timePicker : UIDatePicker!
    var dataStruct : UIAlertDataStruct
    var alertViewWidth : CGFloat = 280
    var frameHeight : CGFloat = 230;
    var pickerHeight : CGFloat = 130
    var titleHeight : CGFloat = 40
    var buttonHeight : CGFloat = 46
    var positiveButton : UIButton!
    var negativeButton : UIButton!
    var backButton : UIButton!
    let layerColor = #colorLiteral(red: 0.8990570903, green: 0.8990781903, blue: 0.8990668654, alpha: 1)
    
    var delegate : UIAlertDateTimePickerDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(withframe frame: CGRect, data: UIAlertDataStruct) {
        self.dataStruct = data
        var frame = frame;
        let padding = (frame.size.width - alertViewWidth)/2
        frame.origin.x = padding
        frame.size.width = alertViewWidth;
        frame.size.height = frameHeight;
        super.init(frame: frame)
        
        self.configureView()
    }
    
    func configureView() {
        
        
        self.configureAlertView()
        
        let defaultFrame = CGRect(origin: CGPoint(x: 0, y: titleHeight), size: CGSize(width: self.frame.size.width, height: pickerHeight))
        let outerFrame = CGRect(origin: CGPoint(x: self.frame.size.width, y: titleHeight), size: CGSize(width: self.frame.size.width, height: pickerHeight))
        switch self.dataStruct.datePickerMode {
        case .date?:
            self.configurePicker(picker: self.datePicker, withFrame: defaultFrame)
            break
        case .time?:
            self.configurePicker(picker: self.timePicker, withFrame: defaultFrame)
            break
        case .dateAndTime?:
            self.configurePicker(picker: self.datePicker, withFrame: defaultFrame)
            self.configurePicker(picker: self.timePicker, withFrame: outerFrame)
            break
        case .countDownTimer?:
            break
        case .none:
            break
        case .some(_):
            break
        }
        
        
    }
    
    func configurePicker(picker : UIDatePicker?, withFrame frame : CGRect) {
        
        if picker == self.datePicker {
            self.datePicker = UIDatePicker(frame: frame)
            self.datePicker.datePickerMode = .date
            self.addSubview(self.datePicker)
        }else {
            self.timePicker = UIDatePicker(frame: frame)
            self.timePicker.datePickerMode = .time
            self.addSubview(self.timePicker)
        }
        
        self.layer.addSublayer(self.getLayer(forFrame: CGRect(x: 0, y: frameHeight - buttonHeight + 1, width: self.frame.width, height: 1), withColor: layerColor))
        
        if let maxDate = self.dataStruct.maxDate {
            if datePicker != nil {
                self.datePicker.maximumDate = maxDate
            }
            if timePicker != nil {
                self.timePicker.maximumDate = maxDate
            }
        }
        
        if let minDate = self.dataStruct.minDate {
            if datePicker != nil {
                self.datePicker.minimumDate = minDate
            }
            if timePicker != nil {
                self.timePicker.minimumDate = minDate
            }
        }
    }
    
    func configureAlertView() {
        
        backButton = UIButton(frame: CGRect(x: 8, y: 5, width: 30, height: 30))
        backButton.contentEdgeInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        backButton.setImage(getBackImage(), for: .normal)
        backButton.isHidden = true;
        backButton.addTarget(self, action: #selector(self.backButtonClicked), for: .touchUpInside)
        self.addSubview(backButton)
        
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = true
        
        
        let font = UIFont.boldSystemFont(ofSize: 17)
        var labelFinalHeight =
            self.dataStruct.pickerTitle.height(withConstrainedWidth: self.frame.width - 100, font: font)
        labelFinalHeight = labelFinalHeight < titleHeight ? titleHeight : labelFinalHeight
        
        let label = UILabel(frame: CGRect(x: titleHeight, y: 0, width: self.frame.width - 100, height: labelFinalHeight))
        label.font = font
        label.text = self.dataStruct.pickerTitle
        label.numberOfLines = 0
        label.textAlignment = .center
//        label.layer.addSublayer(self.getLayer(forFrame: CGRect(x: -50, y: labelFinalHeight - 1, width: self.frame.width, height: 1), withColor: layerColor))
        
        self.addSubview(label)
        
        if labelFinalHeight > titleHeight {
            self.titleHeight = labelFinalHeight
            if self.dataStruct.datePickerMode == .dateAndTime {
                let frame = self.timePicker.frame
                self.timePicker.frame = CGRect(x: frame.origin.x, y: labelFinalHeight, width: frame.size.width, height: self.pickerHeight)
            }
            
            let frame = self.datePicker.frame
            self.datePicker.frame = CGRect(x: frame.origin.x, y: labelFinalHeight, width: frame.size.width, height: self.pickerHeight)
        }
        
        self.pickerHeight = self.frame.height - (titleHeight + buttonHeight)
        
        
        let buttonWidth = (self.frame.width/2) - 0.5
        
        negativeButton = UIButton(frame: CGRect(x: 0, y: frameHeight - buttonHeight, width: buttonWidth, height: buttonHeight))
        negativeButton.setTitleColor(.red, for: .normal)
        negativeButton.backgroundColor = .white;
        negativeButton.setTitle("Cancel", for: .normal)
        negativeButton.addTarget(self, action: #selector(self.negativeButtonClicked(button:)), for: .touchUpInside)
        self.addSubview(negativeButton)
        
        
        positiveButton = UIButton(frame: CGRect(x: buttonWidth, y: frameHeight - buttonHeight, width: buttonWidth, height: buttonHeight))
        positiveButton.setTitleColor(#colorLiteral(red: 0.1960784314, green: 0.4823529412, blue: 0.9647058824, alpha: 1), for: .normal)
        positiveButton.backgroundColor = .white
        if self.dataStruct.datePickerMode == .dateAndTime {
            positiveButton.setTitle("Set Time", for: .normal)
        }else {
            positiveButton.setTitle("Done", for: .normal)
        }
        positiveButton.addTarget(self, action: #selector(self.positiveButtonClicked(button:)), for: .touchUpInside)
        self.addSubview(positiveButton)
        
        self.layer.addSublayer(self.getLayer(forFrame: CGRect(x: buttonWidth, y: frameHeight - buttonHeight + 1, width: 1, height: buttonHeight), withColor: layerColor))
        
    }
    
    
    func getLayer(forFrame frame: CGRect, withColor color: UIColor) -> CALayer {
        let layer = CALayer()
        layer.frame = frame
        layer.backgroundColor = color.cgColor
        
        return layer
    }
    
    
    //MARK: - BUTTONS
    @objc func backButtonClicked() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            
            var datePickerFrame = self.datePicker.frame
            var timePickerFrame = self.timePicker.frame
            
            datePickerFrame.origin.x = 0
            timePickerFrame.origin.x = self.frame.width
            
            self.datePicker.frame = datePickerFrame
            self.timePicker.frame = timePickerFrame
            self.positiveButton.setTitle("Set Time", for: .normal)
            self.backButton.isHidden = true
            
        }, completion: nil)
    }
    
    @objc func negativeButtonClicked(button: UIButton) {
        self.delegate?.negativeButtonClicked()
    }
    
    @objc func positiveButtonClicked(button: UIButton) {
        
        if (self.dataStruct.datePickerMode == .dateAndTime) && self.timePicker.frame.origin.x != 0 {
            self.timePicker.date = self.datePicker.date
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                
                var datePickerFrame = self.datePicker.frame
                var timePickerFrame = self.timePicker.frame
                
                datePickerFrame.origin.x = -self.frame.width
                timePickerFrame.origin.x = 0
                
                self.datePicker.frame = datePickerFrame
                self.timePicker.frame = timePickerFrame
                self.positiveButton.setTitle("Done", for: .normal)
                self.backButton.isHidden = false
                
            }, completion: nil)
        }else {
            var date = self.datePicker.date
            if self.dataStruct.datePickerMode == .dateAndTime {
                /*let dateFormatter = DateFormatter()
                 dateFormatter.timeZone = TimeZone(identifier: "UTC")
                 dateFormatter.dateFormat = "dd MM yyyy "
                 var dateString = dateFormatter.string(from: date)
                 date = self.timePicker.date
                 dateFormatter.dateFormat = "HH:mm"
                 dateString = dateString + dateFormatter.string(from: date)
                 dateFormatter.dateFormat = "dd MM yyyy HH:mm"
                 date = dateFormatter.date(from: dateString)!*/
                date = self.timePicker.date
            }
            self.delegate?.positiveButtonClicked(withDate: date)
        }
    }
    
}

extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}
