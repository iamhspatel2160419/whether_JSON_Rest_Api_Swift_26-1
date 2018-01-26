//
//  ForecastService.swift
//  whether_JSON_Rest_Api
//
//  Created by hp ios on 1/25/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//

import Foundation
class ForecastService
{
    let forecastAPIKey: String
    let forecastBaseURL: URL?
    
    init(APIKey: String)
    {
        self.forecastAPIKey = APIKey
        forecastBaseURL = URL(string: "https://api.darksky.net/forecast/\(APIKey)")

    }
    func getForeCast(latitude:Double,longitude:Double,completion:@escaping (CurrentWeather?)->Void )
    {
        
        if URL(string: "\(forecastBaseURL!)/\(latitude),\(longitude)") != nil
        {
          if let forcastURL =  URL(string: "\(forecastBaseURL!)/\(latitude),\(longitude)")
          {
            let networkProcessor = NetworkProcessor(url:forcastURL)
            networkProcessor.downloadJSONFromURL({ (JsonDictionary) in
                print(" JsonDictionary = \(String(describing: JsonDictionary))")
                if let currentJsonDictionary = JsonDictionary?["currently"] as? [String:Any]
                {
                  print(currentJsonDictionary)
                  let currentWhetherData = CurrentWeather(weatherDictionary: currentJsonDictionary)
                  completion(currentWhetherData)
                }
                else
                {
                    print("nil")
                  completion(nil)
                }
            })
          }
        }
        
        
    }
    
}
