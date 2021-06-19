//
//  WCUILabelRobotoRegular14.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 14/06/21.
//

import UIKit

public class WCUILabelRobotoRegular14: UILabel {
    
    private enum Constants {
        static let fontSize: CGFloat = 14
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        font = ThemeFonts.RobotoRegular(Constants.fontSize).rawValue
    }
}
