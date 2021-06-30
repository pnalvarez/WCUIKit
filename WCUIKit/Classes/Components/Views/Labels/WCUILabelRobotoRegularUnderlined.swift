//
//  WCUILabelRobotoRegularUnderlined.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 20/05/21.
//

import UIKit

public class WCUILabelRobotoRegular16UnderlinedBlack: WCUILabel {
    
    private enum Constants {
        static let fontSize: CGFloat = 16
    }

    public override var text: String? {
        didSet {
            guard let text = text else { return }
            let textRange = NSMakeRange(0, text.count)
            let attributedText = NSMutableAttributedString(string: text)
            attributedText.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: textRange)
            attributedText.addAttribute(NSAttributedString.Key.font, value: ThemeFonts.RobotoRegular(Constants.fontSize).rawValue, range: textRange)
            attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: ThemeColors.black.rawValue, range: textRange)
            self.attributedText = attributedText
            }
        }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
    }
}
