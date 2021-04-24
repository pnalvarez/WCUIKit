//
//  ProjectDataTextView.swift
//  WeCam
//
//  Created by Pedro Alvarez on 04/02/21.
//  Copyright © 2021 Pedro Alvarez. All rights reserved.
//

import UIKit

public enum WCProjectDataTextViewState {
    case normal
    case error
}

public class WCProjectDataTextView: UITextView {
    
    public var textViewState: WCProjectDataTextFieldState = .normal {
        didSet {
            switch textViewState {
            case .normal:
                layer.borderColor = ThemeColors.borderGray.rawValue.cgColor
            case .error:
                layer.borderColor = ThemeColors.alertRed.rawValue.cgColor
            }
        }
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = ThemeColors.whiteThemeColor.rawValue
        textColor = .black
        font = ThemeFonts.RobotoRegular(16).rawValue
        layer.borderWidth = 1
        layer.cornerRadius = 4
        textAlignment = .left
    }
    
    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WCProjectDataTextView: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        
    }
    
    public func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(150)
        }
    }
}
