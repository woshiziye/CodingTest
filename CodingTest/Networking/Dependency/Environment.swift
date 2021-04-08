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
            host = "https://patient-api.quezhen.vip:8001"
        case .product:
            host = "https://patient-api.quezhen.vip:8001"
        }
        #else
        host = "https://patient-api.quezhen.vip:8001"
        #endif
        return host.url!
    }

//    var BASEH5_PATIENT_URL: URL {
//        var host = ""
//        #if DEBUG
//        switch self {
//        case .develop:
//            host = "http://patientservice.foryor.com/foryorH5"
//        case .product:
//            host = "http://patientservice.foryor.com/foryorH5"
//        }
//        #else
//        host = "http://patientservice.foryor.com/foryorH5"
//        #endif
//        return host.url!
//    }

    var DOCTOR_URL: URL {
        var host = ""
        #if DEBUG
        switch self {
        case .develop:
            host = "https://doctor-api.quezhen.vip:8001"
        case .product:
            host = "https://doctor-api.quezhen.vip:8001"
        }
        #else
        host = "https://doctor-api.quezhen.vip:8001"
        #endif
        return host.url!
    }

}

