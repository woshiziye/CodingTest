//
//  TSBorderRadius.swift
//  QueClient
//
//  Created by 子叶 on 2021/2/5.
//

import UIKit

//MARK: - 圆角/边框
func TSViewBorder( _ view: UIView, _ width: CGFloat, _ color: UIColor) {
    view.layer.borderColor = color.cgColor
    view.layer.borderWidth = width
}

func TSViewRadius( _ view: UIView, _ radius: CGFloat) {
    view.layer.cornerRadius = radius
    view.layer.masksToBounds = true
}

func TSViewBorderRaduis( _ view: UIView, _ width: CGFloat, _ color: UIColor, _ radius: CGFloat) {
    TSViewBorder(view, width, color)
    TSViewRadius(view, radius)
}

func TSShadow(_ view:UIView){
    view.layer.shadowColor = TSCOLOR(hexORhexa: "#CCCCCC").cgColor
//    view.layer.shadowColor = UIColor.red.cgColor
    view.layer.shadowRadius = 8
    view.layer.shadowOffset = .zero
    view.layer.shadowOpacity = 1
}
