//
//  ViewController.swift
//  SimpleWeather
//
//  Created by siyeon park on 2023/06/29.
//

import UIKit
import CoreLocation

final class ViewController: UIViewController {

    var locationManager = CLLocationManager()
    var currentLocation:CLLocationCoordinate2D!

    override func viewDidLoad() {
        super.viewDidLoad()

        requestAuthorization()

        NetworkingManager.shared.requestWeather(baseDate: "20230630", nx: "55", ny: "127") {
        }
    }
}

private extension ViewController {
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
            NetworkingManager.shared.requestWeather(baseDate: "20230630", nx: "\(location.coordinate.latitude)", ny: "\(location.coordinate.longitude)") {
            }
        }
    }

     func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(#function)
    }
}
