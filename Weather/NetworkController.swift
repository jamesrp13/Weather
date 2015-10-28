//
//  NetworkController.swift
//  Weather
//
//  Created by James Pacheco on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class NetworkController {
    static let baseURLString = "http://api.openweathermap.org/data/2.5/weather?zip="
    
    static let apiKey = "795b19fbe8d93d9c68117c65c5aa2d48"
    
    static func searchURL(zip: String) -> NSURL {
        let URLString = baseURLString + zip + ",us&units=imperial&appid=" + apiKey
        return NSURL(string: URLString)!
    }
    
    static func dataAtURL(url: NSURL, completion: (resultData: NSData?) -> Void) {
        
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            if let error = error {
                print(error.localizedDescription)
            }
            
            completion(resultData: data)
        }
        
        dataTask.resume()
    }
}