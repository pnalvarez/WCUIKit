//
//  WCUILabel.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 23/06/21.
//

import UIKit

public class WCUILabel: UILabel {
    
    public struct AttributedData {
        var underlineStyle: NSUnderlineStyle
        var textFont: UIFont
        var foregroundColor: UIColor
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder: NSCoder) {
        fatalError("There is no initializer from decoder")
    }
    
    public var attributedData: AttributedData?
    
    func setProperties(font: UIFont,
                       textColor: UIColor,
                       textAlignment: NSTextAlignment? = nil) {
        self.font = font
        self.textColor = textColor
        
        if let textAlignment = textAlignment {
            self.textAlignment = textAlignment
        }
    }
    
    func setProperties(font: UIFont,
                       textColor: UIColor,
                       textAlignment: NSTextAlignment? = nil,
                       underlineStyle: NSUnderlineStyle) {
        self.attributedData = AttributedData(underlineStyle: underlineStyle,
                                             textFont: font,
                                             foregroundColor: textColor)
        
        if let textAlignment = textAlignment {
            self.textAlignment = textAlignment
        }
    }
    
    func fadeIn(_ duration: TimeInterval,
                completion: ((Bool) -> Void)? = nil) {
        alpha = 0
        isHidden = false
        UIView.animate(withDuration: duration,
                       animations: {
                        self.alpha = 1
                       }, completion: completion)
    }
    
    func fadeOut(_ duration: TimeInterval,
                 withDelay delay: TimeInterval = 0,
                 completion: ((Bool) -> Void)? = nil) {
        UIView.animate(withDuration: duration,
                       delay: delay,
                       animations: {
                        self.alpha = 0
                       }, completion: completion)
    }
}
