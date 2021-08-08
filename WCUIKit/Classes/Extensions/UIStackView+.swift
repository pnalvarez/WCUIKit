//
//  UIStackView+.swift
//  Lumiere
//
//  Created by Pedro Alvarez on 13/10/20.
//  Copyright © 2020 Pedro Alvarez. All rights reserved.
//

import UIKit

public extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        for view in views {
            addArrangedSubview(view)
        }
    }
    
    func insertSpacing(of dimension: CGFloat, after view: UIView) {
        let spaceView = WCContentView(frame: .zero)
        spaceView.style = .clear
        if let index = arrangedSubviews.firstIndex(of: view) {
            insertSubview(spaceView, at: index + 1)
            spaceView.snp.makeConstraints { make in
                make.height.equalTo(dimension)
            }
        }
    }
}
