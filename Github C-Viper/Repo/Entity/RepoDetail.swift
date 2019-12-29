//
//  RepoDetail.swift
//  Github C-Viper
//
//  Created by Onur Tuna on 29.12.2019.
//  Copyright © 2019 Onur Tuna. All rights reserved.
//

import Foundation

struct RepoDetail: Codable {
    
    struct Owner: Codable {
        var login: String
        var avatarUrl: String
        
        enum CodingKeys: String, CodingKey {
            case login
            case avatarUrl = "avatar_url"
        }
    }
    
    var size: Int
    var stargazersCount: Int
    var forksCount: Int
    var owner: Owner
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case size
        case stargazersCount = "stargazers_count"
        case forksCount = "forks_count"
        case owner
        case description
    }
    
}
