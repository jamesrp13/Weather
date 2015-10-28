//
//  ViewController.swift
//  Weather
//
//  Created by Edward Suczewski on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {

    
    @IBOutlet weak var cityNameLabel: UILabel!
        
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        if let text = searchBar.text {
            WeatherController.sharedInstance.searchWeather(text, completion: { (success) -> Void in
                if success {
                    if let weather = WeatherController.sharedInstance.weatherArray.last {
                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                            self.mainLabel.text = weather.main
                            self.descriptionLabel.text = weather.description
                            if let temp = weather.temp {
                                self.tempLabel.text = String(temp)
                            }
                            self.cityNameLabel.text = weather.name
                            
                        })
                    }
                }
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkController.dataAtURL(NetworkController.searchURL(String(20171))) { (resultData) -> Void in
            print(resultData)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
