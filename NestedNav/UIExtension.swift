//
//  UIExtension.swift
//  NestedNav
//
//  Created by Pisit W on 13/4/2563 BE.
//  Copyright © 2563 23. All rights reserved.
//

import UIKit
extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}
