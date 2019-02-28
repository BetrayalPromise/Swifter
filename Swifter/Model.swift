//
//  Model.swift
//  Swifter
//
//  Created by Chunyang Li 李春阳 on 2018/12/27.
//  Copyright © 2018 Chunyang Li 李春阳. All rights reserved.
//

import Foundation

struct School: Codable {
    var name: String
    var address: String
}

struct Student: Codable {
    var name: String
    var age: Int
    var weight: Float
    var schools: [School]

    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case age = "age"
        case weight = "weight"
        case schools = "school"
    }

}
