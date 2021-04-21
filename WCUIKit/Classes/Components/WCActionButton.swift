//
//  DefaultActionButton.swift
//  WeCam
//
//  Created by Pedro Alvarez on 08/02/21.
//  Copyright © 2021 Pedro Alvarez. All rights reserved.
//

import UIKit

public class WCActionButton: UIButton {
    
    public enum State {
        case enabled
        case disabled
        
        var backgroundColor: UIColor {
            switch self {
            case .enabled:
                return ThemeColors.mainRedColor.rawValue
            case .disabled:
                return ThemeColors.emptyRedColor.rawValue
            }
        }
        
        var isUserInteractionEnabled: Bool {
            return self == .enabled
        }
    }
    
    public var text: String? {
        didSet {
            setTitle(text, for: .normal)
        }
    }
    
    public var enableState: State = .enabled {
        didSet {
            backgroundColor = enableState.backgroundColor
            isUserInteractionEnabled = enableState.isUserInteractionEnabled
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = ThemeColors.mainRedColor.rawValue
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 4
        setTitleColor(ThemeColors.whiteThemeColor.rawValue, for: .normal)
        titleLabel?.font = ThemeFonts.RobotoRegular(16).rawValue
        titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
