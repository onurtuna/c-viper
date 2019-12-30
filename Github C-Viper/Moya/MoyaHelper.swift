//
//  MoyaHelper.swift
//  Github C-Viper
//
//  Created by Onur Tuna on 30.12.2019.
//  Copyright © 2019 Onur Tuna. All rights reserved.
//

import Moya

class MoyaHelper {
    
    class func getProvider<T>(_ input: T.Type) -> MoyaProvider<T> {
        let provider = MoyaProvider<T>(plugins: [CompleteUrlLoggerPlugin()])
        return provider
    }
    
}
