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
    
    public enum Layout {
        case medium
        case big
        
        var height: CGFloat {
            switch self {
            case .medium:
                return Constants.mediumHeight
            case .big:
                return Constants.bigHeight
            }
        }
    }
    
    private enum Constants {
        static let mediumHeight: CGFloat = 80
        static let bigHeight: CGFloat = 150
    }
    
    private var layout: Layout
    
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
    
    public init(frame: CGRect,
                         textContainer: NSTextContainer?,
                         layout: Layout = .medium) {
        self.layout = layout
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
            make.height.equalTo(layout.height)
        }
    }
}
