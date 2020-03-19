//
//  SEPTAApi.swift
//  SEPTANextToArrive
//
//  Created by Iheme, Quincy on 3/19/20.
//  Copyright © 2020 Iheme, Quincy. All rights reserved.
//

import Foundation

struct SEPTAApi {
    private static func septaURL(start: String?, end: String?) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www3.septa.org"
        let encodedStart = start?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        let endcodedEnd = end?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        components.path = "/hackathon/NextToArrive/\(encodedStart)/\(endcodedEnd)/1"
        return components.url ?? URL(string: "http://www3.septa.org/hackathon/NextToArrive/Airport%20Terminal%20B/Ardmore/1")!
    }
}
