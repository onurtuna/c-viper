//
//  UrlLoggerPlugin.swift
//  Github C-Viper
//
//  Created by Onur Tuna on 28.12.2019.
//  Copyright © 2019 Onur Tuna. All rights reserved.
//

import Moya

class CompleteUrlLoggerPlugin : PluginType {
    func willSend(_ request: RequestType, target: TargetType) {
        print(request.request?.url?.absoluteString ?? "Something is wrong")
    }
}
