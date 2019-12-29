//
//  FileService.swift
//  Github C-Viper
//
//  Created by Onur Tuna on 29.12.2019.
//  Copyright © 2019 Onur Tuna. All rights reserved.
//

import Moya

public enum FileService {
    
    case download(url: String)
    
}

extension FileService: TargetType {
    
    public var baseURL: URL {
        switch self {
        case .download(let url):
            return URL(string: url)!
        }
    }
    
    public var path: String {
        return ""
    }
    
    public var method: Moya.Method {
        return .get
    }

    public var sampleData: Data {
        return "Something went wrong".data(using: .utf8)!
    }

    public var task: Task {
        return .requestPlain
    }

    public var validate: Bool {
        return true
    }

    public var headers: [String : String]? {
        return nil
    }

    private var parameters: [String: Any]? {
        return nil
    }
    
}
