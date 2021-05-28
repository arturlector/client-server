//
//  Weather.swift
//  client-server-swift
//
//  Created by Artur Igberdin on 28.05.2021.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weather = try? newJSONDecoder().decode(WeatherResponse.self, from: jsonData)

import Foundation

// MARK: - Weather
struct WeatherResponse: Codable {
    //let message: Int
    //let cod: String
    //let cnt: Int
    let list: [List]
}

// MARK: - List
struct List: Codable {
    //let clouds: Clouds
    //let wind: Wind
    let dt: Int
    let dtTxt: String
    //let main: Main
    let weather: [Weather]
    let pop: Int
    //let sys: Sys
    let visibility: Int

    enum CodingKeys: String, CodingKey {
        //case clouds, wind,
        case dt
        case dtTxt = "dt_txt"
       // case main,
        case weather, pop, visibility
        //case sys,
    }
}

// MARK: - WeatherElement
struct Weather: Codable {
    let id: Int
    let main, icon, weatherDescription: String

    enum CodingKeys: String, CodingKey {
        case id, main, icon
        case weatherDescription = "description"
    }
}


//// MARK: - Clouds
//struct Clouds: Codable {
//    let all: Int
//}

//// MARK: - Main
//struct Main: Codable {
//    let humidity: Int
//    let feelsLike, tempMin, tempMax, temp: Double
//    let pressure: Int
//    let tempKf: Double
//    let seaLevel, grndLevel: Int
//
//    enum CodingKeys: String, CodingKey {
//        case humidity
//        case feelsLike = "feels_like"
//        case tempMin = "temp_min"
//        case tempMax = "temp_max"
//        case temp, pressure
//        case tempKf = "temp_kf"
//        case seaLevel = "sea_level"
//        case grndLevel = "grnd_level"
//    }
//}

//// MARK: - Sys
//struct Sys: Codable {
//    let pod: String
//}


//// MARK: - Wind
//struct Wind: Codable {
//    let speed: Double
//    let deg: Int
//    let gust: Double
//}
