//
//  WCSecondaryButton.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 24/04/21.
//

import UIKit

public class WCSecondaryButton: WCBaseButton {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 4
        backgroundColor = ThemeColors.hexe3e0e0.rawValue
        setTitleColor(.black, for: .normal)
        titleLabel?.font = ThemeFonts.RobotoRegular(16).rawValue
        clipsToBounds = true
    }
}

extension WCSecondaryButton: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        
    }
    
    public func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(32)
        }
    }
}
