//
//  NavViewController.swift
//  NestedNav
//
//  Created by Pisit W on 18/3/2563 BE.
//  Copyright © 2563 23. All rights reserved.
//

import UIKit

protocol NavDelegate {
    func didPresent()
}

class NavViewController: UINavigationController {

    private let alwaysPoppableDelegate = AlwaysPoppableDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setNavigationBarHidden(true, animated: false)
        self.navigationBar.isOpaque = true
        
        alwaysPoppableDelegate.navigationController = self
        interactivePopGestureRecognizer?.delegate = alwaysPoppableDelegate
        
    }

}

final class AlwaysPoppableDelegate: NSObject, UIGestureRecognizerDelegate {
     weak var navigationController: UINavigationController?
     weak var originalDelegate: UIGestureRecognizerDelegate?

    override func responds(to aSelector: Selector!) -> Bool {
        if aSelector == #selector(gestureRecognizer(_:shouldReceive:)) {
            return true
        } else if let responds = originalDelegate?.responds(to: aSelector) {
            return responds
        } else {
            return false
        }
    }

    override func forwardingTarget(for aSelector: Selector!) -> Any? {
        return originalDelegate
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if let nav = navigationController, nav.isNavigationBarHidden, nav.viewControllers.count > 1 {
            // extra for nested nav viewcontrollers
            if let nested = (nav.viewControllers.last as? Nested) {
                return nested.canNestedSwipeBack
            } else if let nestedVC = (nav.viewControllers.last as? NestedViewController) {
                return (nestedVC.rootNavigation?.viewControllers.count ?? 0) <= 1
            }
            return true
        } else if let result = originalDelegate?.gestureRecognizer?(gestureRecognizer, shouldReceive: touch) {
            return result
        } else {
            return false
        }
    }
}

protocol Nested {
    var canNestedSwipeBack: Bool {get set}
}
