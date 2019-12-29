//
//  Repo.swift
//  Github C-Viper
//
//  Created by Onur Tuna on 28.12.2019.
//  Copyright © 2019 Onur Tuna. All rights reserved.
//

import Foundation
import Moya

struct Repo: Codable {

    var id: Int
    var nodeId: String
    var name: String
    var fullname: String

    enum CodingKeys: String, CodingKey {
        case id
        case nodeId = "node_id"
        case name
        case fullname = "full_name"
    }

}
