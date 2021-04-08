//
//  Environment.swift
//  QueClient
//
//  Created by 子叶 on 2021/2/5.
//
import Foundation

public enum Environment {
    case develop
    case product
}

public extension Environment {
    
    private(set) static var current: Environment = .develop
    
    static func `switch`(to environment: Environment) {
        guard environment != current else { return }
        
        current = environment
    }
}

public extension Environment {
    
    var baseURL: URL {
        var host = ""
        #if DEBUG
        switch self {
        case .develop:
            host = "http://192.168.0.125:4000"
        case .product:
            host = "http://192.168.0.125:4000"
        }
        #else
        host = "http://192.168.0.125:4000"
        #endif
        return host.url!
    }

}

