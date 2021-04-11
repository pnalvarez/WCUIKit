//
//  ProjectDataTextView.swift
//  WeCam
//
//  Created by Pedro Alvarez on 04/02/21.
//  Copyright © 2021 Pedro Alvarez. All rights reserved.
//

import UIKit

public enum ProjectDataTextViewState {
    case normal
    case error
}

public class ProjectDataTextView: UITextView {
    
    public var textViewState: ProjectDataTextFieldState = .normal {
        didSet {
            switch textViewState {
            case .normal:
                layer.borderColor = ThemeColors.borderGray.rawValue.cgColor
            case .error:
                layer.borderColor = ThemeColors.alertRed.rawValue.cgColor
            }
        }
    }
    
    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        backgroundColor = ThemeColors.whiteThemeColor.rawValue
        textColor = .black
        font = ThemeFonts.RobotoRegular(16).rawValue
        layer.borderWidth = 1
        layer.cornerRadius = 4
        textAlignment = .left
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
