//
//  NetworkViewController.swift
//  client-server-swift
//
//  Created by Artur Igberdin on 24.05.2021.
//

import UIKit
import Alamofire

class NetworkViewController: UIViewController {
    
    let weatherService = WeatherService()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //firstRequest()
        
        //secondRequest()
        
        //thirdRequest()
        
        forthRequest()
    }
    
    /*
     GET-запрос с помощью URL
     */
    func firstRequest() {
        
        let configuration = URLSessionConfiguration.default
        let session =  URLSession(configuration: configuration)
                
        guard let url = URL(string: "http://samples.openweathermap.org/data/2.5/forecast?q=Moscow,DE&appid=b1b15e88fa797225412429c1c50c122a1") else { return }
        
        //let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            
            
            let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            print(json as Any)
        }
        task.resume()
        
    }

    /*
     Конструировать URL
     Настраиваем запрос - URLRequest
     
     POST-запрос - создание объекта, параметры передаются через URL
     
     */
    func secondRequest() {
        
        // Конфигурация по умолчанию
       let configuration = URLSessionConfiguration.default
       let session =  URLSession(configuration: configuration)
       
       
    //"http://samples.openweathermap.org/data/2.5/forecast?q=Moscow,DE&appid=b1b15e88fa797225412429c1c50c122a1"
       var urlConstructor = URLComponents()
       urlConstructor.scheme = "http"
       urlConstructor.host = "jsonplaceholder.typicode.com"
       urlConstructor.path = "/posts"
       
       urlConstructor.queryItems = [
           URLQueryItem(name: "title", value: "foo"),
           URLQueryItem(name: "body", value: "bar"),
           URLQueryItem(name: "userId", value: "1")
       ]
        
        var request = URLRequest(url: urlConstructor.url!)
        request.httpMethod = "POST"

        let task = session.dataTask(with: request) { data, response, error in
            
            let json = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments)
            print(json as Any)
        }
        
        task.resume()
        
    }
    
    /*
     GET-запрос с URL
     */
    func thirdRequest() {
        
        AF.request("http://samples.openweathermap.org/data/2.5/forecast?q=Moscow,DE&appid=b1b15e88fa797225412429c1c50c122a1").responseJSON { response in
            
            print(response.value as Any)
        }
    }
    
    func forthRequest() {
        
        //weatherService.getWeatherData(city: "Moscow")
        
    }
    
    func fifthRequest() {
        
    }
 
}
