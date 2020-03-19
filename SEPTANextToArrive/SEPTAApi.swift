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
}
