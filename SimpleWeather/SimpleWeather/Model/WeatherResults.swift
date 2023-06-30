//
//  WeatherResults.swift
//  SimpleWeather
//
//  Created by siyeon park on 2023/06/30.
//

import Foundation

// MARK: - Welcome
struct WeatherResults: Codable {
    let response: WeatherResponse
}

// MARK: - Response
struct WeatherResponse: Codable {
    let header: Header
    let body: Body
}

// MARK: - Body
struct Body: Codable {
    let dataType: String
    let items: Items
    let pageNo, numOfRows, totalCount: Int
}

// MARK: - Items
struct Items: Codable {
    let item: [Item]
}

// MARK: - Item
struct Item: Codable {
    let baseDate, baseTime, category: String
    let nx, ny: Int
    let obsrValue: String
}

// MARK: - Header
struct Header: Codable {
    let resultCode, resultMsg: String
}


