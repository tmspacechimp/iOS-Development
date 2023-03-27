

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    
    public let location = CLLocationManager()
    
    override func viewDidLoad() {

       super.viewDidLoad()

        location.requestAlwaysAuthorization()
        location.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled(){
            location.delegate = self
            location.desiredAccuracy = kCLLocationAccuracyHundredMeters
            location.startUpdatingLocation()
        }
        var currentLocation : CLLocation!
        switch location.authorizationStatus{
        case .restricted, .denied: currentLocation = nil
        default: currentLocation = location.location
        }

    }


}

