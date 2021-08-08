//
//  UIView+.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 24/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//
import UIKit

public extension UIView {
    
    var allSubviews: [UIView] {
        return self.subviews.flatMap { [$0] + $0.allSubviews }
    }
    
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder?.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}

