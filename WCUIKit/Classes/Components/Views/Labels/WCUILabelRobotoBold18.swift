//
//  WCUILabelRobotoBold18.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 14/06/21.
//

import UIKit

public class WCUILabelRobotoBold18: WCUILabel {
    
    private enum Constants {
        static let fontSize: CGFloat = 18
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setProperties(font: ThemeFonts.RobotoBold(Constants.fontSize).rawValue,
                      textColor: ThemeColors.black.rawValue)
    }
}
