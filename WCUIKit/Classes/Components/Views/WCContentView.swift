//
//  WCContentView.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 05/05/21.
//

import UIKit

public class WCContentView: UIView {
    
    public enum ColorStyle {
        case white
        case red
        
        var color: ThemeColors {
            switch self {
            case .white:
                return .whiteThemeColor
            case .red:
                return .mainRedColor
            }
        }
    }
    
    public var style: ColorStyle = .white
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = style.color.rawValue
    }
}
