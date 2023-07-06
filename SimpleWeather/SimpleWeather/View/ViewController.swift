//
//  ViewController.swift
//  SimpleWeather
//
//  Created by siyeon park on 2023/06/29.
//

import UIKit
import CoreLocation

final class ViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    var locationManager = CLLocationManager()
    var currentLocation: CLLocationCoordinate2D!

    var viewModel = WeatherViewModel()
    var delegate: WeatherDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        requestAuthorization()
        setupView()
        requestWeather()
    }
}

private extension ViewController {
    func setupView() {
        titleLabel.text = "기온!!!!"
        temperatureLabel.font = .systemFont(ofSize: 20)
        temperatureLabel.textColor = .red
    }

    func requestAuthorization() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()// 거리 정확도
        locationManager.requestLocation()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
        else {
            print("위치 서비스 허용 off")
        }
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("위치 업데이트!")
            print("위도 : \(location.coordinate.latitude)")
            print("경도 : \(location.coordinate.longitude)")
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    }
}

extension ViewController {
    func requestWeather() {
        viewModel.requestWeather { response in
            let item = response.response.body.items.item.first { $0.category == "T1H" }
            self.temperatureLabel.text = item?.obsrValue
            print(response)
        }
    }
}
