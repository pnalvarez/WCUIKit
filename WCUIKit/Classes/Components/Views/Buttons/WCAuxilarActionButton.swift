//
//  WCAuxilarActionButton.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 08/06/21.
//

import UIKit

public class WCAuxiliarActionButton: WCBaseActionButton {
    
    private enum Constants {
        static let height: CGFloat = 20
        static let fontSize: CGFloat = 16
    }
    
    public enum ColorStyle {
        case success
        case black
        
        var titleColorEnabled: UIColor {
            switch self {
            case .success:
                return ThemeColors.mainRedColor.rawValue
            case .black:
                return ThemeColors.black.rawValue
            }
        }
        
        var titleColorDisabled: UIColor {
            switch self {
            case .success:
                return ThemeColors.emptyRedColor.rawValue
            case .black:
                return ThemeColors.hex969494.rawValue
            }
        }
    }
    
    public var colorStyle: ColorStyle = .success {
        didSet {
            setupUI()
        }
    }
    
    public var enableState: State = .enabled {
        didSet {
            setupUI()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setTitleColor(ThemeColors.mainRedColor.rawValue, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel?.font = ThemeFonts.RobotoBold(Constants.fontSize).rawValue
        titleLabel?.adjustsFontSizeToFitWidth = true
        applyViewCode()
    }
    
    private func setupUI() {
        switch enableState {
        case .enabled:
            setTitleColor(colorStyle.titleColorEnabled, for: .normal)
        case .disabled:
            setTitleColor(colorStyle.titleColorDisabled, for: .normal)
        }
        isUserInteractionEnabled = enableState.isUserInteractionEnabled
    }
}

extension WCAuxiliarActionButton: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        
    }
    
    public func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(Constants.height)
        }
    }
}
