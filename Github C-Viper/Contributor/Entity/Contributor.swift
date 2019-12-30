//
//  Contributor.swift
//  Github C-Viper
//
//  Created by Onur Tuna on 29.12.2019.
//  Copyright © 2019 Onur Tuna. All rights reserved.
//

import Foundation

struct Contributor: Codable {

    var id: Int
    var nodeId: String
    var name: String
    var avatarUrl: String
    var detailUrl: String

    enum CodingKeys: String, CodingKey {
        case id
        case nodeId = "node_id"
        case name = "login"
        case avatarUrl = "avatar_url"
        case detailUrl = "url"
    }

}
