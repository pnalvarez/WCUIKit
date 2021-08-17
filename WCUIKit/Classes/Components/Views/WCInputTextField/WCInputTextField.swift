//
//  DefaultInputTextField.swift
//  WeCam
//
//  Created by Pedro Alvarez on 03/02/21.
//  Copyright © 2021 Pedro Alvarez. All rights reserved.
//

import UIKit

public enum DefaultInputTextFieldState {
    case normal
    case error
    
    var borderWidth: CGFloat {
        switch self {
        case .normal:
            return 0
        case .error:
            return 1.0
        }
    }
    
    var borderColor: CGColor {
        switch self {
        case .normal:
            return UIColor.clear.cgColor
        case .error:
            return ThemeColors.alertRed.rawValue.cgColor
        }
    }
}

public class WCInputTextField: UITextField {
    
    private enum Constants {
        static let padding = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 0)
    }
    
    public var textFieldState: DefaultInputTextFieldState = .normal {
        didSet {
            layer.borderWidth = textFieldState.borderWidth
            layer.borderColor = textFieldState.borderColor
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = ThemeColors.backgroundGray.rawValue
        font = ThemeFonts.RobotoRegular(12).rawValue
        autocapitalizationType = .none
        textColor = ThemeColors.normalText.rawValue
        autocorrectionType = .no
        tintColor = ThemeColors.mainRedColor.rawValue
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Constants.padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Constants.padding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: Constants.padding)
    }
}

extension WCInputTextField: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        
    }
    
    public func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(WCDimens.Sizing.normal)
        }
    }
}
