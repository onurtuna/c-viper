//
//  ContributorDetail.swift
//  Github C-Viper
//
//  Created by Onur Tuna on 30.12.2019.
//  Copyright © 2019 Onur Tuna. All rights reserved.
//

import Foundation

struct ContributorDetail: Codable {
    
    var login: String
    var name: String
    var id: Int
    var htmlUrl: String
    var company: String
    var blog: String
    var location: String
    var email: String
    var bio: String
    var publicReposCount: Int
    var followersCount: Int
    var followingCount: Int
    
    enum CodingKeys: String, CodingKey {
        case login
        case name
        case id
        case htmlUrl = "html_url"
        case company
        case blog
        case location
        case email
        case bio
        case publicReposCount = "public_repos"
        case followersCount = "followers"
        case followingCount = "following"
    }
    
}
