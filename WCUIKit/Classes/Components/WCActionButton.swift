//
//  DefaultActionButton.swift
//  WeCam
//
//  Created by Pedro Alvarez on 08/02/21.
//  Copyright © 2021 Pedro Alvarez. All rights reserved.
//

import UIKit

public class WCActionButton: UIButton {
    
    public enum Layout {
        case `default`
        case small
        
        var fontSize: CGFloat {
            switch self {
            case .default:
                return Constants.defaultFontSize
            case .small:
                return Constants.smallFontSize
            }
        }
        
        var height: CGFloat {
            switch self {
            case .default:
                return Constants.defaultHeight
            case .small:
                return Constants.smallHeight
            }
        }
    }
    
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
        static let defaultFontSize: CGFloat = 16
        static let smallFontSize: CGFloat = 14
        static let defaultHeight: CGFloat = 30
        static let smallHeight: CGFloat = 25
    }
    
    public var text: String? {
        didSet {
            setTitle(text, for: .normal)
        }
    }
    
    public var enableState: State = .enabled {
        didSet {
            backgroundColor = enableState.backgroundColor
            isUserInteractionEnabled = enableState.isUserInteractionEnabled
        }
    }
    
    public var layout: Layout = .default {
        didSet {
            layoutIfNeeded()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = ThemeColors.mainRedColor.rawValue
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 4
        setTitleColor(ThemeColors.whiteThemeColor.rawValue, for: .normal)
        titleLabel?.font = ThemeFonts.RobotoBold(layout.fontSize).rawValue
        titleLabel?.adjustsFontSizeToFitWidth = true
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension WCActionButton: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        
    }
    
    public func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(layout.height)
        }
    }
}
