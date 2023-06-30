//
//  NetworkingManager.swift
//  SimpleWeather
//
//  Created by siyeon park on 2023/06/30.
//

import Foundation
import Alamofire

final class NetworkingManager {
    static let shared = NetworkingManager()

    private init() {}

    func requestWeather(baseDate: String, nx: String, ny: String, callback: (() -> ())?) {
        //http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getUltraSrtNcst?ServiceKey=pCzoWnZWI%2FzC1%2FE7QGlIWIbId7u2c4QWSg%2FdyUHMxxRvfyxVbCkbsE0nS7unqZWP3EtL9cdgDbHI%2BsTsVrnzQA%3D%3D&pageNo=1&numOfRows=1000&base_date=20230630&base_time=0600&nx=60&ny=127&dataType=JSON

        let host = "apis.data.go.kr"
        let path = "1360000/VilageFcstInfoService_2.0/getUltraSrtNcst"
        let url = "http://\(host)/\(path)"

        let urlComponents = URLComponents(string: url)

        let params: Parameters = [
            "ServiceKey": "pCzoWnZWI%2FzC1%2FE7QGlIWIbId7u2c4QWSg%2FdyUHMxxRvfyxVbCkbsE0nS7unqZWP3EtL9cdgDbHI%2BsTsVrnzQA%3D%3D",
            "pageNo": "1",
            "numOfRows": "1000",
            "dataType": "JSON",
            "base_date": baseDate,
            "base_time": "0600",
            "nx": nx,
            "ny": ny
        ]

        guard let url = urlComponents?.url else { return }

        AF.request(url,
                   method: .get,
                   parameters: params
        )
        .validate(statusCode: 200..<600)
        .response { response in
            switch response.result {
            case .success(let data):
                guard response.data != nil else { return }
                print("성공 -->> \(response)")
            case .failure(let error):
                print("실패 -->> \(error)")
            }
        }
    }
}
