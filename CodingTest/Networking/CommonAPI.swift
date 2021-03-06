//
//  CommonAPI.swift
//  QueClient
//
//  Created by 子叶 on 2021/2/22.
//

import Foundation

import Moya

enum CommonAPI {
    case getList
}

extension CommonAPI: TargetType {

    var path: String {
        switch self {
        case .getList:
            return "/list"
        }
    }

    var method: Moya.Method {
        switch self {
        case .getList:
            return .get
        }
    }

    var task: Task {
        switch self {
        default:
            return .requestPlain
        }
    }

}
