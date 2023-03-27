import UIKit

class ForecastViewController: UIViewController {

    private let service : Service = Service()
    private var forecastItems = [WeatherForecastItem]()
    private var weekdaysMap = [String : Int]()
    private var weekdaysMapRev = [Int : String]()
    private var nestedData = [[WeatherForecastItem]]()
    private var forecastViewController = ForecastViewController()
    
    
    @IBOutlet var loader : UIActivityIndicatorView!
    @IBOutlet var tableView : UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        let lat = 35
        let lon = 139
        loadForecast(lat: lat, lon: lon)
        
    }
    
    private func loadForecast(lat: Int, lon: Int){
        tableView.isHidden = true
        loader.startAnimating()
        service.getWeatherForecast( lat : lat,  lon: lon){ [weak self] result in
            guard let self = self else { return }
            self.loader.stopAnimating()
            DispatchQueue.main.async {
                
                switch result {
                    
                    case .success(let weatherForecastResponse):
                    self.forecastItems = weatherForecastResponse.list
                    self.transformToNestedData()
                    self.reverseMap()
                    self.tableView.isHidden = false
                    self.tableView.reloadData()
                    
                case .failure(let error):
                    let errorAlert = UIAlertController(
                        title: "Error Occured",
                        message: error.localizedDescription,
                        preferredStyle: .alert
                    )
                    errorAlert.addAction(UIAlertAction(
                        title: "OK",
                        style: .default,
                        handler: nil
                    ))
                }
            }
            
            
        }
    }
    
    private func setupTableView(){
        tableView.register( UINib(nibName: "ForecastCell", bundle: nil), forCellReuseIdentifier: "ForecastCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
  
    private func weekday(of s : String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: String(s.prefix(10)))!
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX") as Locale
        let ans = dateFormatter.weekdaySymbols[calendar.component(.weekday, from: date) - 1]
        return ans
    }
    
    
    private func transformToNestedData(){
        var weekdayIndex = 0
        nestedData.append([])
        for item in forecastItems {
            let weekday = weekday(of: item.dt_txt)
            if let index = weekdaysMap[weekday] {
                nestedData[index].append(item)
            } else {
                weekdayIndex += 1
                weekdaysMap[weekday] = weekdayIndex
                nestedData.append([item])
            }
        }
    }
    
    func reverseMap(){
        for pair in weekdaysMap { weekdaysMapRev[pair.value] = pair.key
        }
    }
    
    
    
}


extension ForecastViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return weekdaysMap.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        weekdaysMapRev[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nestedData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastCell", for: indexPath)
        if let forecastCell = cell as? ForecastCell {
            let forecastItem = nestedData[indexPath.section][indexPath.row]
            let timeText = forecastItem.dt_txt
            let starting = timeText.index(timeText.startIndex, offsetBy: 11)
            let ending = timeText.index(timeText.startIndex, offsetBy: 16)
            forecastCell.dttextLabel.text = String(forecastItem.dt_txt[starting..<ending])
            forecastCell.wDescription.text = forecastItem.weather[0].description
            forecastCell.wTemperature.text = String(Int(forecastItem.main.temp - 273.15)) + "°C  "
//            forecastCell.displayImage(iconName: forecastItem.weather[0].icon)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}
