//
//  WCAuxilarActionButton.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 08/06/21.
//

import UIKit

public class WCAuxiliarActionButton: UIButton {
    
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
    
    private enum Constants {
        static let height: CGFloat = 20
        static let fontSize: CGFloat = 16
    }
    
    public var text: String? {
        didSet {
            setTitle(text, for: .normal)
        }
    }
    
    public var enableState: State = .enabled {
        didSet {
            setTitleColor(enableState.backgroundColor, for: .normal)
            isUserInteractionEnabled = enableState.isUserInteractionEnabled
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
