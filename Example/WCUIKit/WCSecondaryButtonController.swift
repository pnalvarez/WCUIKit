//
//  WCSecondaryButtonController.swift
//  WCUIKit_Example
//
//  Created by Pedro Alvarez on 24/04/21.
//  Copyright © 2021 CocoaPods. All rights reserved.
//

import UIKit
import WCUIKit

final class WCSecondaryButtonController: UIViewController {
    
    private lazy var testButton: WCSecondaryButton = {
        let view = WCSecondaryButton(frame: .zero)
        view.text = "Lucky Guy"
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        applyViewCode()
    }
}

extension WCSecondaryButtonController: ViewCodeProtocol {
    
    func buildViewHierarchy() {
        view.addSubview(testButton)
    }
    
    func setupConstraints() {
        testButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(102)
        }
    }
}
