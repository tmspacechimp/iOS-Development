

import Foundation

class Service {
    
    private var components = URLComponents()
   private let apiKey = "976307fdcc163626bf0a4c06f9243ac4"
    
    init() {
        components.scheme = "https"
       components.host = "api.openweathermap.org"
    }
    
    func gerCurrentWeather ( lat : Int , lon : Int, completion : @escaping (Result<CurrentWeatherResponse, Error>) -> ()){
        components.path = "/data/2.5/weather"
        let parameters = [
            "lat" : lat.description,
            "lon" : lon.description,
            "appid" : apiKey.description,
        ]

        components.queryItems = parameters.map { key, value in
            return URLQueryItem(name: key, value: value)
        }
//        let parLat = lat.description
//        let parLon = lon.description
//        let parApi = apiKey.description
//
        if let url = components.url{
            var request = URLRequest(url : url)
            request.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let result = try decoder.decode(CurrentWeatherResponse.self, from: data)
                        completion(.success(result))
                        return
                    } catch {
                        completion(.failure(error))
                        return
                    }
                } else {
                    completion(.failure(ServiceError.noData))
                    return
                }
            })
            task.resume()

            
        } else {
            completion(.failure(ServiceError.badParameters))
            return
        }
    }
    
    enum ServiceError : Error {
        case noData
        case badParameters
    }
    
    
    func getWeatherForecast ( lat : Int , lon : Int, completion : @escaping (Result<WeatherForecastResponse, Error>) -> ()){
        components.path = "/data/2.5/forecast"
        let parameters = [
            "lat" : lat.description,
            "lon" : lon.description,
            "appid" : apiKey.description,
        ]
        components.queryItems = parameters.map { key, value in
            return URLQueryItem(name: key, value: value)
        }
        
//        let parLat = lat.description
//        let parLon = lon.description
//        let parApi = apiKey.description
        
        if let url = components.url{
            var request = URLRequest(url : url)
            request.httpMethod = "GET"
            let task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let result = try decoder.decode(WeatherForecastResponse.self, from: data)
                        completion(.success(result))
                        return
                    } catch {
                        completion(.failure(error))
                        return
                    }
                } else {
                    completion(.failure(ServiceError.noData))
                    return
                }
            })
            task.resume()

            
        } else {
            completion(.failure(ServiceError.badParameters))
            return
        }
        

        
    }
    
}
