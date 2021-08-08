//
//  WCUILabelRobotoRegular16Gray.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 08/08/21.
//

import UIKit

public class WCUILabelRobotoRegular16Gray: WCUILabel {
    
    private enum Constants {
        static let fontSize: CGFloat = 16
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
                      textColor: ThemeColors.hex707070.rawValue)
    }
}