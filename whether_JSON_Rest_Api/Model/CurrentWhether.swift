//
//  CurrentWhether.swift
//  whether_JSON_Rest_Api
//
//  Created by hp ios on 1/25/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//

import Foundation
class CurrentWeather
{
    let temperature: Int?
    let humidity: Int?
    let summary: String?
    let precipitation: Int?
    
    
    struct WeatherKeys {
        static let temperature = "temperature"
        static let summary = "summary"
        static let humidity = "humidity"
        static let precipitation = "precipProbability"
        
    }
    
    init(weatherDictionary: [String : Any])
    {
        
        
        
        if let temperatureD = weatherDictionary[WeatherKeys.temperature] as? Double {
            temperature = Int(temperatureD * 100)
            print(temperature ?? "no temperature ")
        } else {
            temperature = nil
        }
        
        if let humidityD = weatherDictionary[WeatherKeys.humidity] as? Double {
            humidity = Int(humidityD * 100)
            print(humidity ?? "no humidity")
        } else {
            humidity = nil
        }
      
        if let precipitationD = weatherDictionary[WeatherKeys.precipitation] as? Double {
            precipitation = Int(precipitationD * 100)
             print(precipitation ?? "no precipitationD ")
        } else {
            precipitation = nil
        }
        
        summary = weatherDictionary[WeatherKeys.summary] as? String
        
    }
    
    


}
