//
//  SEPTAData.swift
//  SEPTANextToArrive
//
//  Created by Iheme, Quincy on 3/19/20.
//  Copyright © 2020 Iheme, Quincy. All rights reserved.
//

import Foundation

class SEPTAData: Codable {
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
