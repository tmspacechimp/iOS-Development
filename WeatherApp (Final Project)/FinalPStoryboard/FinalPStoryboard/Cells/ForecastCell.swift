
import UIKit

class ForecastCell: UITableViewCell {

    @IBOutlet var dttextLabel: UILabel!
    @IBOutlet var wImage: UIImageView!
    @IBOutlet var wDescription: UILabel!
    @IBOutlet var wTemperature: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func displayImage(iconName : String ){
        let url = URL(string: "https://openweathermap.org/img/wn/\(iconName).png")!
        DispatchQueue.global().async {
            
            if let image = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.wImage.image = UIImage(data: image)
                }
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
