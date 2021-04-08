//
//  TargetType+Default.swift
//  QueClient
//
//  Created by 子叶 on 2021/2/5.
//

import Moya

extension TargetType {
    
    var baseURL: URL {
        return Environment.current.baseURL
    }
    
    var sampleData: Data {
        return "".data(using: .utf8)!
    }
    
    var validationType: ValidationType {
        return .successAndRedirectCodes
    }
    
    /// The headers to be used in the request.
    var headers: [String: String]? {
        if let token = TSDefaults.token{
            return ["token": token]
        }
        return nil
    }
}
