//
//  UITabBar+.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 13/08/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit
import WCUIKit

public extension UITabBar {
    
    static func setupTabBarUI() {
        UITabBar.appearance().barTintColor = ThemeColors.mainRedColor.rawValue
        UITabBar.appearance().tintColor = .white
    }
}
