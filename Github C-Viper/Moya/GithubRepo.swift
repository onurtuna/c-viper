//
//  Github.swift
//  Github C-Viper
//
//  Created by Onur Tuna on 28.12.2019.
//  Copyright © 2019 Onur Tuna. All rights reserved.
//

import Moya

public enum GithubRepo {
    
    case search(page: Int)
    case detail(repoFullname: String)
    
}

extension GithubRepo: TargetType {
  
    public var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }

    public var path: String {
        switch self {
        case .search:
            return "/search/repositories"
        case .detail(let repoFullname):
            return "/repos/\(repoFullname)"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .search:
            return .get
        case .detail:
            return .get
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case .search(let page):
            return .requestParameters(parameters: ["q" : "language:swift",
                         "page" : page,
                         "per_page": "25"],
            encoding: URLEncoding.default)
        case .detail:
            return .requestPlain
        }
    }

    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }

    public var validationType: ValidationType {
        return .successCodes
    }
    
}
