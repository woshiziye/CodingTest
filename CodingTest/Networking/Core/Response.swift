//
//  Response.swift
//  QueClient
//
//  Created by 子叶 on 2021/2/5.
//

import Moya
import CleanJSON

extension Network {

    struct Response<T: Decodable>: Decodable {
        var data: T?
        var msg: String?
        var code: Int?
    }

    struct ResponseDatas<T: Decodable>: Decodable {
        var data: [T]?
        var msg: String?
        var code: Int?
    }
}


extension Moya.Response {

    func mapResponse<T: Decodable>(
        _ type: T.Type,
        atKeyPath keyPath: String? = nil,
        using decoder: JSONDecoder = CleanJSONDecoder()
    ) throws -> Network.Response<T>? {
        return try? map(Network.Response<T>.self, atKeyPath: keyPath, using: decoder)
    }

    func mapResponseDatas<T: Decodable>(
        _ type: T.Type,
        atKeyPath keyPath: String? = nil,
        using decoder: JSONDecoder = CleanJSONDecoder()
    ) throws -> Network.ResponseDatas<T>? {
        return try? map(Network.ResponseDatas<T>.self, atKeyPath: keyPath, using: decoder)
    }

    func mapDictionary() throws -> [String: Any]? {
        return try? mapJSON() as? [String : Any]
    }
}
