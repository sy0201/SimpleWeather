//
//  NetworkingManager.swift
//  SimpleWeather
//
//  Created by siyeon park on 2023/06/30.
//

import Foundation
import Alamofire

class NetworkingManager {
    
    static let shared = NetworkingManager()
    private init() {}

    func requestWeather(callback: @escaping (WeatherResults) -> ()) {
        let host = "http://apis.data.go.kr"
        let path = "1360000/VilageFcstInfoService_2.0/getUltraSrtNcst"
        let url = "\(host)/\(path)"

        let urlComponents = URLComponents(string: url)

        let params: Parameters = [
            "ServiceKey": "pCzoWnZWI%2FzC1%2FE7QGlIWIbId7u2c4QWSg%2FdyUHMxxRvfyxVbCkbsE0nS7unqZWP3EtL9cdgDbHI%2BsTsVrnzQA%3D%3D",
            "pageNo": "1",
            "numOfRows": "1000",
            "base_date": "20230706",
            "base_time": "0600",
            "nx": "60",
            "ny": "127",
            "dataType": "JSON"
        ]

        AF.request(url,
                   method: .get,
                   parameters: params
        )
        .validate(statusCode: 200..<500)
        .responseDecodable(of: WeatherResults.self)  { response in
            switch response.result {
            case .success(let data):
                guard response.data != nil else { return }
                print("성공 -->> \(data)")
                callback(data)
            case .failure(let error):
                print("실패 -->> \(error)")
            }
        }
    }
}
