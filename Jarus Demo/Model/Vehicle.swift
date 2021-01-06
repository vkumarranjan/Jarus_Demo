//
//  Vehicle.swift
//  Jarus Demo
//
//  Created by Vinay Nation on 03/01/21.
//

import Foundation

struct Vehicle: Codable {
    let id: Int
    let vin: String?
    let year: Int?
    let make: String?
    let value: Double
    let length: Double
    var isCollapsed = false
    //var isCollapsible = true
    
    private enum CodingKeys: String, CodingKey {
        case id
        case vin
        case year
        case make
        case value
        case length
    }
}

extension Int {
    var stringValue:String {
        return "\(self)"
    }
}
