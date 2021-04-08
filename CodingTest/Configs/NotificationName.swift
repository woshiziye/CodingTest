//
//  NotificationName.swift
//  CodingTest
//
//  Created by 子叶 on 2021/2/17.
//

import Foundation

import UIKit

enum NotiConfig: String {
    ///登录成功
    case loginSucceed
}

func TSNotification(post name: NotiConfig,userInfo:[AnyHashable:Any]?=nil) {
    NotificationCenter.default.post(name: .init(rawValue: name.rawValue), object: nil, userInfo: userInfo)
}

func TSNotification(observer: Any, selector: Selector, name: NotiConfig) {
    NotificationCenter.default.addObserver(observer, selector: selector, name: .init(rawValue: name.rawValue), object: nil)
}

func TSNotification(remove observer: Any) {
    NotificationCenter.default.removeObserver(observer)
}
