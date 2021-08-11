//
//  WCDialogButton.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 14/06/21.
//

import UIKit

public class WCDialogButton: WCBaseButton {
    
    private enum Constants {
        static let height: CGFloat = 41
        static let radius: CGFloat = 14
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = ThemeColors.mainRedColor.rawValue
        setTitleColor(ThemeColors.whiteThemeColor.rawValue, for: .normal)
        titleLabel?.font = ThemeFonts.RobotoBold(18).rawValue
        layer.cornerRadius = Constants.radius
        applyViewCode()
    }
}

extension WCDialogButton: ViewCodeProtocol {
    
    public func buildViewHierarchy() {
        
    }
    
    public func setupConstraints() {
        snp.makeConstraints { make in
            make.height.equalTo(Constants.height)
        }
    }
}
