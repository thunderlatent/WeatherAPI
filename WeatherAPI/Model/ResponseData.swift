// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weather = try? newJSONDecoder().decode(Weather.self, from: jsonData)

import Foundation

// MARK: - Weather
struct Weather: Codable {
    var list: [List]
    let city: City
}

// MARK: - City
struct City: Codable {
    let name: String
}

// MARK: - List
struct List: Codable {
    let main: MainClass
    let weather: [WeatherElement]
    let timeStamp: Int
    let timeStampString: String

    enum CodingKeys: String, CodingKey {
        case main, weather
        case timeStampString = "dt_txt"
        case timeStamp = "dt"
    }
}
// MARK: - MainClass
struct MainClass: Codable {
    let temp:Double
}
// MARK: - WeatherElement
struct WeatherElement: Codable {
    let weatherDescription: String
    enum CodingKeys: String, CodingKey {
        case weatherDescription = "description"
    }
}

enum MainEnum: String, Codable {
    case defaultTheme = "defaultTheme"
    case clouds = "Clouds"
}

enum Description: String, Codable {
    case 多雲 = "多雲"
    case 晴 = "晴"
    case 晴少雲 = "晴，少雲"
    case 陰多雲 = "陰，多雲"
    var icon: String
    {
        switch self {
       
        case .多雲:
            return "cloudy"
        case .晴:
            return "sun"
        case .晴少雲:
            return "cloudyAndSun"
        case .陰多雲:
            return "cloudy"
        default:
            return "cloudyAndSun"
        }
    }
}


