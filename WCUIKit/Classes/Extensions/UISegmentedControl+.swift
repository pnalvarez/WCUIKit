//
//  UISegmentedControl+.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 12/10/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

public extension UISegmentedControl {
    
    static func setupSegmentedControlUI() {
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: ThemeColors.hex969494.rawValue, NSAttributedString.Key.font: ThemeFonts.RobotoRegular(16).rawValue], for: .normal)
    }
}
