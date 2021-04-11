//
//  DefaultActionButton.swift
//  WeCam
//
//  Created by Pedro Alvarez on 08/02/21.
//  Copyright © 2021 Pedro Alvarez. All rights reserved.
//

import UIKit

public class WCActionButton: UIButton {
    
    public var text: String? {
        didSet {
            setTitle(text, for: .normal)
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = ThemeColors.mainRedColor.rawValue
        layer.cornerRadius = 4
        setTitleColor(ThemeColors.whiteThemeColor.rawValue, for: .normal)
        titleLabel?.font = ThemeFonts.RobotoRegular(16).rawValue
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
