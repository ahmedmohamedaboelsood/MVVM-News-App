//
//  UINavigationController.swift
//  MVVMNewsApp
//
//  Created by 2B on 29/10/2023.
//

import Foundation
import UIKit

extension UINavigationController{
    func pushViewControllerWithModalTransition(viewController: UIViewController) {
        setupPushTransition()
        self.pushViewController(viewController, animated: false)
    }

    func setupPushTransition () {
        let transition: CATransition = CATransition()
        transition.duration = 0.2
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
        transition.type = CATransitionType.fade
        transition.subtype = CATransitionSubtype.fromTop
        self.view.layer.add(transition, forKey: kCATransition)
    }
}
