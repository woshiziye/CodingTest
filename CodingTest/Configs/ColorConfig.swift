//
//  ColorConfig.swift
//  CodingTest
//
//  Created by 子叶 on 2021/2/5.
//

import Foundation

import UIKit

func TSCOLOR(_ r: CGFloat,
             _ g: CGFloat,
             _ b: CGFloat) -> UIColor{
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1)
}

func TSCOLORA(_ r: CGFloat,
              _ g: CGFloat,
              _ b: CGFloat,
              _ a: CGFloat) -> UIColor {
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: a)
}

/// 16进制色值表示法转UIColor
/// - Parameter value: hex或者hexa值
func TSCOLOR(hexORhexa value:String) -> UIColor {
    //strip off prefix
    var startIndxOffset = 0

    if value.hasPrefix("#") {startIndxOffset = 1}
    if value.hasPrefix("0x"){startIndxOffset = 2}

    let startTruncIndex = value.index(value.startIndex, offsetBy: startIndxOffset)
    let endTruncIndex = value.endIndex
    let res = value[startTruncIndex..<endTruncIndex]
    let hexStr = String(res)

    let s = Scanner.init(string: hexStr)
    var hexV:UInt64 = 0
    let fv = s.scanHexInt64(&hexV)

    //invalidated hex value
    if fv == false{return UIColor.black}
    //invalidated hex length
    if hexStr.count != 6 && hexStr.count != 8{return UIColor.black}

    var r:CGFloat = 0
    var g:CGFloat = 0
    var b:CGFloat = 0
    var a:CGFloat = 1

    if hexStr.count == 6 {
        r = CGFloat((hexV&0xFF0000)>>16) / 255.0
        g = CGFloat((hexV&0x00FF00)>>8) / 255.0
        b = CGFloat((hexV&0xFF)>>0) / 255.0
    }

    if hexStr.count == 8 {
        r = CGFloat((hexV&0xFF000000)>>24) / 255.0
        g = CGFloat((hexV&0x00FF0000)>>16) / 255.0
        b = CGFloat((hexV&0xFF00)>>8) / 255.0
        a = CGFloat((hexV&0xFF)>>0) / 255.0
    }

    return UIColor(red: r, green: g, blue: b, alpha: a)
}

let TSCOLOR_TABAR_BLUE: UIColor = TSCOLOR(hexORhexa: "#016BC7")
let TSCOLOR_BLUE: UIColor = TSCOLOR(hexORhexa: "#0068FF")

let TSCOLOR_TITLE_BLUE: UIColor = TSCOLOR(hexORhexa: "#348AFF")
let TSCOLOR_DARK_BLUE: UIColor = TSCOLOR(hexORhexa:"#4A4C5B")

let TSCOLOR_TEXT_1313: UIColor = TSCOLOR(hexORhexa: "#131313")
let TSCOLOR_TEXT_333: UIColor = TSCOLOR(hexORhexa: "#333333")
let TSCOLOR_TEXT_666: UIColor = TSCOLOR(hexORhexa: "#666666")
let TSCOLOR_TEXT_999: UIColor = TSCOLOR(hexORhexa: "#999999")
let TSCOLOR_TEXT_EEE: UIColor = TSCOLOR(hexORhexa: "#EEEEEE")
let TSCOLOR_TEXT_RED: UIColor = TSCOLOR(hexORhexa: "#FF0000")

let TSCOLOR_BTN_RED: UIColor = TSCOLOR(hexORhexa: "#FD3637")
let TSCOLOR_BTN_BLUE: UIColor = TSCOLOR(hexORhexa:"#0068FF")


let TSCOLOR_CCC: UIColor = TSCOLOR(hexORhexa: "#CCCCCC")
let TSCOLOR_C4C4: UIColor = TSCOLOR(hexORhexa: "#C4C4C4")
let TSCOLOR_F4: UIColor = TSCOLOR(hexORhexa: "#F4F4F4")
let TSCOLOR_F5: UIColor = TSCOLOR(hexORhexa: "#F5F5F5")
let TSCOLOR_LINE: UIColor = TSCOLOR(hexORhexa: "#F1F1F1")

let TSCOLOR_BG: UIColor = TSCOLOR(hexORhexa: "#F3F4FC")
let TSCOLOR_SHADOW: UIColor = TSCOLORA(0, 0, 0, 0.6)
