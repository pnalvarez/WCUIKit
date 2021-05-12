//
//  WCSmallAuxiliarButton.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 08/05/21.
//

import UIKit

public class WCSmallAuxiliarButton: UIButton {
    
    private enum Constants {
        static let cornerRadius: CGFloat = 4
        static let height: CGFloat = 25
    }
    
    public var text: String? {
        didSet {
            setTitle(text, for: .normal)
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = ThemeColors.hexe3e0e0.rawValue
        setTitleColor(ThemeColors.black.rawValue, for: .normal)
        titleLabel?.font = ThemeFonts.RobotoRegular(10).rawValue
        clipsToBounds = true
        layer.cornerRadius = Constants.cornerRadius
        applyViewCode()
    }
}

extension WCSmallAuxiliarButton: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        
    }
    
    public func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(Constants.height)
        }
    }
}
