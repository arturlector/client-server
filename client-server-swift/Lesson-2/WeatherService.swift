//
//  WeatherService.swift
//  client-server-swift
//
//  Created by Artur Igberdin on 24.05.2021.
//

import Foundation
import Alamofire

final class WeatherService {
    
    private let baseUrl = "http://api.openweathermap.org"
        
    private let apiKey = "92cabe9523da26194b02974bfcd50b7e"
    
    //MARK: - Public
    
    func getWeatherData(city: String) {
        
        let path = "/data/2.5/forecast"
        
        let params: Parameters = [
            "q": city,
            "units": "metric",
            "appid": apiKey
        ]

        let url = baseUrl+path
        
        AF.request(url, method: .get, parameters: params).responseJSON { response in
            
            print(response.value as Any)
        }
    }
}
