//
//  MappingViewController.swift
//  client-server-swift
//
//  Created by Artur Igberdin on 28.05.2021.
//

import UIKit
import Alamofire

class MappingViewController: UIViewController {

    let weatherService = WeatherService()
    
    override func viewDidLoad() {
        super.viewDidLoad()

 //"https://jsonplaceholder.typicode.com/users"

        //JSONSerialization (Manual Parsing)
        //loadUsersFirstExample()
        
        //Codegen + Codable (Quicktype)
        //loadUsersSecondExample()
        
        //weatherService.getWeatherData(city: "Moscow")
        
        weatherService.getWeatherData(city: "Moscow") { weatherModel in
            
            //На UI отобразить
            
            print(weatherModel.temperatureC ?? 0)
            print(weatherModel.date ?? "")
            print(weatherModel.cityName ?? "")
        }
        
    }
    
    func loadUsersSecondExample() {
        
        AF.request("https://jsonplaceholder.typicode.com/users", method: .get).responseData { response in
            
            guard let data = response.value else { return }
            
            print(data.prettyJSON as Any)
            
            let users = try? JSONDecoder().decode([UserElement].self, from: data)
            
            print(users?.first)
        }
     
    }
    
    func loadUsersFirstExample() {
        
        AF.request("https://jsonplaceholder.typicode.com/users", method: .get).responseData { response in
            
            guard let data = response.value,
                  let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                  else { return }
            
            print(data.prettyJSON as Any)
            
            //print(json)
            
            let array = json as! [Any]
            
            for userJson in array {
                
                let userJson = userJson as! [String: Any]
                
                let id = userJson["id"] as! Int
                let name = userJson["name"] as! String
                
                let username = userJson["username"] as! String
                let email = userJson["email"] as! String
                let addressJson = userJson["address"] as! [String: Any]
                let street = addressJson["street"] as! String
                let suite = addressJson["suite"] as! String
                let city = addressJson["city"] as! String
                let zipcode = addressJson["zipcode"] as! String
                let geoJson = addressJson["geo"] as! [String: Any]
                let lat = geoJson["lat"] as! String
                let lng = geoJson["lng"] as! String
                let phone = userJson["phone"] as! String
                let website = userJson["website"] as! String
                let companyJson = userJson["company"] as! [String: Any]
                let companyName = companyJson["name"] as! String
                let catchPhrase = companyJson["catchPhrase"] as! String
                let bs = companyJson["bs"] as! String
                
                print(id, name, username, email, street, suite, city, zipcode, lat, lng, phone, website, companyName, catchPhrase, bs)
            }
        }
    }

}
