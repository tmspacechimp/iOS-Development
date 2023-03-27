
import Foundation

struct CurrentWeatherResponse : Codable {
    let weather : [WeatherInfo]
    let main : TemperatureInfo
    let clouds : Clouds
    let wind : Wind
    let name : String
    let cod : Int
}

struct WeatherInfo : Codable {
    let id : Int
    let main : String
    let description : String
    let icon : String
}

struct TemperatureInfo : Codable {
    let temp : Double
    let pressure : Int
    let humidity : Int
}

struct Clouds : Codable {
    let all : Int
}

struct Wind : Codable {
    let speed : Double
    let deg : Int
}

struct WeatherForecastResponse : Codable {
    let list : [WeatherForecastItem]
    let city : City
    let cod : String
}

struct WeatherForecastItem : Codable {
    let weather : [WeatherInfo]
    let main : TemperatureInfo
    let dt_txt : String
}

struct City : Codable {
    let name : String
}
