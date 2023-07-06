//
//  WeatherViewModel.swift
//  SimpleWeather
//
//  Created by siyeon park on 2023/07/04.
//

import Foundation

class WeatherViewModel {

    func requestWeather(callback: @escaping (WeatherResults) -> ()) {
        NetworkingManager.shared.requestWeather { response in
            callback(response)
        }
    }
}
