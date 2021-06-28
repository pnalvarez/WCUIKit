//
//  WCUILabelRobotoMedium14.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 27/06/21.
//

import Foundation

public class WCUILabelRobotoMedium14: WCUILabel {
    
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
        setProperties(font: ThemeFonts.RobotoMedium(Constants.fontSize).rawValue,
                      textColor: ThemeColors.black.rawValue)
    }
}
