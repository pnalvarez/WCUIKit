//
//  UIResponder+.swift
//  WeCam
//
//  Created by Pedro Alvarez on 16/05/21.
//  Copyright © 2021 Pedro Alvarez. All rights reserved.
//

import UIKit

public extension UIResponder {
    var viewController: UIViewController? {
        return next as? UIViewController ?? next?.viewController
    }
}

