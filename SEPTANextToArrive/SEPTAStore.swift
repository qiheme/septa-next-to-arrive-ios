//
//  SEPTAStore.swift
//  SEPTANextToArrive
//
//  Created by Iheme, Quincy on 3/20/20.
//  Copyright © 2020 Iheme, Quincy. All rights reserved.
//

import UIKit

enum ArrivalError: Error {
    case arrivalError
    case missingArrivalURL
}

class SEPTAStore {
//    private let session: URLSession = {
//        let config = URLSessionConfiguration.default
//        return URLSession(configuration: config)
//    }()
//    
//    private let view = ViewController()
//
//    func fetchSEPTAArrivals(completion: @escaping (Result<[SEPTAData], Error>) -> Void) {
//        let start = view.startingStation.text
//        let end = view.endingStation.text
//        
//        let url = SEPTAApi.septaURL(start: start, end: end)
//        let request = URLRequest(url: url)
//        let task = session.dataTask(with: request) {
//            (data, response, error) in
//
//            let result = self.processSEPTARequest(data: data, error: error)
//            OperationQueue.main.addOperation {
//                completion(result)
//            }
//        }
//        task.resume()
//    }
//    
//    func processSEPTARequest(data: Data?, error: Error?) -> Result<[SEPTAData], Error> {
//        guard let jsonData = data else {
//            return .failure(error!)
//        }
//        
//        return SEPTAApi.arrivals(fromJSON: jsonData)
//    }
}
