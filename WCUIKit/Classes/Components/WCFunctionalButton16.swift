//
//  WCFunctionalButton.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 29/04/21.
//

import UIKit

public class WCFunctionalButton16: UIButton {
    
    var text: String? {
        didSet {
            setTitle(text, for: .normal)
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel?.font = ThemeFonts.RobotoBold(16).rawValue
        setTitleColor(ThemeColors.mainRedColor.rawValue, for: .normal)
    }
}
