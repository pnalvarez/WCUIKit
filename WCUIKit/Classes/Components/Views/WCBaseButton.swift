//
//  WCBaseButton.swift
//  WCUIKit
//
//  Created by Pedro Alvarez on 19/06/21.
//

import UIKit

public class WCBaseButton: UIButton {
    
    public var text: String? {
        didSet {
            setTitle(text, for: .normal)
        }
    }
}
