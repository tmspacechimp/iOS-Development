

import UIKit
import CoreLocation

class TodayViewController: UIViewController {
    
    @IBOutlet private var blur : UIVisualEffectView!
    @IBOutlet private var loader : UIActivityIndicatorView!
    @IBOutlet private var wImage : UIImageView!
    @IBOutlet private var wCity : UILabel!
    @IBOutlet private var wGeneral : UILabel!
    @IBOutlet private var wClouds : UILabel!
    @IBOutlet private var wHumidity : UILabel!
    @IBOutlet private var wPressure : UILabel!
    @IBOutlet private var wWind : UILabel!
    @IBOutlet private var wDirection : UILabel!
    
    private let service = Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let lat = 35
        let lon = 139
        loadData(lat: lat , lon: lon)
    
    }
    
    func loadData(lat: Int, lon: Int){
        blur.isHidden = false
        loader.startAnimating()
        service.gerCurrentWeather( lat : lat,  lon: lon){
            [weak self] result in
            guard let self = self else { return }
            self.loader.stopAnimating()
            self.blur.isHidden = true
            DispatchQueue.main.async {
            switch result {
                case .success(let currentWeatherResponse):
                self.wCity.text = currentWeatherResponse.name
                self.wGeneral.text = String(Int(currentWeatherResponse.main.temp - 273.15)) + "°C | " + String(currentWeatherResponse.weather[0].main)
                self.wClouds.text = String(currentWeatherResponse.clouds.all) + " %"
                self.wHumidity.text = String(currentWeatherResponse.main.humidity) + " mm"
                self.wPressure.text = String(currentWeatherResponse.main.pressure) + " hPa"
                self.wWind.text = String(currentWeatherResponse.wind.speed) + " km/h"
                self.wDirection.text = String(currentWeatherResponse.wind.deg) + "°"
                let url = URL(string: "https://openweathermap.org/img/wn/\(currentWeatherResponse.weather[0].icon).png")!
                DispatchQueue.global().async {
                    
                    if let image = try? Data(contentsOf: url) {
                        DispatchQueue.main.async {
                            self.wImage.image = UIImage(data: image)
                        }
                    }
                }
                                        
                case .failure(let error):
                    print(error)
            }
            }
        }
        
    }
    


}
