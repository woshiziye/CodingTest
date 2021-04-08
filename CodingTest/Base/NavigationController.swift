//
//  NavigationController.swift
//  CodingTest
//
//  Created by 子叶 on 2021/2/5.
//

import Foundation

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.tintColor = TSCOLOR_TEXT_333
    }

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.interactivePopGestureRecognizer?.delegate = self
        self.interactivePopGestureRecognizer?.isEnabled = true
        viewController.navigationItem.hidesBackButton = true
        if children.count > 0 {
            UINavigationBar.appearance().backItem?.hidesBackButton = false
        }
        super.pushViewController(viewController, animated: animated)
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}

extension NavigationController: UIGestureRecognizerDelegate{
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard self.viewControllers.count > 1 else { return false }

        if let isTransitioning = self.value(forKey: "_isTransitioning") as? Bool, isTransitioning == true {
            return false
        }
        return true
    }
}
