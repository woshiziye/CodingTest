//
//  UIImageView+ext.swift
//  CodingTest
//
//  Created by 子叶 on 2021/4/8.
//

import Foundation
import UIKit

extension UIImageView {
    func addCorner(cornerRadius: CGFloat) {
        self.image = self.image?.imageAddCornerRadius(cornerRadius, andSize: self.bounds.size)
    }

}
