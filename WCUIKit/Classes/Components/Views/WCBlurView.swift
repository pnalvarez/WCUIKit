//
//  WCBlurView.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 19/06/21.
//

import UIKit

class WCBlurView : UIView {

    var blurTintColor: UIColor! {
        set {
            toolbar.barTintColor = newValue
        }
        get {
            return toolbar.barTintColor
        }
    }
    
    private lazy var toolbar: UIToolbar = {
        // If we don't clip to bounds the toolbar draws a thin shadow on top
        self.clipsToBounds = true

        let toolbar = UIToolbar(frame: self.bounds)
        toolbar.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(toolbar, at: 0)
        let views = ["toolbar": toolbar]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[toolbar]|", options: [], metrics: nil, views: views))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[toolbar]|", options: [], metrics: nil, views: views))

        return toolbar
    }()
}
