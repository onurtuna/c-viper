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
    
}

extension GithubContributor: TargetType {
  
    public var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }

    public var path: String {
        switch self {
        case .fetch(let repoFullname):
            return "repos/\(repoFullname)/contributors"
        }
    }

    public var method: Moya.Method {
        switch self {
        case .fetch:
            return .get
        }
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        switch self {
        case .fetch:
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
