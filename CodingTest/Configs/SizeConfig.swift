//
//  SizeConfig.swift
//  CodingTest
//
//  Created by 子叶 on 2021/2/5.
//

import Foundation

import UIKit

let NAV_HEIGHT: CGFloat = UIApplication.shared.windows.filter({$0.isKeyWindow}).first!.safeAreaInsets.bottom > 0 ? 88 : 64
let SAFEAREA_BOTTOM_HEIGHT: CGFloat = UIApplication.shared.windows.filter({$0.isKeyWindow}).first!.safeAreaInsets.bottom
let SCREEN_WIDTH    = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT   = UIScreen.main.bounds.size.height
let SCREEN_FRAME    = UIScreen.main.bounds

func TSBaseLine( _ a: CGFloat) -> CGFloat {
    return a * SCREEN_WIDTH / 375.0
}
