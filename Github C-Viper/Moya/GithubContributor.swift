//
//  GithubContributor.swift
//  Github C-Viper
//
//  Created by Onur Tuna on 30.12.2019.
//  Copyright © 2019 Onur Tuna. All rights reserved.
//

import Moya

public enum GithubContributor {
    
    case fetch(repoFullname: String)
    case detail(url: String)
    
}

extension GithubContributor: TargetType {
  
    public var baseURL: URL {
        switch self {
        case .detail(let url):
            return URL(string: url)!
        default:
            return URL(string: "https://api.github.com")!
        }
        
    }

    public var path: String {
        switch self {
        case .fetch(let repoFullname):
            return "repos/\(repoFullname)/contributors"
        case .detail:
            return ""
        }
    }

    public var method: Moya.Method {
        return .get
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        return .requestPlain
    }

    public var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }

    public var validationType: ValidationType {
        return .successCodes
    }
    
}
