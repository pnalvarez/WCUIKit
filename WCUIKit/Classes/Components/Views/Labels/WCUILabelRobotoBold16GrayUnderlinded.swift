//
//  WCUILabelRobotoBold16GrayUnderlinded.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 28/08/21.
//
import UIKit

public class WCUILabelRobotoBold16GrayUnderlinded: WCUILabel {
    
    private enum Constants {
        static let fontSize: CGFloat = 16
    }
    
    public override var text: String? {
        didSet {
            guard let text = text else { return }
            let textRange = NSMakeRange(0, text.count)
            let attributedText = NSMutableAttributedString(string: text)
            attributedText.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: textRange)
            attributedText.addAttribute(NSAttributedString.Key.font, value: ThemeFonts.RobotoBold(Constants.fontSize).rawValue, range: textRange)
            attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: ThemeColors.hex707070.rawValue, range: textRange)
            self.attributedText = attributedText
        }
    }
}
