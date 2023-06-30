//
//  ViewController.swift
//  SimpleWeather
//
//  Created by siyeon park on 2023/06/29.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NetworkingManager.shared.requestWeather(baseDate: "20230630", nx: "55", ny: "127") {
        }
    }
}
