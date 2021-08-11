//
//  WCUILabelRobotoMedium14Gray.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 10/08/21.
//

public class WCUILabelRobotoMedium14Gray: WCUILabel {
    
    private enum Constants {
        static let fontSize: CGFloat = 14
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        setProperties(font: ThemeFonts.RobotoMedium(Constants.fontSize).rawValue,
                      textColor: ThemeColors.alertGray.rawValue)
    }
}
