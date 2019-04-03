//
//  UIAlertDateTimeModel.swift
//  Date Picker
//
//  Created by Karan Pal on 04/04/19.
//  Copyright © 2019 Karan. All rights reserved.
//
import UIKit

struct UIAlertDataStruct {
    var datePickerMode : UIDatePicker.Mode! = .date
    var pickerTitle : String = ""
    var maxDate : Date?
    var minDate : Date?
}

public protocol UIAlertDateTimePickerDelegate : class {
    func negativeButtonClicked()
    func positiveButtonClicked(withDate date: Date)
}

public extension UIAlertDateTimePickerDelegate {
    func negativeButtonClicked() {
        
    }
}

func getBackImage() -> UIImage {
    let data = Data(base64Encoded: "iVBORw0KGgoAAAANSUhEUgAAAFoAAABaCAYAAAA4qEECAAAAAXNSR0IArs4c6QAAAstJREFUeAHt3LFOwzAQBuAzlI0BHoIZpG5MDDCxI/EabGzd2PoaldiZYGBiAomdh4CBDVDIEVWtaNPEhp7vzr+lqlWaNvZXy3WavyZCgQAEIAABCEAAAhCAAAQgAAEIQAACEIAABCBQtEBw3frrapOe6YICndft3KtvL1TRhA5oTGfhS7LtfqFH1Q590E0Ne7gAGuie9ulYEntjoRIeNjTId0uRuX0VHf30dMG2+oOeIQ9XOjbDycpd/vNJX9B9kRtBHrPFih/oOGQGfhFTrg/kAzoemcfpiST0QPJgazlWCnKgh3rWMV5LfVre1HaPTkN+pC06lZzasb3deXQ68gmNwltLx1vbZpvQxpBt9miDyPagjSLbgjaMbAfaOLINaAfI+qGdIOuGdoSsF9oZsk5oh8j6oNOQn+rfLo5znFYzYN+i5xTcMTJ/GDqgnSPrgC4AOT90Ich5oQtCzgddGHIe6AKRGVr2miFn4ZqY1upwC9dsWgKZmCdPq9t2L3sVnAOHtCQL11Y7J8jcPNkeHRPDcoQsD91EZ9v672x7oM/6tPpM+2n1rMLdj2R7dN8YVkWDeiy/pqtqt7sJNvaQhY6JYVU0pHe69YItC81Je45j9S2OsGWh+e8MHMfiL7q+xQl2nl/vUk9atumELsNr389I0355oFmgMOx80IVh54UuCDs/dCHYOqALwNYD7RxbF7RjbH3QTrF1QjvE1gvtDFs3tCNs/dBOsG1A/wVbSQDSDrRxbFvQhrHtQRvFtgltENsutDFs2WuGjPOfhVcp4FlF7DVIjqVxPE2w2IZmqDTsQ6wSltLLUrBj4mkpdfr1Gvs9etqgeGysEja1i76Pw8YqYdHA8y9gbM5/dH1BxsTT5t8/8bGfoWMegEM2Dfby+BmvTcrxNMFiex7dBaVotd2uquJ5CEAAAhCAAAQgAAEIQAACEIAABCBgSeAbq4KQeFkBfKkAAAAASUVORK5CYII=")
    return UIImage(data: data!)!
}


