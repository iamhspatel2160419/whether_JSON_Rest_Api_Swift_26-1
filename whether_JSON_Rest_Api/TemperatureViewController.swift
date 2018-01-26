//
//  TemperatureViewController.swift
//  whether_JSON_Rest_Api
//
//  Created by hp ios on 1/26/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//

import UIKit

class TemperatureViewController: UIViewController {
    
   
    let forecaseAPIkey = "1aef29e8cf77e0cd65f52a9b658a98f0"
    let coordinate: (lat:Double,lon:Double) = (23.033863,72.585022)
   
    @IBOutlet weak var myCityTemp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let forecastService = ForecastService(APIKey: forecaseAPIkey)
        forecastService.getForeCast(latitude: coordinate.lat,
                                    longitude: coordinate.lon)
        {     (currentWhetherOfMyCity) in
            
            if let cityWhether = currentWhetherOfMyCity
            {
                DispatchQueue.main.async {
                    
                  if let humidity = cityWhether.humidity
                  {
                     if let summary = cityWhether.summary
                     {
                        self.myCityTemp.text = "Humidity = \(humidity)\n Temperature = \(summary)\n"
                     }
                    }
            }
            
        }

        // Do any additional setup after loading the view.
    }

    }


}
