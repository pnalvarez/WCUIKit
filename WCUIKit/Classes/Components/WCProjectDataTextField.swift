//
//  ProjectDataTextField.swift
//  WeCam
//
//  Created by Pedro Alvarez on 04/02/21.
//  Copyright © 2021 Pedro Alvarez. All rights reserved.
//

import UIKit

public enum WCProjectDataTextFieldState {
    case normal
    case error
}

public class WCProjectDataTextField: UITextField {
    
    public var textFieldState: WCProjectDataTextFieldState = .normal {
        didSet {
            switch textFieldState {
            case .normal:
                layer.borderColor = ThemeColors.borderGray.rawValue.cgColor
            case .error:
                layer.borderColor = ThemeColors.alertRed.rawValue.cgColor
            }
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
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

extension WCProjectDataTextField: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        
    }
    
    public func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(30)
        }
    }
}
