//
//  WCUILabelRobotoRegular14.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 14/06/21.
//

import UIKit

public class WCUILabelRobotoRegular14: WCUILabel {
    
    private enum Constants {
        static let fontSize: CGFloat = 14
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        setProperties(font: ThemeFonts.RobotoRegular(Constants.fontSize).rawValue,
                      textColor: ThemeColors.black.rawValue)
    }
}
