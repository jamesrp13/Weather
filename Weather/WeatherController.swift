//
//  WeatherController.swift
//  Weather
//
//  Created by James Pacheco on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class WeatherController {
    static let sharedInstance = WeatherController()
    
    var weatherArray: [Weather] = []
    
    func searchWeather(zip: String, completion: (success: Bool) -> Void) {
        let url = NetworkController.searchURL(zip)
        
        NetworkController.dataAtURL(url) { (resultData) -> Void in
            guard let resultData = resultData else {
                completion(success: false)
                print("NO DATA RETURNED")
                return
            }
            
            do {
                let resultsAnyObject = try NSJSONSerialization.JSONObjectWithData(resultData, options: .AllowFragments)
                if let resultsDictionary = resultsAnyObject as? [String:AnyObject] {
                    let weather = Weather(jsonDictionary: resultsDictionary)
                    self.weatherArray.append(weather)
                    completion(success: true)
                } else {
                    completion(success: false)
                }
                
            } catch {
                completion(success: false)
            }
            
        }
        
    }
}
