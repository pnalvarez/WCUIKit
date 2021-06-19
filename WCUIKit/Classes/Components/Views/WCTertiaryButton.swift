//
//  WCTertiaryButton.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 06/06/21.
//

import UIKit

public class WCTertiaryButton: WCBaseButton {
    
    private enum Constants {
        static let fontSize: CGFloat = 16
        static let borderWidth: CGFloat = 1
        static let height: CGFloat = 30
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setTitleColor(ThemeColors.hex969494.rawValue, for: .normal)
        titleLabel?.font = ThemeFonts.RobotoBold(Constants.fontSize).rawValue
        layer.borderWidth = Constants.borderWidth
        layer.borderColor = ThemeColors.hex969494.rawValue.cgColor
    }
}

extension WCTertiaryButton: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        
    }
    
    public func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(Constants.height)
        }
    }
}
