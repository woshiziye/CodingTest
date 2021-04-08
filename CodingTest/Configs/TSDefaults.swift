//
//  TSDefaults.swift
//  CodingTest
//
//  Created by 子叶 on 2021/2/6.
//

import Foundation

class TSDefaults{

    func removeAll() {
        removeToken()
        removeUserId()
    }

    static var token: String?{
        set{ UserDefaults.standard.setValue(newValue, forKey: "::token::") }
        get{ return UserDefaults.standard.string(forKey: "::token::") }
    }

    func removeToken() {
        UserDefaults.standard.removeObject(forKey: "::token::")
    }


    static var userId: Int?{
        set{ UserDefaults.standard.setValue(newValue, forKey: "::userId::") }
        get{ return UserDefaults.standard.integer(forKey: "::userId::") }
    }

    func removeUserId() {
        UserDefaults.standard.removeObject(forKey: "::userId::")
    }


}
