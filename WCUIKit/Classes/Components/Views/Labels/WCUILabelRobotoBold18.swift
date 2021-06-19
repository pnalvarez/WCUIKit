//
//  WCUILabelRobotoBold18.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 14/06/21.
//

import UIKit

public class WCUILabelRobotoBold18: UILabel {
    
    private enum Constants {
        static let fontSize: CGFloat = 18
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        font = ThemeFonts.RobotoBold(Constants.fontSize).rawValue
    }
}
