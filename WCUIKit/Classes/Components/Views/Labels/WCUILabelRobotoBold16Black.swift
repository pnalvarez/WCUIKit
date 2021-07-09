//
//  WCUILabelRobotoBold16.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 27/06/21.
//

import UIKit

public class WCUILabelRobotoBold16Black: WCUILabel {
    
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
        setProperties(font: ThemeFonts.RobotoBold(Constants.fontSize).rawValue,
                      textColor: ThemeColors.black.rawValue)
    }
}