//
//  Weather.swift
//  Weather
//
//  Created by Edward Suczewski on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class Weather {
    
    static let weatherKey = "weather"
        static let mainKey = "main"
        static let descriptionKey = "description"
//      static let iconStringKey = "icon"
    
    static let nameKey = "name"

    static let mainTempKey = "main"
        static let tempKey = "temp"
    
    var name = ""
    var main = ""
    var description = ""
//    var iconString = ""
//    var iconImage: UIImage?
    var temp: Float?
    
    init(jsonDictionary: [String: AnyObject]) {
        if let weather = jsonDictionary[Weather.weatherKey] as? [String: AnyObject] {
            if let main = weather[Weather.mainKey] as? String {
                self.main = main
            }
            if let description = weather[Weather.descriptionKey] as? String {
                self.description = description
            }
        }
        if let main = jsonDictionary[Weather.mainTempKey] as? [String: AnyObject] {
            if let temp = main[Weather.tempKey] as? Float {
                self.temp = temp
            }
        }
        if let name = jsonDictionary[Weather.nameKey] as? String {
            self.name = name
        }
        
    }
    
}