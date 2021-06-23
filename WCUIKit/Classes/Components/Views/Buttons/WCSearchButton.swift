//
//  DefaultSearchButton.swift
//  WeCam
//
//  Created by Pedro Alvarez on 06/03/21.
//  Copyright © 2021 Pedro Alvarez. All rights reserved.
//

import UIKit

class WCSearchButton: WCBaseButton {
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setImage(UIImage(named: "lupa"), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
