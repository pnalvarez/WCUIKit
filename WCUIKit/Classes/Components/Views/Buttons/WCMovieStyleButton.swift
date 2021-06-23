//
//  MovieStyleView.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 03/07/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

public class WCMovieStyleButton: WCBaseButton {
    
    private let disableColor = ThemeColors.emptyRedColor.rawValue
    private let enableColor = ThemeColors.mainRedColor.rawValue
    private let textColor = ThemeColors.whiteThemeColor.rawValue
    
    private var movieStyle: String?
    
    private var isOn: Bool = false {
        didSet {
            if isOn {
                enableButton()
            } else {
                disableButton()
            }
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func swap() {
        isOn = !isOn
    }
    
    public func setupStyle(style: String) {
        self.movieStyle = style
        setup()
    }
    
    private func setup() {
        layer.cornerRadius = 4
        titleLabel?.textAlignment = .center
        titleLabel?.textColor = textColor
        titleLabel?.font = UIFont(name: "Roboto-Regular", size: 16)
        titleLabel?.text = movieStyle
        disableButton()
    }
    
    private func enableButton() {
        backgroundColor = enableColor
    }
    
    private func disableButton() {
        backgroundColor = disableColor
    }
}

