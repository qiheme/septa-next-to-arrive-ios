//
//  SEPTAApi.swift
//  SEPTANextToArrive
//
//  Created by Iheme, Quincy on 3/19/20.
//  Copyright © 2020 Iheme, Quincy. All rights reserved.
//

import Foundation

struct SEPTAApi {
    static func septaURL(start: String?, end: String?) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www3.septa.org"
        components.path = "/hackathon/NextToArrive/\(start!)/\(end!)/1"
        return components.url ?? URL(string: "http://www3.septa.org/hackathon/NextToArrive/Airport%20Terminal%20B/Ardmore/1")!
    }
    
    static func arrivals(fromJSON data: Data) -> Result<SEPTAResponse, Error> {
        do {
            let decoder = JSONDecoder()
            let septaResponse = try decoder.decode(Array<SEPTAResponse>.self, from: data)
            print(septaResponse)
//            let responseData = septaResponse.first
            
            return .success(septaResponse.first!)
        } catch {
            return .failure(error)
        }
    }
}

struct SEPTAResponse: Codable {
    let train: String?
    let line: String?
    let departure: String?
    let arrival: String?
    let delay: String?
    let termTrain: String?
    let termLine: String?
    let termDepartTime: String?
    let termArrivalTime: String?
    let connection: String?
    let termDelay: String?
    let isDirect: String?
    
    enum CodingKeys: String, CodingKey {
        case train = "orig_train"
        case line = "orig_line"
        case departure = "orig_departure_time"
        case arrival = "orig_arrival_time"
        case delay = "orig_delay"
        case connection = "Connection"
        case termTrain = "term_train"
        case termLine = "term_line"
        case termDepartTime = "term_depart_time"
        case termArrivalTime = "term_arrival_time"
        case termDelay = "term_delay"
        case isDirect = "isdirect"
    }
}
