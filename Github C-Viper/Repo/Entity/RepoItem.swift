//
//  RepoItem.swift
//  Github C-Viper
//
//  Created by Onur Tuna on 28.12.2019.
//  Copyright © 2019 Onur Tuna. All rights reserved.
//

import Foundation

struct RepoItem: Codable {
    
    var items: Array<Repo>
    
    enum CodingKeys: String, CodingKey {
        case items
    }
    
}
