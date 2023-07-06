//
//  WeatherDelegate.swift
//  SimpleWeather
//
//  Created by siyeon park on 2023/07/05.
//

import Foundation

// 버튼 탭시 날씨 리로드 delegate
protocol WeatherDelegate: AnyObject {
    func reloadWeather(items: WeatherResults)
}
