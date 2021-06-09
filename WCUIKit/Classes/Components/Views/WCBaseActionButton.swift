//
//  WCBaseActionButton.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 08/06/21.
//

import UIKit

public class WCBaseActionButton: UIButton {
    
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
}
