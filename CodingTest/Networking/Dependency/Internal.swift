//
//  Internal.swift
//  QueClient
//
//  Created by 子叶 on 2021/2/5.
//

import Moya

extension Dictionary where Key == String, Value: Any {
    
    func urlEncodingTask(_ encoding: URLEncoding = .default) -> Task {
        return .requestParameters(parameters: self, encoding: encoding)
    }
    
    func jsonEncodingTask(_ encoding: JSONEncoding = .default) -> Task {
        return .requestParameters(parameters: self, encoding: encoding)
    }
    
}
