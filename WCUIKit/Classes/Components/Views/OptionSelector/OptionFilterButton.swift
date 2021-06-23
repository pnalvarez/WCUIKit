//
//  OptionFilterButton.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 13/10/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

public class OptionFilterButton: UIButton {
    
    public init(frame: CGRect,
         option: String) {
        super.init(frame: frame)
        setTitle(option, for: .normal)
        setTitleColor(ThemeColors.alertGray.rawValue, for: .normal)
        titleLabel?.font = ThemeFonts.RobotoBold(12).rawValue
        titleLabel?.textAlignment = .left
        backgroundColor = .white
        layer.borderWidth = 0.5
        layer.borderColor = ThemeColors.alertGray.rawValue.cgColor
        contentHorizontalAlignment = .leading
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
